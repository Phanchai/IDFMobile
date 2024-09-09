using System;
namespace ProjectIDFMobile.Models
{
    public partial class RdTeam
    {
        public string TeamName { get; set; } = null!;

        public int TeamCode { get; set; }

        public string? BossName { get; set; }

        public int? BossId { get; set; }
    }
}

