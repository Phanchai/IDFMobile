
using System;

namespace ProjectIDFMobile.Components.Pages.Options;

public partial class ReportViewer : ContentPage
{
	public ReportViewer(string url)
	{
        InitializeComponent();
        webView.Source = url;
    }
}
