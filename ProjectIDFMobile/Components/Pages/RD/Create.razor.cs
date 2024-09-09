using System.Globalization;
using System.Net.Http.Json;
using BlazorBootstrap;
using Microsoft.AspNetCore.Components;
using ProjectIDFMobile.Class;
using ProjectIDFMobile.Models;
using ProjectIDFMobile.Models.dtoModel;
using Microsoft.Maui.Controls;
using System.Net;
using System.Net.Http.Headers;

namespace ProjectIDFMobile.Components.Pages.RD
{
	public partial class Create
	{
		[Inject]
		protected HttpClient? Http { get; set; }

		[Inject]
		protected PreloadService PreloadService { get; set; } = default!;

		private int ThaiDateAriicle,
					TeamItem,
					ValuesQ,
					SelectOptionValue,
					SelectDraftMan,
					selectPjandCode;


		private int selectedCapStandard, TotalStand, TotalCopy,TotalStandCopy,
            selectedCapCopy,
			CapHour, Stand, Copy, StandCopy, StandDay,
			CopyDay, StandCopyDay,
			StandUsed, CopyUsed, StanCopyUsed,
			modelValue = 0, tempModelValue,
			thaiDateInt;

        private int intMonth, TotalHouse, InMonth, Remain;

        private string? ArticleID, SelectCapType, SelectCapName,
                        CapName, monthStr, DraftmanName,
						TeamName, ProjectName, ModelName,
						CapNames, Token,TypeModel, Brand,
						TypeMM, Remark ;

		//Options 'DateTime,DateInput'
		private DateTime Recording = DateTime.Now,
						 FirstDate = DateTime.Now,
						 EndDate = DateTime.Now,
						 LastDayOnDraft;

		private DateTime date3 = DateTime.Now,
						 date4 = DateTime.Now,
						 date5 = DateTime.Now;

        private DateTime MontNameNow = DateTime.Now;
        private DateInput<DateTime> dateInput = default!;



		//Model
		public RdActualPlan? Rap { get; set; }
		public RdActualPlanOption? RapOpt { get; set; }
		public RdActualPlanOption? RapOptLast { get; set; }
		public RdActualPlan? lastArticle { get; set; }
		public RdMonth? rdMonth { get; set; }

		public RdTeam? rdTeamNme { get; set; }
		public RdDraftman? rdDraftmanName { get; set; }
		public RdHeadProject? rdHeadProjectName { get; set; }
		public RdCaoStandard? rdCapStand { get; set; }
        public RdQueryModel? rdQueryModel { get; set; }

        //ListModel
        public List<RdTeam>? rdTeams { get; set; }
		public List<RdDraftman>? rdDraftmen { get; set; }
		public List<RdBrand>? rdBrands { get; set; }
		public List<RdHeadProject>? rdHeadProjects { get; set; }
		public List<RdCaoStandard>? rdCaoStandards { get; set; }
		public List<RdActualPlan>? rdCapStandedasChecking { get; set; }
		LogingModel logingModel = new LogingModel();

		///Options 'Disable'
		private bool IsDraftSelectDisable => TeamItem == 0;
		private bool IsProjectDisable => TypeMM == null;
		private bool IsTypeDisble => Brand == null;
		private bool IsBrandDisable => SelectDraftMan == 0;
		private bool IsGroupDisable => selectPjandCode == 0;
        private bool IsNewModiflyDisable => tempModelValue == 0;



		protected override async Task OnInitializedAsync()
		{
			try
			{
				Token =  authService.GetAuthToken();
				
				if (!string.IsNullOrEmpty(Token))
				{
                    await LoadAPI();
                    ThaiDateAriicle = CheckingArticle();
                }
				else
				{
                    Header = "ERROR";
                    message = "Invalid Fetch API";
                    ShowMessage(ToastType.Danger);
                }
            }
			catch (Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
		}

		/// <article>
		private int getDateThai()
		{
			var thaiDateCalendar = new ThaiBuddhistCalendar();
			var ArticleSet = DateTime.Now;
			var yearArt = thaiDateCalendar.GetYear(ArticleSet) % 100;
			var monthArt = thaiDateCalendar.GetMonth(ArticleSet);
			return int.Parse($"{yearArt:00}{monthArt:00}{string.Format("{0:00000}", 1)}");
		}
		private int getLastAricle()
		{
			ThaiDateAriicle = lastArticle.Article;
			return ThaiDateAriicle;
		}
		private int CheckingArticle()
		{
			int values = 0;
			if (getLastAricle() == 0)
			{
				values = getDateThai();
			}
			else if (getLastAricle() != 0)
			{
				if (getLastAricle() == getDateThai())
				{
					values = getLastAricle() + 1;
				}
				else
				{
					values = getLastAricle() + 1;
				}
			}

			return values;
		}
		/// </article>

		private async Task LoadAPI()
		{
           
			Rap = new RdActualPlan();
            lastArticle = await Http.GetFromJsonAsync<RdActualPlan>("/api/RdActual/article/lastArticle");
			rdTeams = DataService.RdTeams;
			rdDraftmen = DataService.RdDraftmen;
			rdBrands = DataService.RdBrands;
			rdHeadProjects = DataService.RdProjects;
			rdCaoStandards = DataService.RdCap;
			//rdCapStandedasChecking = DataService.rdActuals;

        intMonth = FirstDate.Month;
                monthStr = intMonth.ToString();
                rdMonth = await Http.GetFromJsonAsync<RdMonth>($"/api/Options/month/{monthStr}");

        }
		private async void Submit()
		{
			try
			{
                List<bool> conditionsList = new List<bool>()
                {
                    (ThaiDateAriicle != 0),
					(TeamItem != 0 || SelectDraftMan !=0),
					(Brand != null || TypeMM != null),
					(selectPjandCode != 0 || SelectCapName != null || TypeModel != null),
					(tempModelValue != 0)
                };

				if(conditionsList.All(con => con))
				{
                    var rdActualPlanDto = new RdActualPlanDto
                    {
                        Article = ThaiDateAriicle,
                        ApproveDate = Recording,
                        StartDate = Recording,
                        FirstDate = FirstDate,
                        FinishDate = EndDate,
                        OptionsSelect = FirstDate.Date > DateTime.Now.AddMonths(2) ? "งานจอง" : "เปิดงาน",
                        TeamCode = TeamItem,
                        TeamName = TeamName,
                        DraftmanCode = SelectDraftMan,
                        DraftmanName = DraftmanName,
                        InitialsBrand = Brand,
                        TypeNames = TypeMM,
                        CodeProject = selectPjandCode,
                        ProjectName = ProjectName,
                        CapName = CapNames,
                        CapQty = tempModelValue,
                        CapType = TypeModel,
                        CapStandard = selectedCapStandard,
                        CapCopy = selectedCapCopy,
                        CapHour = CheckingHour(),
                        DateTimeRec = Recording.ToLongDateString(),
                        JobNot = tempModelValue,
                        MonthCount = Recording.Month,
                        MovementGroup = ThaiDateAriicle,
                        OverTime = 0,
                        JobFinish = 0,
                        Remark = Remark
                    };

					if (!string.IsNullOrEmpty(Token))
					{
                        var response = await Http.PostAsJsonAsync("/api/Insert/insert/job", rdActualPlanDto);
                        response.EnsureSuccessStatusCode();

						await DataService.RefreshDataAsync();
						NV.NavigateTo("/");
                    }
					else
					{
                        Header = "ERORR";
                        message = "Invalid Token";
                        ShowMessage(ToastType.Danger);
                    }
                }
				else
				{
                    Header = "ERORR";
                    message = "บันทึกไม่สำเร็จ";
                    ShowMessage(ToastType.Danger);
                }
            }
			catch (Exception ex)
			{
				Header = "ERORR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
		}
		private int CheckingHour()
		{
            if (TypeModel == "New")
            {
                return CapHour = Stand;
            }
            else if (TypeModel == "Modify")
            {
                return CapHour = Copy;
            }
            else if (TypeModel == "Auto")
            {
                //tempModelValue = 1;
                return CapHour = StandCopy;
            }
            else
            {
				return CapHour = 0;
            }
        }

		private  void UpdateStandAndCopy()
		{
            Stand = selectedCapStandard * modelValue;
			Copy = selectedCapCopy * modelValue;

			StandDay = (int)Math.Round((double)Stand / 8);
			CopyDay = (int)Math.Round((double)Copy / 8);

			if(TypeModel == "Auto")
			{
				EndDate = date5;
			}
			else if(TypeModel == "New")
			{
				EndDate = date3;
			}
			else if(TypeModel == "Modify")
			{
				EndDate = date4;
			}
        }
		private void ToManager()
		{
            NV.NavigateTo("/manager");
        }

		private void IncreaseValue()
		{
			try
			{
                if (SelectCapName != null)
                {
                    tempModelValue++;
                     ConfrimIncreaseValue();
                }
            }
			catch(Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}

		}
		private  void ConfrimIncreaseValue()
		{

			modelValue = tempModelValue;
			UpdateStandAndCopy();
			SandCopyNewIn();


			TotalStand += selectedCapStandard;
			TotalCopy +=  selectedCapCopy;
			//TotalStand += selectedCapCopy; 

            StandUsed -= selectedCapStandard;
            CopyUsed -= selectedCapCopy;

            date3 = CalculaterDate3();
			date4 = CalculaterDate4();
		}
		private void DecreaseValue()
		{
			try
			{
                if (tempModelValue > 0)
                {
                    tempModelValue--;
                     ConfirmDecreaseValue();
                }
            }
			catch(Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
		}
		private  void ConfirmDecreaseValue()
		{
			
            modelValue = tempModelValue;
            UpdateStandAndCopy();
			SandCopyNewDe();

            TotalStand -= selectedCapStandard;
            TotalCopy -= selectedCapCopy;

            StandUsed += selectedCapStandard;
			CopyUsed += selectedCapCopy;

            date3 = CalculaterDate3();
            date4 = CalculaterDate4();
        }


        /// <Model>
        private async Task SelectLastDayOnDraft()
        {
            try
            {
                if (!string.IsNullOrEmpty(Token))
                {
                    RapOptLast = await Http.GetFromJsonAsync<RdActualPlanOption>($"/api/SelectDraftmanAll/draftman/selected/lastday/{SelectDraftMan}");
                    if (RapOptLast != null)
                    {
                        DateTime? Values = RapOptLast.FinishDate;

                        if (Values == null || Values == DateTime.MinValue)
                        {
                            FirstDate = DateTime.Now;
                        }
                        else
                        {
                            FirstDate = Values.Value.AddDays(1);
                            if (FirstDate.DayOfWeek == DayOfWeek.Saturday)
                            {
                                FirstDate = FirstDate.AddDays(2);
                            }
                            else if (FirstDate.DayOfWeek == DayOfWeek.Sunday)
                            {
                                FirstDate = FirstDate.AddDays(1);
                            }
                        }
                    }
                    else
                    {
                        // Handle the case where RapOptLast is null
                        FirstDate = DateTime.Now;
                    }
                }
            }
            catch(Exception ex)
            {
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }

        }
        private async Task GetTotalHousr()
        {
            int MonthName = MontNameNow.Month;
            await LabelHead(MonthName, SelectDraftMan);
        }
        private async Task CheckJob()
        {
			if (!string.IsNullOrEmpty(Token))
			{
                var Response = await Http.GetAsync($"/api/Options/type/selected/{TeamItem}/{SelectDraftMan}/{selectPjandCode}/{Brand}/{CapNames}");
                if (Response.StatusCode == HttpStatusCode.NotFound)
                {
					TypeModel = "Auto";
					tempModelValue = 1;
                }
				else
				{
                    TypeModel = "Modify";
                }
            }
        }
        private async Task LabelHead(int month, int draft)
        {
			if (!string.IsNullOrEmpty(Token))
			{
                var Response = await Http.GetAsync($"/api/SelectDraftmanAll/cardlable/calendar/{month}/{draft}");
                if (Response.StatusCode == HttpStatusCode.NotFound)
                {
                    var CapInMonth = await Http.GetAsync($"/api/SelectDraftmanAll/labelhead/month/{month}");
                    rdMonth = await CapInMonth.Content.ReadFromJsonAsync<RdMonth>();

                    StandUsed = rdMonth.CapInMonth;
                    CopyUsed = rdMonth.CapInMonth;
                    StanCopyUsed = rdMonth.CapInMonth;

                }
                else if (Response.IsSuccessStatusCode)
                {
                    rdQueryModel = await Response.Content.ReadFromJsonAsync<RdQueryModel>();
                    StandUsed = rdQueryModel.InMonth;
                    CopyUsed = rdQueryModel.InMonth;
                    StanCopyUsed = rdQueryModel.InMonth - selectedCapStandard;

                    TotalStand = rdQueryModel.TotalHours;
                    TotalCopy = rdQueryModel.TotalHours;
                    TotalStandCopy = rdQueryModel.TotalHours + selectedCapStandard;
                }
            }
        }
        /// <Model>


        /// <Auto>
        private void SandCopyNewIn()
        {
            StandCopy += selectedCapCopy;
			TotalStandCopy += selectedCapCopy;
			StanCopyUsed -= selectedCapCopy;

            StandCopyDay = (int)Math.Round((double)StandCopy / 8);
            date5 = CalculaterDate5();
        }
        private void SandCopyNewDe()
        {
            StandCopy -= selectedCapCopy;
            TotalStandCopy -= selectedCapCopy;
            StanCopyUsed += selectedCapCopy;

            StandCopyDay = (int)Math.Round((double)StandCopy / 8);
            date5 = CalculaterDate5();
        }
        /// </Auto>


        private async Task UpdateSelectCapStandaed(ChangeEventArgs e)
		{
			try
			{
                //await SelectLastDayOnDraft();

				if (!string.IsNullOrEmpty(Token))
				{
                    SelectCapName = e.Value.ToString();
                    rdCapStand = await Http.GetFromJsonAsync<RdCaoStandard>($"/api/Options/model/seleted/{SelectCapName}");
                    CapNames = rdCapStand.CapName;

					await CheckJob();

                    ///////////////////////////////////////////
                    selectedCapStandard = rdCapStand.CapStandard;
                    selectedCapCopy = rdCapStand.CapCopy;
                    StandCopy = rdCapStand.CapStandard;
                    //////////////////////////////////////////
                }

                await GetTotalHousr();
            }
			catch(Exception ex)
			{
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }

        }
		private void OnCahngeDarftman(ChangeEventArgs e)
		{
			try
			{
				SelectDraftMan = int.Parse(e.Value.ToString());
                rdDraftmanName = rdDraftmen.FirstOrDefault(a => a.DraftmanCode == SelectDraftMan);
                DraftmanName = rdDraftmanName.DraftmanName;
            }
			catch(Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
        }
		private void OnChangeTeam(ChangeEventArgs e)
		{
			try
			{
                TeamItem = int.Parse(e.Value.ToString());
				rdTeamNme = rdTeams.FirstOrDefault(a => a.TeamCode == TeamItem);
                TeamName = rdTeamNme.TeamName;
            }
			catch(Exception ex)
			{
                Header = "ERROR";
                message = ex.ToString();
                ShowMessage(ToastType.Danger);
            }
        }
		private void OnChangeProject(ChangeEventArgs e)
		{
			try
			{
                selectPjandCode = int.Parse(e.Value.ToString());
                rdHeadProjectName = rdHeadProjects.FirstOrDefault(a => a.CodeProject == selectPjandCode);
                ProjectName = rdHeadProjectName.ProjectName;
            }
			catch(Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
        }

        private DateTime CalculateDateSkippingWeekends(DateTime startDate, int numberOfDays)
		{
			DateTime result = startDate;
			int addedDays = 1;
			while(addedDays < numberOfDays)
			{
				result = result.AddDays(1);
                if (result.DayOfWeek != DayOfWeek.Saturday && result.DayOfWeek != DayOfWeek.Sunday)
                {
                    addedDays++;
                }
            }

			return result;
		}
		private DateTime CalculaterDate5()
		{
			return CalculateDateSkippingWeekends(FirstDate, StandCopyDay);
		}
		private DateTime CalculaterDate4()
		{
			return CalculateDateSkippingWeekends(FirstDate, CopyDay);
		}
		private DateTime CalculaterDate3()
		{
			return CalculateDateSkippingWeekends(FirstDate, StandDay);
		}


		private async Task<bool> CheckGroup()
		{
			if (!string.IsNullOrEmpty(Token))
			{
                rdCapStandedasChecking = await Http.GetFromJsonAsync<List<RdActualPlan>>($"/api/Options/type/selected/{TeamItem}/{SelectDraftMan}/{selectPjandCode}/{Brand}");
                var itemCheck = rdCapStandedasChecking;

                if (itemCheck.Any())
                {
                    TypeModel = "Modify";
                    return false;
                }
                else
                {
                    TypeModel = "Auto";
                    return true;
                }
            }
			else
			{
				return true;
			}

		}
		private async void HandleCaptypeChange(ChangeEventArgs e)
		{
			try
			{
				SelectCapType = e.Value.ToString();
				HandleCapType(SelectCapType);
				
				TypeModel = SelectCapType;

 			}
			catch(Exception ex)
			{
				Header = "ERROR";
				message = ex.ToString();
				ShowMessage(ToastType.Danger);
			}
		}
		private void HandleCapType(string selectType)
		{
			if (selectType == "New")
			{
				EndDate = CalculaterDate3();
			}
			else if (selectType == "Modify")
			{
				EndDate = CalculaterDate4();
			}
			else if(selectType == "Auto")
			{
				EndDate = CalculaterDate5();
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

