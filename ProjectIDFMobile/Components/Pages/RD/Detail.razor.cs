using System;
using System.Net.Http.Json;
using BlazorBootstrap;
using Microsoft.AspNetCore.Components;
using ProjectIDFMobile.Models.dtoModel;
using ProjectIDFMobile.Models;

namespace ProjectIDFMobile.Components.Pages.RD
{


	public partial class Detail
	{
        [Parameter]
        public string ?article { get; set; }

        [Inject]
        protected HttpClient? Http { get; set; }

        public RdActualPlanDto ?rdActualPlans { get; set; }
        public List<RdActualPlanDto> ?rdActualPlanDtos { get; set; }
        public List<RdActualPlanDto>? rdActualPlanDtosHistory { get; set; }
        public LogingModel logingModel = new LogingModel();

        private int artilceInt { get; set; }

        private string ?Token;

        protected override async Task OnInitializedAsync()
        {
            try
            {
                //await authService.LoginAsync(logingModel);
                Token =  authService.GetAuthToken();
                await FeatchAPI();
            }
            catch(Exception ex)
            {
                Console.Write(ex.ToString());
            }
        }

        private async Task FeatchAPI()
        {
            if (!string.IsNullOrEmpty(Token))
            {
                rdActualPlans = await Http.GetFromJsonAsync<RdActualPlanDto>($"/api/RdActual/articleitem/onarticle/{article}");
                rdActualPlanDtosHistory = await Http.GetFromJsonAsync<List<RdActualPlanDto>>($"/api/RdActual/articleitem/history/{article}");
            }
        }

        private async Task<GridDataProviderResult<RdActualPlanDto>> DataProvider(GridDataProviderRequest<RdActualPlanDto> request)
        {
            if (rdActualPlanDtosHistory is null)
            {
                await OnInitializedAsync();
            }

            var filterData = request.ApplyTo(rdActualPlanDtosHistory.AsQueryable());
            artilceInt = int.Parse(article);

            return await Task.FromResult(request.ApplyTo(rdActualPlanDtosHistory.Where(a => a.Article == artilceInt)));
        }
    }
}

