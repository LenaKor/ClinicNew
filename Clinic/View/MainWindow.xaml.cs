using System.Windows;

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

        List_All list_all = new List_All();
        private void button_Click(object sender, RoutedEventArgs e)
        {
            list_all.Show();
            this.Close();
        }
    }


}
