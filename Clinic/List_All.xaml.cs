using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Clinic
{
    /// <summary>
    /// Логика взаимодействия для List_All.xaml
    /// </summary>
    public partial class List_All : Window
    {
        public List_All()
        {
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
    }
}
