using System.Windows;
using System.Windows.Controls;
using Clinic.DataLayer.DbLayer;
using Clinic.Infrastructure;
using Clinic.ViewModel;

namespace Clinic.View
{
    /// <summary>
    /// Логика взаимодействия для List_All.xaml
    /// </summary>
    public partial class List_All : Window, IView
    {
        private ClinicContext _dbClinicContext;
        private CustomIdentity currentUser;
        public List_All(CustomIdentity currUser)
        {
            _dbClinicContext = new ClinicContext();
            currentUser = currUser;
            InitializeComponent();
        }
        Client_Details client_details = new Client_Details();
        private void Client_Details_Click(object sender, RoutedEventArgs e)
        {
            client_details.Show();
            this.Close();
        }

        private void dataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
        public IViewModel ViewModel
        {
            get
            {
                return DataContext as IViewModel;
            }
            set
            {
                DataContext = value;
            }
        }
    }
}
