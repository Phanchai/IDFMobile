using System;
namespace ProjectIDFMobile.Models
{
	public partial class RdCaoStandard
	{
        public int CapId { get; set; }

        public string CapCode { get; set; } = null!;

        public string? CapName { get; set; }

        public string? GroupCap { get; set; }

        public int CapStandard { get; set; }

        public int CapCopy { get; set; }
    }
}

