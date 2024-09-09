using System.Net.Http.Json;
using BlazorBootstrap;
using Microsoft.AspNetCore.Components;
using ProjectIDFMobile.Models;
using ProjectIDFMobile.Models.dtoModel;

namespace ProjectIDFMobile.Components.Pages.RD
{
    public partial class Edit
    {
        public RdActualPlanDto? rdActualPlanDto { get; set; }
        public RdActualPlanDto? rdActualPlans { get; set; }
        public List<RdActualPlanDto>? rdActualPlanDtos1, rdActualPlanDtos2;
        public RdActualPlan? LastArticle { get; set; }
        public LogingModel logingModel = new LogingModel();

        public List<RdTeam>? rdTeams { get; set; }
        public List<RdDraftman>? rdDraftmen { get; set; }

        private RdTeam? rdTeam { get; set; }

        [Parameter]
        public string? article { get; set; }

        [Inject]
        protected HttpClient? Http { get; set; }

        private string? teamName, draftName;

        private int capQty, hourQty,
                    selectedOptionValue,
                    selectedDraft, MovemenCapQty, MovmentJobNot, MovementFinish,
                    HourMovement, DayMovemnt;

        private int LastArticleId;

        public string? workOpen = "เปิดงาน", Remark = "", TyName, Options, Token;
        private DateTime FirstDate = DateTime.Now, FininshJob = DateTime.Now, Recroding = DateTime.Now;



        protected override async Task OnInitializedAsync()
        {
            Token =  authService.GetAuthToken();

            if (!string.IsNullOrEmpty(Token))
            {
                rdActualPlanDto = new RdActualPlanDto();
                rdActualPlanDtos1 = await Http.GetFromJsonAsync<List<RdActualPlanDto>>($"/api/RdActual/articleitem/calendar");
                rdActualPlans = await Http.GetFromJsonAsync<RdActualPlanDto>($"/api/RdActual/articleitem/onarticle/{article}");
                LastArticle = await Http.GetFromJsonAsync<RdActualPlan>("/api/RdActual/article/lastArticle");

                await Setting();
            }
        }


        private async Task Submit()
        {
            try
            {
                Token = authService.GetAuthToken();

                if (!string.IsNullOrEmpty(Token))
                {
                    List<bool> conditionsList = new List<bool>
                    {
                        (TyName != "เลือก")
                    };

                    if (conditionsList.All(con => con))
                    {
                        if (TyName == "อัพเดท")
                        { Options = "อัพเดท"; }
                        else if (TyName == "เสร็จสิ้น")
                        { Options = "เสร็จสิ้น"; }
                        else if (TyName == "โยกย้ายงาน")
                        { Options = "โยกย้ายงาน"; }


                        var rtdoMove = new RdActualPlanDto
                        {
                            Article = LastArticleId,
                            ApproveDate = DateTime.Now,
                            StartDate = DateTime.Now,
                            FirstDate = FirstDate,
                            FinishDate = FininshJob,
                            OptionsSelect = "เปิดงาน",
                            TeamCode = selectedOptionValue,
                            TeamName = teamName,
                            DraftmanCode = selectedDraft,
                            DraftmanName = draftName,
                            InitialsBrand = rdActualPlans.InitialsBrand,
                            TypeNames = rdActualPlans.TypeNames,
                            CodeProject = rdActualPlans.CodeProject,
                            ProjectName = rdActualPlans.ProjectName,
                            CapName = rdActualPlans.CapName,
                            CapQty = MovemenCapQty,
                            CapType = rdActualPlans.CapType,
                            CapStandard = rdActualPlans.CapStandard,
                            CapCopy = rdActualPlans.CapCopy,
                            CapHour = HourMovement,
                            DateTimeRec = Recroding.ToString(),
                            DateSave = Recroding,
                            DTimeSave = Recroding,
                            JobNot = MovmentJobNot,
                            JobFinish = MovementFinish,
                            MonthCount = rdActualPlans.MonthCount,
                            MovementGroup = rdActualPlans.Article,
                            OverTime = rdActualPlans.OverTime,
                            Remark = rdActualPlans.Remark,
                            Missed = rdActualPlans.Missed

                        };
                        var rtdo = new RdActualPlanDto//History
                        {
                            Article = rdActualPlans.Article,
                            ApproveDate = DateTime.Now,
                            StartDate = DateTime.Now,
                            FirstDate = rdActualPlans.FirstDate,
                            FinishDate = rdActualPlans.FinishDate,
                            OptionsSelect = Options,
                            TeamCode = rdActualPlans.TeamCode,
                            TeamName = rdActualPlans.TeamName,
                            DraftmanCode = rdActualPlans.DraftmanCode,
                            DraftmanName = rdActualPlans.DraftmanName,
                            InitialsBrand = rdActualPlans.InitialsBrand,
                            TypeNames = rdActualPlans.TypeNames,
                            CodeProject = rdActualPlans.CodeProject,
                            ProjectName = rdActualPlans.ProjectName,
                            CapName = rdActualPlans.CapName,
                            CapQty = rdActualPlans.CapQty,
                            CapType = rdActualPlans.CapType,
                            CapStandard = rdActualPlans.CapStandard,
                            CapCopy = rdActualPlans.CapCopy,
                            CapHour = rdActualPlans.CapHour,
                            DateTimeRec = Recroding.ToLongDateString(),
                            DTimeSave = rdActualPlans.StartDate,
                            DateSave = rdActualPlans.StartDate,
                            JobNot = rdActualPlans.JobNot,
                            MonthCount = rdActualPlans.MonthCount,
                            MovementGroup = rdActualPlans.MovementGroup,
                            OverTime = rdActualPlans.OverTime,
                            JobFinish = rdActualPlans.JobFinish,
                            Remark = rdActualPlans.Remark,
                            Missed = rdActualPlans.Missed
                        };


                        if (TyName == "อัพเดท")
                        {
                            var updateRes = await Http.PutAsJsonAsync($"/api/Update/update/job/{rdActualPlans.Article}", rtdo);
                            updateRes.EnsureSuccessStatusCode();


                            await Refreshing();
                            StateHasChanged();
                        }
                        else if (TyName == "เสร็จสิ้น")
                        {
                            var updateRes = await Http.PutAsJsonAsync($"/api/Update/update/job/{rdActualPlans.Article}", rtdo);
                            updateRes.EnsureSuccessStatusCode();

                            await DataService.RefreshDataAsync();
                            NV.NavigateTo("/");
                            StateHasChanged();
                        }
                        else if (TyName == "โยกย้ายงาน")
                        {
                            var updateRes = await Http.PutAsJsonAsync($"/api/Update/update/job/{rdActualPlans.Article}", rtdo);
                            updateRes.EnsureSuccessStatusCode();


                            var reponseMovee = await Http.PostAsJsonAsync("/api/Insert/insert/job", rtdoMove);
                            reponseMovee.EnsureSuccessStatusCode();

                            await DataService.RefreshDataAsync();
                            NV.NavigateTo("/");
                            StateHasChanged();
                        }
                    }
                }
                
                else
                {
                    Header = "Warning";
                    message = "ต้องเลือกรูปแบบก่อน";
                    ShowMessage(ToastType.Warning);
                }
            }
            catch (Exception ex)
            {
                Header = "Warning";
                message = ex.ToString();
                ShowMessage(ToastType.Warning);
            }

        }

        private async Task Refreshing()
        {
           await DataService.RefreshDataAsync();
           //NV.Refresh();
        }

        private async Task Setting()
        {
            LastArticleId = LastArticle.Article + 1;
            rdTeams = await Http.GetFromJsonAsync<List<RdTeam>>("/api/SelectDraftmanAll/team");
            rdDraftmen = await Http.GetFromJsonAsync<List<RdDraftman>>("/api/SelectDraftmanAll/draftman");
        }

        private void OnchangeType(ChangeEventArgs e)
        {
            TyName = e.Value.ToString();

        }

        ///Move
        private void IncreaseValue()
        {
            if (TyName == "โยกย้ายงาน" || rdActualPlans.JobNot != 0)
            {
                if (selectedDraft != 0)
                {
                    if (rdActualPlans.CapQty != 0)
                    {

                        MovemenCapQty++;
                        rdActualPlans.CapQty--;
                        rdActualPlans.JobNot--;
                        MovmentJobNot++;


                        if (rdActualPlans.CapType == "New")
                        {
                            HourMovement += rdActualPlans.CapStandard;
                            rdActualPlans.CapHour -= rdActualPlans.CapStandard;
                        }
                        else if (rdActualPlans.CapType == "Modify")
                        {
                            HourMovement += rdActualPlans.CapCopy;
                            rdActualPlans.CapHour -= rdActualPlans.CapCopy;
                        }
                        else if (rdActualPlans.CapType == "Auto")
                        {

                                if(rdActualPlans.CapHour == rdActualPlans.CapStandard)
                                {
                                    HourMovement += rdActualPlans.CapStandard;
                                    rdActualPlans.CapHour -= rdActualPlans.CapStandard;
                                    DayMovemnt = (int)Math.Round((double)HourMovement / 8);
                                    FininshJob.AddDays(DayMovemnt);
                                }
                                else
                                {
                                    HourMovement += rdActualPlans.CapCopy;
                                    rdActualPlans.CapHour -= rdActualPlans.CapCopy;
                                    DayMovemnt = (int)Math.Round((double)HourMovement / 8);
                                    FininshJob.AddDays(DayMovemnt);
                                }
                            
                        }


                        StateHasChanged();
                    }
                }
            }
        }
        private void DecreaseValue()
        {
            if (TyName == "โยกย้ายงาน")
            {
                if (selectedDraft != 0)
                {
                    if (MovemenCapQty > 0)
                    {

                        MovemenCapQty--;
                        rdActualPlans.CapQty++;
                        rdActualPlans.JobNot++;
                        MovmentJobNot--;

                        if (rdActualPlans.CapType == "New")
                        {
                            HourMovement -= rdActualPlans.CapStandard;
                            rdActualPlans.CapHour += rdActualPlans.CapStandard;
                        }
                        else if (rdActualPlans.CapType == "Modify")
                        {
                            HourMovement -= rdActualPlans.CapCopy;
                            rdActualPlans.CapHour += rdActualPlans.CapStandard;
                        }
                        else if (rdActualPlans.CapType == "Auto")
                        {
                            if (rdActualPlans.CapHour == rdActualPlans.CapStandard)
                            {
                                HourMovement -= rdActualPlans.CapStandard;
                                rdActualPlans.CapHour += rdActualPlans.CapStandard;
                                DayMovemnt = (int)Math.Round((double)HourMovement / 8);
                                FininshJob.AddDays(DayMovemnt);
                            }
                            else
                            {
                                HourMovement -= rdActualPlans.CapCopy;
                                rdActualPlans.CapHour += rdActualPlans.CapCopy;
                                DayMovemnt = (int)Math.Round((double)HourMovement / 8);
                                FininshJob.AddDays(DayMovemnt);
                            }
                        }

                        StateHasChanged();
                    }
                }
            }
        }

        ///Finish
        private void IncreaseValueFinish()
        {
            if (TyName == "เสร็จสิ้น" || TyName == "อัพเดท")
            {

                if (rdActualPlans.CapQty > 0)
                {
                    if (rdActualPlans.JobNot > 0)
                    {
                        rdActualPlans.JobNot--;
                        rdActualPlans.JobFinish++;
                    }
                }
            }
        }
        private void DecreaseValueFinish()
        {
            if (TyName == "เสร็จสิ้น" || TyName == "อัพเดท")
            {

                if (rdActualPlans.CapQty > 0)
                {

                    if (rdActualPlans.JobFinish > 0)
                    {
                        rdActualPlans.JobNot++;
                        rdActualPlans.JobFinish--;
                    }
                }
            }
        }

        private void OnchangeTeam(ChangeEventArgs e)
        {
            selectedOptionValue = int.Parse(e.Value.ToString());
            var selectTeam = rdTeams.FirstOrDefault(t => t.TeamCode == selectedOptionValue);
            if (selectTeam != null)
            {
                teamName = selectTeam.TeamName;
            }
        }

        private void OnchangeDraft(ChangeEventArgs e)
        {
            selectedDraft = int.Parse(e.Value.ToString());
            var selectDraft = rdDraftmen.FirstOrDefault(d => d.DraftmanCode == selectedDraft);
            if (selectDraft != null)
            {
                draftName = selectDraft.DraftmanName;
            }
        }


        public string? message, Header;
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

