using System.Net.Http.Headers;
using System.Text;
using Newtonsoft.Json;


#if IOS || MACCATALYST
using Foundation;
#elif ANDROID
using Xamarin.Essentials;
#endif


public class AuthService
{
    private readonly HttpClient _httpClient;
    private string keyToken;
    public AuthService(HttpClient httpClient)
    {
        _httpClient = httpClient;
    }

    public async Task<string> LoginAsync(string username, string password)
    {

        var loginData = new
        {
            Username = username,
            Password = password
        };

        var jsonContent = JsonConvert.SerializeObject(loginData);
        var content = new StringContent(jsonContent, Encoding.UTF8, "application/json");

        keyToken = "m8*12lmVAUY";
        _httpClient.DefaultRequestHeaders.Add("Api_Key", keyToken);

        var response = await _httpClient.PostAsync("/Auth/auth/login/", content);

        if (!response.IsSuccessStatusCode){

        }


        var responseContent = await response.Content.ReadAsStringAsync();
        var loginResponse = JsonConvert.DeserializeObject<Response>(responseContent);
        SaveAuthToken(loginResponse.Token);
        return loginResponse.Token;
    }

   public void SaveAuthToken(string token)
    {
        if (string.IsNullOrEmpty(token))
            return;

        #if IOS || MACCATALYST
        NSUserDefaults.StandardUserDefaults.SetString(token, "auth_token");
        #elif ANDROID
        Xamarin.Essentials.Preferences.Set("authToken", token);
        #endif

        SetAuthorizationHeader(_httpClient, token);
    }

    public string GetAuthToken()
    {
        string token = string.Empty;

        #if IOS || MACCATALYST
        token = NSUserDefaults.StandardUserDefaults.StringForKey("auth_token");
        #elif ANDROID
        token = Xamarin.Essentials.Preferences.Get("authToken", null);
        #endif

        return token ?? string.Empty;
    }

    public void ClearAuthToken()
    {
        #if IOS || MACCATALYST
        NSUserDefaults.StandardUserDefaults.RemoveObject("auth_token");
        #elif ANDROID
        Xamarin.Essentials.Preferences.Remove("authToken");
        #endif
    }

    public void SetAuthorizationHeader(HttpClient httpClient, string token)
    {
        if (!string.IsNullOrEmpty(token))
        {
            httpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
        }
    }
}




public class Response
{
    public string? Token { get; set; }
}
