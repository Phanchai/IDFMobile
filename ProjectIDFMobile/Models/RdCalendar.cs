using System;
namespace ProjectIDFMobile.Models
{
	public class RdCalendar
	{
        public int Article { get; set; }

        public int? CodeProject { get; set; }

        public string? ProjectName { get; set; }

        public string? InitialsBrand { get; set; }

        public int? JobNot { get; set; }

        public int? JobFinish { get; set; }

        public DateTime FirstDate { get; set; }
        public DateTime FinishDate { get; set; }

        public int CapCopy { get; set; }

        public string? CapName { get; set; }

        public string? DraftmanName { get; set; }

        public int DraftmanCode { get; set; }

        public int CapStandard { get; set; }

        public int MovementGroup { get; set; }

        public DateTime StartDate { get; set; }

        public DateTime? ApproveDate { get; set; }

        public string? DateTimeRec { get; set; }

        public string? OptionsSelect { get; set; }

        public DateTime? Missed { get; set; }
        public int? OverTime { get; set; }

        public string? TeamName { get; set; }

        public int TeamCode { get; set; }
    }
}

