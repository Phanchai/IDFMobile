using System;
namespace ProjectIDFMobile.Models.dtoModel
{
	public class RdModelHeadDto
	{

        public string? ProjectName { get; set; }

        public int CodeProject { get; set; }

        public string? ProjectOwner { get; set; }

        public string? Deskip { get; set; }

        public DateTime? DateGet { get; set; }

        public DateTime? DateFinal { get; set; }

        public string? InitialsBrand { get; set; }

        public int BrandNumber { get; set; }

        public string? NameBrand { get; set; }

        public int CapId { get; set; }

        public string? CapCode { get; set; }

        public string? CapName { get; set; }

        public string? GroupCap { get; set; }

        public int? CapStandard { get; set; }

        public int? CapCopy { get; set; }

        public string TeamName { get; set; } = null!;

        public int TeamCode { get; set; }

        public string? DraftmanName { get; set; }

        public int DraftmanCode { get; set; }

        public string? BossName { get; set; }

        public int? BossId { get; set; }

        public string? MonthName { get; set; }

        public int MonthCount { get; set; }

        public int? CapInMonth { get; set; }
    
	}
}

