using System.Windows;
using System.Windows.Controls;
using Clinic.DataLayer.DbLayer;
using Clinic.ViewModel;

namespace Clinic.View
{
    /// <summary>
    /// Логика взаимодействия для List_All.xaml
    /// </summary>
    public partial class List_All : Window, IView
    {
        //public new ClinicContext DbClinicContext { get; private set; }
        public List_All(ClinicContext context)
        {
            DataContext = context;
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
