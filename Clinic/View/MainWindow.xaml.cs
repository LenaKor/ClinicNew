using System.Windows;
using Clinic.DataLayer.DbLayer;
using Clinic.ViewModel;

namespace Clinic.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IView
    {
        //public MainWindow()
        //{
        //    //InitializeComponent();
        //}

        public MainWindow(ViewModelAuthentication viewModel)
        {
            ViewModel = viewModel;
            InitializeComponent();
        }

        #region IView Members
        public IViewModel ViewModel
        {
            get { return DataContext as IViewModel; }
            set { DataContext = value; }
        }
        #endregion
    }


}
