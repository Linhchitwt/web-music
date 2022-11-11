using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MusicApp.Models
{
    public class LoginClientModel
    {
        [Required(ErrorMessage = "Enter UserName")]
        public string UserName
        {
            set; get;
        }
        [Required(ErrorMessage = "Enter Password")]
        public string PassWord
        {
            set; get;
        }
        public bool RememberMe
        {
            set; get;
        }
    }
}