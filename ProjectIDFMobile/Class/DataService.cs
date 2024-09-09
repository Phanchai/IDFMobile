using System;
using ProjectIDFMobile.Models;
using System.Net;
using ProjectIDFMobile.Class;
using Microsoft.AspNetCore.Components;
using System.Text;
using System.Net.Http.Json;
using System.Net.Http.Headers;

namespace ProjectIDFMobile.Class
{
	public partial class DataService
	{
		private readonly HttpClient _httpClient;
        private readonly AuthService _authService;

        public static List<RdBrand>? RdBrands { get; set; }
        public static List<RdDraftman>? RdDraftmen { get; set; }
        public static List<RdCaoStandard>? RdCap { get; set; }
        public static List<RdHeadProject>? RdProjects { get; set; }
        public static List<RdTeam>? RdTeams { get; set; }
        public static List<RdMonth>? RdMonths { get; set; }

        public static List<RdActual>? rdActuals { get; set; }
        public static List<RdListReport>? rdListReports { get; set; }
        public static List<RdCalendar>? rdCalendars { get; set; }
        public static List<RdActualPlanOption>? rdActualPlanOptions { get; set; }
        public static List<RdChart>? rdCharts { get; set; }

        public LogingModel logingModel { get; set; } = new LogingModel();
        public string? Token, IPAddress;

        public DataService(HttpClient httpClient,AuthService authService)
		{
			_httpClient = httpClient;
            _authService = authService;

        }

        public async Task LoadDataAsync()
        {
          RdBrands = await _httpClient.GetFromJsonAsync<List<RdBrand>>("/api/Options/brand");
          RdDraftmen = await _httpClient.GetFromJsonAsync<List<RdDraftman>>("/api/Options/draftman");
          RdCap = await _httpClient.GetFromJsonAsync<List<RdCaoStandard>>("/api/Options/model");
          RdProjects = await _httpClient.GetFromJsonAsync<List<RdHeadProject>>("/api/Options/project");
          RdTeams = await _httpClient.GetFromJsonAsync<List<RdTeam>>("/api/SelectDraftmanAll/team");
          RdMonths = await _httpClient.GetFromJsonAsync<List<RdMonth>>("/api/Options/month");
          rdActuals = await _httpClient.GetFromJsonAsync<List<RdActual>>("/api/RdActual/articleitem");
          rdListReports = await _httpClient.GetFromJsonAsync<List<RdListReport>>("/api/SelectDraftmanAll/ListReports");
          rdCalendars = await _httpClient.GetFromJsonAsync<List<RdCalendar>>("/api/RdActual/articleitem/calendar");
          rdActualPlanOptions = await _httpClient.GetFromJsonAsync<List<RdActualPlanOption>>($"/api/SelectDraftmanAll/draftman/calendaronly");
        }

		public async Task RefreshDataAsync()
		{
            await LoadDataAsync();
        }
	}
}

