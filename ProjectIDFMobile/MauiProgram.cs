using CurrieTechnologies.Razor.SweetAlert2;
using Microsoft.Extensions.Logging;
using ProjectIDFMobile.Class;
using ProjectIDFMobile.Models; 
using System.Net.Http;
using System.Net.Security;


namespace ProjectIDFMobile;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
			});

		var handler = new HttpClientHandler
		{
            ServerCertificateCustomValidationCallback = (message, cert, chain, errors) =>
            {
                // Log certificate errors if needed
                if (errors != SslPolicyErrors.None)
                {
                    // Log the error or handle it
                }
                return true; // Accept all certificates
            }
        };

		builder.Services.AddScoped<AuthService>();
		builder.Services.AddScoped<DataService>();
		builder.Services.AddScoped(sp => new HttpClient(handler) { BaseAddress = new Uri("https://115.31.142.107:9180") });

		builder.Services.AddMauiBlazorWebView();
        builder.Services.AddSweetAlert2();
        builder.Services.AddHttpClient();
        builder.Services.AddBlazorBootstrap();
		builder.Services.AddBlazorWebViewDeveloperTools();
		builder.Logging.AddDebug();

		var app = builder.Services.BuildServiceProvider().GetService<App>();
		return builder.Build();
	}
}
