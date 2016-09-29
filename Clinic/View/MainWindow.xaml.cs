using System.Windows;
using Clinic.DataLayer.DbLayer;

namespace Clinic.View
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            
            var dbContext = new ClinicContext();
            if ()
            list_all.Show();
            this.Close();
        }
    }


}
