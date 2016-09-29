using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Clinic.DataLayer.DbLayer;
using Clinic.ViewModel;

namespace Clinic.Infrastructure
{
    public class AuthenticationService : IAuthenticationService
    {
        private class InternalUserData
        {
            public InternalUserData(string username, string hashedPassword, string[] roles)
            {
                Username = username;
                HashedPassword = hashedPassword;
                Roles = roles;
            }

            public string Username { get; private set; }


            public string HashedPassword { get; private set; }

            public string[] Roles { get; private set; }
        }

        private List<InternalUserData> GetUsersFromDb()
        {
            var context = new ClinicContext();
            var users = context.Users;
            var InternalUsers = new List<InternalUserData>();
            foreach (var user in users)
            {
                InternalUsers.Add(new InternalUserData(user.UserName, user.UserPass, user.UsersInRoles.Select(r=>r.Role.RoleName).ToArray()));
            }
            return InternalUsers;
        }
        private static List<InternalUserData> _users;

        public ViewModelUser AuthenticateUser(string username, string clearTextPassword)
        {
            _users = GetUsersFromDb();
            InternalUserData userData = _users.FirstOrDefault(u => u.Username.Equals(username)
                                                                   &&
                                                                   u.HashedPassword.Equals(
                                                                       CalculateHash(clearTextPassword, u.Username)));
            if (userData == null)
                throw new UnauthorizedAccessException("Access denied. Please provide some valid credentials.");

            return new ViewModelUser(userData.Username, userData.HashedPassword, userData.Roles);
        }

        private string CalculateHash(string clearTextPassword, string salt)
        {
            // Convert the salted password to a byte array
            byte[] saltedHashBytes = Encoding.UTF8.GetBytes(clearTextPassword + salt);
            // Use the hash algorithm to calculate the hash
            HashAlgorithm algorithm = new SHA256Managed();
            byte[] hash = algorithm.ComputeHash(saltedHashBytes);
            // Return the hash as a base64 encoded string to be compared to the stored password
            return Convert.ToBase64String(hash);
        }
    }
}
