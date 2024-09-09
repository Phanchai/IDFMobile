using System;
using System.Reflection.PortableExecutable;
using BlazorBootstrap;

namespace ProjectIDFMobile.Class
{
	public class BootstrpItem
	{
        public string ?message, Header;
		List<ToastMessage> Messages = new List<ToastMessage>();
        private ToastMessage CreateToastMessage(ToastType toastType, string messageTxt, string headerTxt)
            => new ToastMessage
            {
                Type = toastType,
                Title = headerTxt,
                HelpText = $"{DateTime.Now}",
                Message = messageTxt,
            };
        public void ShowMessage(ToastType toastType) => Messages.Add(CreateToastMessage(toastType, message, Header));

    }
}

