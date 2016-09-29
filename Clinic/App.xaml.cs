using Clinic.Infrastructure;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;
using Clinic.View;
using Clinic.ViewModel;

namespace Clinic
{
    /// <summary>
    /// Логика взаимодействия для App.xaml
    /// </summary>
    public partial class App : Application
    {
        protected override void OnStartup(StartupEventArgs e)
        {

            //Create a custom principal with an anonymous identity at startup
            CustomPrincipal customPrincipal = new CustomPrincipal();
            AppDomain.CurrentDomain.SetThreadPrincipal(customPrincipal);

            base.OnStartup(e);

            //Show the login view
            ViewModelAuthentication viewModel = new ViewModelAuthentication(new AuthenticationService());
            IView loginWindow = new MainWindow(viewModel);
            loginWindow.Show();
        }
    }
}
