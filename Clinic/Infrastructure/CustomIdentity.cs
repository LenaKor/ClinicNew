using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using Clinic.DataLayer.DbLayer;

namespace Clinic.Infrastructure
{
    public class CustomIdentity : IIdentity
    {
        public CustomIdentity(string name, string pass, string[] roles)
        {
            Name = name;
            Pass = pass;
            Roles = roles;
        }

        public string Name { get; private set; }
        public string Pass { get; private set; }
        public string[] Roles { get; private set; }

        #region IIdentity Members
        public string AuthenticationType { get { return "Custom authentication"; } }

        public bool IsAuthenticated { get { return !string.IsNullOrEmpty(Name); } }
        #endregion
    }

    public class AnonymousIdentity : CustomIdentity
    {
        public AnonymousIdentity()
            : base(string.Empty, string.Empty, new string[] {})
        { }
    }
}
