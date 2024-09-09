
using Newtonsoft.Json;
using System.Net.Http.Json;
using System.Net;
using ProjectIDFMobile.Class;
using Microsoft.AspNetCore.Components;
using ProjectIDFMobile.Models;
using System.Text;
using System.Net.Http;
using Microsoft.Maui.Storage;
using System.Net.Http.Headers;
using System.Diagnostics;


namespace ProjectIDFMobile;


[XamlCompilation(XamlCompilationOptions.Compile)]
public partial class Login : ContentPage
{
    [Inject]
    protected HttpClient? Http { get; set; }
    private readonly AuthService _authService;
    private readonly DataService _dataService;

    private Cryptigraphy cryptigraphy = new Cryptigraphy();

    [Inject]
    private  IpService _ip { get; set; }

    [Inject]
    protected NavigationManager NV { get; set; }

    public LogingModel logingModel = new LogingModel();
    public string? Token,IPAddress,keyToken;
  
    public Login(HttpClient httpClient,AuthService authService,DataService dataService)
	{
        InitializeComponent();
        Http = httpClient;
        _authService = authService;
        _dataService = dataService;

        InitializeAsync();
    }
    private async void InitializeAsync()
    {
        try
        {
            await _authService.LoginAsync(UsernameEntry.Text,PasswordEntry.Text);
            Token = _authService.GetAuthToken();

            var postAPI_IP = "api/IpCheck/Country";
            var myIp = await GetClientIpAddress();
            var content = new StringContent(JsonConvert.SerializeObject(new
            {
                IPAddress = myIp
            }),Encoding.UTF8,"application/json");
            var response = await Http.PostAsync(postAPI_IP,content);
            response.EnsureSuccessStatusCode();
            
            var responseContent = await response.Content.ReadAsStringAsync();
            var apiResponse  = JsonConvert.DeserializeObject<TokenResponse>(responseContent);
            if(apiResponse?.Country == "TH")
            {

                if (!string.IsNullOrEmpty(UsernameEntry.Text) || !string.IsNullOrEmpty(PasswordEntry.Text))
                {
                    var login = await Http.GetAsync($"/api/GHP/select/usermanager/{UsernameEntry.Text}");
                    if (login.StatusCode == HttpStatusCode.OK)
                    {
                        await APILoad();
                        Application.Current.MainPage = new MainPage(_authService,Http);
                    }
                }
                else
                {
                    await DisplayAlert("Login Failed", "Please enter both username and password", "OK");
                    return;
                }
            }
            else
            {
                await DisplayAlert("Access Denied", "You are not allowed to access this application.", "OK");
            }
        }
        catch(Exception ex)
        {
            Debug.WriteLine(ex.ToString());
            await DisplayAlert("Login Failed", ex.ToString(), "OK");
        }
    }
    public async Task<string> GetClientIpAddress()
    {
        var httpClient = new HttpClient();
        var reponse = await httpClient.GetStringAsync("https://api.ipify.org");
        return reponse;
    }

    private async Task APILoad()
    {
        try
        {

            cryptigraphy.SaveToken(Token);

            if (!string.IsNullOrEmpty(Token))
            {
                await LoadAPI();
                //DisplayAlert("Token",Token,"OK");
            }
        }
        catch(Exception ex)
        {
            await DisplayAlert("ERROR", ex.Message, "OK");
        }
        
    }

    private async Task LoadAPI()
    {
        DataService.RdBrands = await Http.GetFromJsonAsync<List<RdBrand>>("/api/Options/brand");
        DataService.RdDraftmen = await Http.GetFromJsonAsync<List<RdDraftman>>("/api/Options/draftman");
        DataService.RdCap = await Http.GetFromJsonAsync<List<RdCaoStandard>>("/api/Options/model");
        DataService.RdProjects = await Http.GetFromJsonAsync<List<RdHeadProject>>("/api/Options/project");
        DataService.RdTeams = await Http.GetFromJsonAsync<List<RdTeam>>("/api/SelectDraftmanAll/team");
        DataService.RdMonths = await Http.GetFromJsonAsync<List<RdMonth>>("/api/Options/month");
        DataService.rdActuals = await Http.GetFromJsonAsync<List<RdActual>>("/api/RdActual/articleitem");
        DataService.rdListReports = await Http.GetFromJsonAsync<List<RdListReport>>("/api/SelectDraftmanAll/ListReports");
        DataService.rdCalendars = await Http.GetFromJsonAsync<List<RdCalendar>>("/api/RdActual/articleitem/calendar");
        DataService.rdActualPlanOptions = await Http.GetFromJsonAsync<List<RdActualPlanOption>>($"/api/SelectDraftmanAll/draftman/calendaronly");
    }

    private async Task CheckAccount()
    {
        /*
        try
        {
            if (!string.IsNullOrEmpty(UsernameEntry.Text) || !string.IsNullOrEmpty(PasswordEntry.Text))
            {
                var login = await Http.GetAsync($"/api/GHP/select/usermanager/{UsernameEntry.Text}");
                if (login.StatusCode == HttpStatusCode.OK)
                {
                    await APILoad();
                    Application.Current.MainPage = new MainPage(_authService,Http);
                }
                else
                {
                    await DisplayAlert("Login Failed", "Invalid username or password", "OK");
                }
            }
            else
            {
                await DisplayAlert("Login Failed", "Please enter both username and password", "OK");
                return;
            }
        }
        catch(Exception ex)
        {
            await DisplayAlert("ERROR",ex.ToString(),"OK");
        }
    */
    }

    private async void Button_Clicked(object sender, EventArgs e)
    {
         await CheckAccount();
    }
    private async void OnSignUpTapped(object sender, EventArgs e)
    {

    }
    public class TokenResponse
    {
        public string ?Country { get; set; }
        public string? Token { get; set; }
    }
}
