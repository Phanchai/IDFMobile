using System;
namespace ProjectIDFMobile.Class
{
	public class IpService
	{
		private readonly HttpClient _httpClient;

		public IpService(HttpClient httpClient)
		{
			_httpClient = httpClient;
		}

		public async Task<string> GetClientIpAddressAsync()
		{
			var response = await _httpClient.GetStringAsync("https://api.ipify.org?format=json");
            dynamic ipInfo = Newtonsoft.Json.JsonConvert.DeserializeObject(response);
            return ipInfo.ip;
        }
    }
}

