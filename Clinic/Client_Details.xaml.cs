﻿using System;
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
