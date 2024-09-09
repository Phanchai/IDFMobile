using System.Net;
using ProjectIDFMobile.Models;
using ProjectIDFMobile.Models.dtoModel;
using BlazorBootstrap;
using Microsoft.AspNetCore.Components;
using System.Net.Http.Json;
using CurrieTechnologies.Razor.SweetAlert2;
using ProjectIDFMobile.Components.Pages.Options;
using System.Text;
using System.Net.Http.Headers;
using ProjectIDFMobile.Class;

namespace ProjectIDFMobile.Components.Pages
{
    public partial class Home
    {
        [Inject]
        protected HttpClient? Http { get; set; }

        [Inject]
        protected PreloadService PreloadService { get; set; } = default!;

        [Inject]
        protected SweetAlertService? Swal { get; set; }

        [Inject]
        protected IServiceProvider? ServiceProvider { get; set; }

        private ConfirmDialog dialog = default!, dialog2 = default!;

        private Collapse collapse1 = default!;

        private BarChart barChart = default!;

        public DateTime realtimeDays = DateTime.Now;

        int currentYear = DateTime.UtcNow.Year;

        //////////////Table/////////////
        private List<RdActual>? rdActuals { get; set; }
       private List<RdListReport>? rdListReports { get; set; }
        private List<RdCalendar>? rdCalendars = new();
        private List<RdActualPlanOption>? rdActualPlanOptions = new();
        private List<RdChart>? rdCharts { get; set; }
        private RdQueryModel? rdQueryModel;
        public List<RdActualPlanDto>? rdActualPlanDtos { get; set; }
        private BarChartOptions barChartOptions = default!;
        public List<RdTeam>? rdTeams { get; set; }
        public List<RdDraftman>? rdDraftmen { get; set; }
        //public DataService ?dataService { get; set; }

        private string? HeaderSet, MessageSet;

        private int selectDraft, selectTeam, TeamItem;
        private bool IsDraftSelectDisable => TeamItem == 0;
        private int Year;
        private ChartData chartData = default!;

        private LogingModel logingModel = new LogingModel();

        public string? Token;

        //OnInitializedAsync
        protected override async Task OnInitializedAsync()
        {
            try
            {
                PreloadService.Show(SpinnerColor.Light, "Loading...");
                Year = realtimeDays.Year;
                Token = AuthComset.GetAuthToken();
                if (!string.IsNullOrEmpty(Token))
                {
                    
                    await LoadData();
                    await LabelHead(Year);
                    //await RenderManhattanAsync();
                }
            }
            catch (Exception ex)
            {
                HeaderSet = "ERROR";
                MessageSet = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
            finally
            {
                PreloadService.Hide();
            }
        }

        ///Grid
        private async Task<GridDataProviderResult<RdActual>> DataProvider(GridDataProviderRequest<RdActual> request)
        {
            var rdActual = DataService.rdActuals;

            if (rdActual is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdActual));
        }
        private async Task<GridDataProviderResult<RdListReport>> DataProviderReports(GridDataProviderRequest<RdListReport> request)
        {
            var listReports = DataService.rdListReports;

            if (listReports is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(listReports));
        }

        //Api
        private async Task LoadData()
        {
            rdActuals = DataService.rdActuals;
            rdListReports = DataService.rdListReports;
            rdCalendars = DataService.rdCalendars;
            rdActualPlanOptions = DataService.rdActualPlanOptions;
            rdCharts = DataService.rdCharts;
            rdTeams = DataService.RdTeams;
            rdDraftmen = DataService.RdDraftmen;

    }
        private async Task LabelHead(int year)
        {
            var Response = await Http.GetAsync($"/api/SelectDraftmanAll/labelhead/{year}");
            if (Response.StatusCode == HttpStatusCode.NotFound)
            {

            }
            else if (Response.IsSuccessStatusCode)
            {
                rdQueryModel = await Response.Content.ReadFromJsonAsync<RdQueryModel>();
            }
            else
            {

            }
        }

        ///Refresh//
        private async Task Refreshing()
        {
            await DataService.RefreshDataAsync();
            await LoadData();
            NV.Refresh();
        }

        //////Chart///////////////
        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            if (firstRender)
            {
                await RenderManhattanAsync();
            } 
        }


        private async Task RenderManhattanAsync()
        {
            try
            {
                Token =  AuthComset.GetAuthToken();

                if (!string.IsNullOrEmpty(Token))
                {
                    Http.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", Token);
                    rdCharts = await Http.GetFromJsonAsync<List<RdChart>>($"/api/RdActual/article/chart/{currentYear}");
                    var finishData = new List<double?>(new double?[12]);
                    var notFinishData = new List<double?>(new double?[12]);
                    var labels = new List<string> { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };

                    foreach (var option in rdCharts)
                    {
                        finishData[option.monthNum - 1] = option.Finish;
                        notFinishData[option.monthNum - 1] = option.notFinish;
                    }
                    chartData = new ChartData
                    {
                        Labels = labels,
                        Datasets = new List<IChartDataset>()
                    {
                        new BarChartDataset()
                        {
                            Label = "Finish",
                            Data = finishData,
                            BackgroundColor = new List<string>{ "rgb(88, 80, 141)" },
                            CategoryPercentage = 0.8,
                            BarPercentage = 1,
                        },
                        new BarChartDataset()
                        {
                            Label = "NotFinish",
                            Data = notFinishData,
                            BackgroundColor = new List<string> { "rgb(255, 166, 0)" },
                            CategoryPercentage = 0.8,
                            BarPercentage = 1,
                        }
                    }
                    };
                    barChartOptions = new BarChartOptions();
                    barChartOptions.Interaction.Mode = InteractionMode.Index;
                    barChartOptions.Plugins.Title!.Text = currentYear.ToString();
                    barChartOptions.Plugins.Title.Display = true;
                    //barChartOptions.Plugins.Title.Font!.Size = 20;
                    barChartOptions.IndexAxis = "x";
                    barChartOptions.Responsive = true;
                    await barChart.InitializeAsync(chartData, barChartOptions);
                }
            }
            catch (Exception ex)
            {
                HeaderSet = "ERROR";
                MessageSet = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        private IEnumerable<DateTime> GetDateRange(DateTime start, DateTime end)
        {
            for (var dt = start; dt <= end; dt = dt.AddDays(1))
            {
                yield return dt;
            }
        }

        //Delte 
        private async Task Delete(int id)//ButtonDelete
        {
            try
            {
                Token = AuthComset.GetAuthToken();
                if (!string.IsNullOrEmpty(Token))
                {
                    var options = new ConfirmDialogOptions { IsVerticallyCentered = true };
                    var confirmation = await dialog.ShowAsync
                        (
                            title: "DELETE",
                            message1: "Are You Sure Delete Item?",
                            confirmDialogOptions: options
                        );

                    if (confirmation)
                    {
                        var reposne = await Http.DeleteAsync($"/api/Delete/delete/article/{id}");
                        reposne.EnsureSuccessStatusCode();

                        await Refreshing();
                        StateHasChanged();
                    }
                    else
                    {
                        HeaderSet = "DELETE";
                        MessageSet = "Cancellation Successful";
                        ShowMessage(ToastType.Info);
                    }
                }
            }
            catch (Exception ex)
            {
                HeaderSet = "ERROR";
                MessageSet = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        //NavigateTo
        private void NavigateToDetail(string articleId)
        { NV.NavigateTo($"detail/{articleId}"); }
        private void NavigateToEdit(string articleId)
        {
            NV.NavigateTo($"edit/{articleId}");
        }
        private async Task NavigateToReport(string ReportName)
        {
            try
            {
                var navigation = (Application.Current.MainPage as NavigationPage)?.Navigation;
                if (navigation != null)
                {
                    await navigation.PushAsync(new ReportViewer($"http://172.20.10.47:8091/Default?ReportName={ReportName}"));
                }
            }
            catch (Exception ex)
            {
                HeaderSet = "ERROR";
                MessageSet = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        private async Task ActionDetail(string team, int code, DateTime formDate, DateTime toDate)
        {
            try
            {
                Token = AuthComset.GetAuthToken();
                if (!string.IsNullOrEmpty(Token))
                {
                    rdActualPlanDtos = await Http.GetFromJsonAsync<List<RdActualPlanDto>>($"/api/RdActual/article/calendar/{code}");
                    var htmlString = new StringBuilder();
                    htmlString.Append(@"<table class=""table"">
                                <thead>
                                    <tr>
                                        <th>Article</th>
                                        <th>Draftman</th>
                                        <th>Cap</th>
                                        <th>Qty</th>
                                    </tr>
                                </thead>
                                <tbody>");
                    foreach (var item in rdActualPlanDtos.Where(r => r.FirstDate >= formDate && r.FinishDate <= toDate))
                    {
                        htmlString.Append($@"<tr>
                                    <td>{item.Article}</td>
                                    <td>{item.DraftmanName}</td>
                                    <td>{item.CapName}</td>
                                    <td>{item.CapQty}</td>
                                </tr>");
                    }

                    htmlString.Append("</tbody></table>");
                    await Swal.FireAsync(new SweetAlertOptions
                    {
                        Title = $"{team} : {code}",
                        Icon = SweetAlertIcon.Info,
                        Html = htmlString.ToString()
                    });
                }
                else
                {
                    await Swal.FireAsync(new SweetAlertOptions
                    {
                        Title = "Invalid Access Tokens",
                        Text = "No Token",
                        Icon = SweetAlertIcon.Error
                    });
                }
            }
            catch (Exception ex)
            {
                HeaderSet = "ERROR";
                MessageSet = ex.ToString();
                ShowMessage(ToastType.Danger);
            }

        }
        private async Task ActionOndraft(int article, string cap)
        {
            var htmlString = new StringBuilder();
            htmlString.Append(@"<table class=""table"">
                                <thead>
                                    <tr>
                                        <th>Project</th>
                                        <th>Cap</th>
                                        <th>Brand</th>
                                        <th>Type</th>
                                    </tr>
                                </thead>
                                <tbody>");
            foreach (var item in rdActualPlanOptions.Where(r => r.DraftmanCode == selectDraft && r.Article == article))
            {
                htmlString.Append($@"<tr>
                            <td>{item.ProjectName}</td>
                            <td>{item.CapName}</td>
                            <td>{item.InitialsBrand}</td>
                            <td>{item.OptionsSelect}</td>
                    </tr>
                ");
            }
            htmlString.Append("</tbody></table>");
            await Swal.FireAsync(new SweetAlertOptions
            {
                Title = $"{article} : {cap}",
                Icon = SweetAlertIcon.Info,
                Html = htmlString.ToString()
            });
        }

        ///ToCast
        List<ToastMessage> messages = new List<ToastMessage>();
        private void ShowMessage(ToastType toastType) => messages.Add(CreateToastMessage(toastType));
        private ToastMessage CreateToastMessage(ToastType toastType)
        => new ToastMessage
        {
            Type = toastType,
            Title = HeaderSet,
            HelpText = $"{DateTime.Now}",
            Message = MessageSet,
        };
    }

    public class Response
    {
        public string? Token { get; set; }
    }
}

