using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clinic.DataLayer.DbLayer;

namespace Clinic.Infrastructure
{
    public interface IAuthenticationService
    {
        User AuthenticateUser(string username, string password);
    }
}
