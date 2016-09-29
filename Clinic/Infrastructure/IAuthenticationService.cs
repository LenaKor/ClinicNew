using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Clinic.DataLayer.DbLayer;
using Clinic.ViewModel;

namespace Clinic.Infrastructure
{
    public interface IAuthenticationService
    {
        ViewModelUser AuthenticateUser(string username, string password);
    }
}
