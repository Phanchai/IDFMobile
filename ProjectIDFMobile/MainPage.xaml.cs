using System.Net.Http.Json;
using ProjectIDFMobile.Class;
using ProjectIDFMobile.Models;

namespace ProjectIDFMobile;

public partial class MainPage : ContentPage
{
    private string Token;
	private readonly AuthService _authService;
	private readonly HttpClient Http;
    public DataService dataService;
    public LogingModel logingModel = new LogingModel();

    public MainPage(AuthService authService,HttpClient _Http)
	{
		InitializeComponent();
		_authService = authService;
        Http = _Http;
       // dataService = _dataService;
    }




}
