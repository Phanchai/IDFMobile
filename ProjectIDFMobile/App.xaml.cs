using System.Net.Http.Headers;
using System.Net.Http.Json;
using ProjectIDFMobile.Class;
using ProjectIDFMobile.Models;


namespace ProjectIDFMobile;

public partial class App : Application
{
    private readonly HttpClient _httpClient;
    private static AuthService? _authService;
    private static DataService? _dataService;

    public App(HttpClient httpClient, AuthService authService, DataService dataService)
    {
        InitializeComponent();
        _httpClient = httpClient;
        _authService = authService;
        _dataService = dataService;
        _authService = new AuthService(_httpClient);
        _dataService = new DataService(new HttpClient(), new AuthService(_httpClient));
        MainPage = new NavigationPage(new Login(_httpClient, _authService, _dataService));

    }
    public static AuthService AuthService => _authService;
}
