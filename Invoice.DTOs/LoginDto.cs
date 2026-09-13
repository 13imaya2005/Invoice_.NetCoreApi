using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Invoice.DTOs
{
        public class LoginDto

        {

            public string UserName { get; set; }
            public string Password { get; set; }
            public string Token { get; set; }
            public DateTime Expiration { get; set; }
            public UserDto User { get; set; }

        }



    }

