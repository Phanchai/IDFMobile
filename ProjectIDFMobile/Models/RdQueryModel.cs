using System;
namespace ProjectIDFMobile.Models
{
	public partial class RdQueryModel
	{
        public int TotalHours { get; set; }
        public int RemainingHours { get; set; }
        public int TotalJobs { get; set; }
        public int PendingJobs { get; set; }
        public int FinishedJobs { get; set; }
        public int ModelNameTotal { get; set; }
        public int ProjectTotal { get; set; }
        public int AllType { get; set; }
        public int InMonth { get; set; }
        public int Brand { get; set; }
        public int CountDrafr { get; set; }
        public string? Draft { get; set; }
    }
}

