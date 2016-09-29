using System.Windows;

namespace Clinic.View
{
    /// <summary>
    /// Interaction logic for Client_Details.xaml
    /// </summary>
    public partial class Client_Details : Window
    {
        public Client_Details()
        {
            InitializeComponent();
        }

        Make_Appointment make_appointment = new Make_Appointment();

        private void MakeAppointment_Click(object sender, RoutedEventArgs e)
        {
            make_appointment.Show();
            this.Close();
        }
    }
}
