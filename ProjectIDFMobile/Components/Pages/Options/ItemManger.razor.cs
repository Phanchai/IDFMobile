
using System.Net.Http.Json;
using BlazorBootstrap;
using Microsoft.AspNetCore.Components;
using ProjectIDFMobile.Models;
using ProjectIDFMobile.Class;
using ProjectIDFMobile.Models.dtoModel;

namespace ProjectIDFMobile.Components.Pages.Options
{
    public partial class ItemManger
	{
        [Inject]
        protected HttpClient? Http { get; set; }

        public int autogen,TeamCode,draftmanCode, MontCap,MontCount,
                    TeamCodes,
                   IDProject,
                   LastNumber,IDModel,Standard,Copy;


        public string? MonthName, TeamName, BossName,draftmanName,
            name, init,ProjectNames,OwerProject,Deskip,CapName,Types;


        public string? message, Header;

        public RdBrand? rdBrand { get; set; }
        public RdDraftman? rdDraftman { get; set; }
        public RdCaoStandard? rdCapP { get; set; }
        public RdHeadProject? project { get; set; }
        public RdTeam? team { get; set; }
        public RdMonth? month { get; set; }

        public List<RdBrand>? rdBrands;
        public List<RdDraftman>? rdDraftmen;
        public List<RdCaoStandard>? rdCap;
        public List<RdHeadProject>? rdPorject;
        public List<RdTeam>? rdTeams;
        public List<RdMonth> ?rdMonths;
        private ConfirmDialog dialog = default!;

        protected override async Task OnInitializedAsync()
        {
            RIdPorject();
            DecareAPI();
            APILoad();
            GetLastNumber();
        }

        private void APILoad()
        {
            rdBrands = DataService.RdBrands;
            rdDraftmen = DataService.RdDraftmen;
            rdCap = DataService.RdCap;
            rdPorject = DataService.RdProjects;
            rdTeams = DataService.RdTeams;
            rdMonths = DataService.RdMonths;
        }

        private void RIdPorject()
        {
            Random random = new Random();
            int IdProject = random.Next(100000, 999999);
            IDProject = IdProject;
        }

        private void DecareAPI()
        {
            rdBrand = new RdBrand();
            rdDraftman = new RdDraftman();
            rdCapP = new RdCaoStandard();
            project = new RdHeadProject();
            team = new RdTeam();
            month = new RdMonth();
        }


        private async Task<GridDataProviderResult<RdBrand>> DataProvider(GridDataProviderRequest<RdBrand> request)
        {
            if (rdBrands is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdBrands));
        }
        private async Task<GridDataProviderResult<RdDraftman>> DataProviderTeam(GridDataProviderRequest<RdDraftman> request)
        {
            if (rdDraftmen is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdDraftmen));
        }
        private async Task<GridDataProviderResult<RdCaoStandard>> DataProviderCap(GridDataProviderRequest<RdCaoStandard> request)
        {
            if (rdCap is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdCap));
        }
        private async Task<GridDataProviderResult<RdHeadProject>> DataProviderProject(GridDataProviderRequest<RdHeadProject> request)
        {
            if (rdPorject is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdPorject));
        }
        private async Task<GridDataProviderResult<RdTeam>> DataProviderTeam(GridDataProviderRequest<RdTeam> request)
        {
            if (rdTeams is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdTeams));
        }
        private async Task<GridDataProviderResult<RdMonth>> DataProviderMonth(GridDataProviderRequest<RdMonth> request)
        {
            if (rdMonths is null)
            {
                await OnInitializedAsync();
            }
            return await Task.FromResult(request.ApplyTo(rdMonths));
        }

        public DateOnly dateNow;


        /// Proejct
        public async void SubmitProject()
        {
            try
            {
                var Model = new RdHeadProject
                {
                    CodeProject = IDProject,
                    ProjectName = ProjectNames,
                    ProjectOwner = OwerProject,
                    DateGet = DateTime.Now
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/project", Model);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message =  ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailProject(int id)
        {
            try
            {
                var response = rdPorject.Where(a => a.CodeProject == id).FirstOrDefault();

                if(response != null)
                {
                    ProjectNames = response.ProjectName;
                    IDProject = response.CodeProject;
                    OwerProject = response.ProjectOwner;
                    response.DateGet = DateTime.Now;
                    Deskip = response.Deskip;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }
            }
            catch(Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateProject(int id)
        {
            try
            {
                var rdto = new RdModelHeadDto
                {
                    CodeProject = IDProject,
                    ProjectName = ProjectNames,
                    ProjectOwner = OwerProject,
                    Deskip = Deskip,

                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/project/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteProject(int id)
        {
            try
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
                var reposne = await Http.DeleteAsync($"/api/Delete/delete/project/{id}");
                reposne.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();
            }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        /// Brand
        public async void SubmitBrand()
        {
            try
            {
                var Model = new RdBrand
                {
                    BrandNumber = LastNumber,
                    NameBrand = name,
                    InitialsBrand = init
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/brand", Model);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailBrand(int id)
        {
            try
            {
                var item =  rdBrands.Where(a => a.BrandNumber == id).FirstOrDefault();
                if(item != null)
                {
                    LastNumber = item.BrandNumber;
                    name = item.NameBrand;
                    init = item.InitialsBrand;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }
                
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateBrand(int id)
        {
            try
            {
                var rdto = new RdModelHeadDto
                {
                    BrandNumber = LastNumber,
                    InitialsBrand = init,
                    NameBrand = name
                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/brand/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteBrand(int id)
        {
            try
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
                    var reposne = await Http.DeleteAsync($"/api/Delete/delete/brand/{id}");
                    reposne.EnsureSuccessStatusCode();

                    NV.Refresh();
                    StateHasChanged();
                }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        ///Model
        public async void SubmitModel()
        {
            try
            {
                var Model = new RdCaoStandard
                {
                   CapId = IDModel,
                   CapCode = CapName,
                   CapName = CapName,
                   GroupCap = Types,
                   CapStandard = Standard,
                   CapCopy = Copy
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/model", Model);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailModel(int id)
        {
            try
            {
                var item = rdCap.Where(a => a.CapId == id).FirstOrDefault();
                if (item != null)
                {
                    IDModel = item.CapId;
                    CapName = item.CapName;
                    Types = item.GroupCap;
                    Standard = item.CapStandard;
                    Copy = item.CapCopy;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateModel(int id)
        {
            try
            {
                var rdto = new RdCaoStandard
                {
                  CapId = IDModel,
                  CapName = CapName,
                  GroupCap = Types,
                  CapStandard = Standard,
                  CapCode = CapName,
                  CapCopy = Copy
                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/model/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteModel(int id)
        {
            try
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
                    var reposne = await Http.DeleteAsync($"/api/Delete/delete/model/{id}");
                    reposne.EnsureSuccessStatusCode();

                    NV.Refresh();
                    StateHasChanged();
                }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        ///Draftman
        public async void SubmitDraft()
        {
            try
            {
                var Model = new RdDraftman
                {
                    DraftmanCode = draftmanCode,
                    DraftmanName = draftmanName,
                    TeamCode = TeamCodes
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/draft", Model);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailDraft(int id)
        {
            try
            {
                var item = rdDraftmen.Where(a => a.DraftmanCode == id).FirstOrDefault();
                if (item != null)
                {
                    draftmanCode = item.DraftmanCode;
                    draftmanName = item.DraftmanName;
                    TeamCodes = item.TeamCode;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateDraft(int id)
        {
            try
            {
                var rdto = new RdModelHeadDto
                {
                    DraftmanCode = draftmanCode,
                    DraftmanName = draftmanName,
                    TeamCode = TeamCodes,
                    
                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/draft/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteDraft(int id)
        {
            try
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
                    var reposne = await Http.DeleteAsync($"/api/Delete/delete/draft/{id}");
                    reposne.EnsureSuccessStatusCode();

                    NV.Refresh();
                    StateHasChanged();
                }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        ///Team
        public async void SubmitTeam()
        {
            try
            {
                var Model = new RdTeam
                {
                    TeamCode = TeamCode,
                    TeamName = TeamName,
                    BossName = BossName
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/team", Model);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailTeam(int id)
        {
            try
            {
                var item = rdTeams.Where(a => a.TeamCode == id).FirstOrDefault();
                if (item != null)
                {
                    TeamCode = item.TeamCode;
                    TeamName = item.TeamName;
                    BossName = item.BossName;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateTeam(int id)
        {
            try
            {
                var rdto = new RdTeam
                {
                    TeamName = TeamName,
                    TeamCode = TeamCode,
                    BossName = BossName
                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/team/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteTeam(int id)
        {
            try
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
                    var reposne = await Http.DeleteAsync($"/api/Delete/delete/team/{id}");
                    reposne.EnsureSuccessStatusCode();

                    NV.Refresh();
                    StateHasChanged();
                }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }

        ///Month
        public async void SubmitMonth()
        {
            try
            {
                var rdto = new RdMonth
                {
                    MonthName = MonthName,
                    MonthCount = MontCount,
                    CapInMonth = MontCap
                };

                var response = await Http.PostAsJsonAsync("api/Insert/insert/month", rdto);
                response.EnsureSuccessStatusCode();
                NV.Refresh();
                StateHasChanged();
            }
            catch (Exception ex)
            {
                Header = "ERORR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async void DetailMonth(int id)
        {
            try
            {
                var item = rdMonths.Where(a => a.MonthCount == id).FirstOrDefault();
                if (item != null)
                {
                    MonthName = item.MonthName;
                    MontCount = item.MonthCount;
                    MontCap = item.CapInMonth;
                }
                else
                {
                    throw new InvalidOperationException("Fail to retrieve data Form APi");
                }

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task UpdateMonth(int id)
        {
            try
            {
                var rdto = new RdMonth
                {
                    MonthName = MonthName,
                    MonthCount = MontCount,
                    CapInMonth = MontCap
                };

                var response = await Http.PutAsJsonAsync($"/api/Update/update/inmoth/{id}", rdto);
                response.EnsureSuccessStatusCode();

                NV.Refresh();
                StateHasChanged();

            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
        public async Task DeleteMonth(int id)
        {
            try
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
                    var reposne = await Http.DeleteAsync($"/api/Delete/delete/month/{id}");
                    reposne.EnsureSuccessStatusCode();

                    NV.Refresh();
                    StateHasChanged();
                }
            }
            catch (Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }


        public async void GetLastNumber()
        {
            var lastModel = rdCap.Select(a => a.CapId).LastOrDefault();
            var rdBandNumber = rdBrands.Select(a => a.BrandNumber).FirstOrDefault();
            var team = rdTeams.Select(a => a.TeamCode).LastOrDefault();
            var draf = rdDraftmen.Select(a => a.DraftmanCode).LastOrDefault();
            

            LastNumber = rdBandNumber + 1;
            IDModel = lastModel + 1;
            draftmanCode = draf + 1;
            TeamCode = team + 1;
        }

        List<ToastMessage> messages = new List<ToastMessage>();
        private ToastMessage CreateToastMessage(ToastType toastType, string messageTxt, string headerTxt)
            => new ToastMessage
            {
                Type = toastType,
                Title = headerTxt,
                HelpText = $"{DateTime.Now}",
                Message = messageTxt,
            };
        public void ShowMessage(ToastType toastType) => messages.Add(CreateToastMessage(toastType, message, Header));
    }


}

