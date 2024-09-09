using System;
namespace ProjectIDFMobile.Models
{
	public partial class RdDraftman
	{

        public string? DraftmanName { get; set; }

        public int DraftmanCode { get; set; }

        public int TeamCode { get; set; }

        public byte[]? DraftmanImage { get; set; }

        public string? IdDraftMan { get; set; }
    }
}

