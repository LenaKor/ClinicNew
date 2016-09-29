using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Clinic.ViewModel
{
    public class ViewModelUser
    {
        public ViewModelUser(string username, string pass, string[] roles)
        {
            Username = username;
            Pass = pass;
            Roles = roles;
        }
        public string Username
        {
            get;
            set;
        }

        public string Pass
        {
            get;
            set;
        }

        public string[] Roles
        {
            get;
            set;
        }
    }
}
