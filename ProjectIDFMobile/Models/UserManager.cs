using System;
namespace ProjectIDFMobile.Models
{
	public class UserManager
	{
        public int Uid { get; set; }
        public string? Email { get; set; }
        public string? Username { get; set; }
        public string? Password { get; set; }
        public string? FirstName { get; set; }
        public string? LastName { get; set; }
        public string? PasswordMash { get; set; }
        public string? PasswordSalt { get; set; }
    }
}

