using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MusicApp.Areas.Admin.Model
{
    public class RegisterInfo
    {
        public int ID
        {
            set; get;
        }
        public string Name
        {
            set; get;
        }
        public string Address
        {
            get; set;
        }
        //public string PhoneNumber(string value)
        //{
        //    if (string.IsNullOrEmpty(value)) return string.Empty;
        //    value = new System.Text.RegularExpressions.Regex(@"\D")
        //        .Replace(value, string.Empty);
        //    value = value.TrimStart('1');
        //    if (value.Length == 7)
        //        return Convert.ToInt64(value).ToString("###-####");
        //    if (value.Length == 10)
        //        return Convert.ToInt64(value).ToString("###-###-####");
        //    if (value.Length > 10)
        //        return Convert.ToInt64(value)
        //            .ToString("###-###-#### " + new String('#', (value.Length - 10)));
        //    return value;
        //}
        public decimal PhoneNumber
        {
            get;
            set;
        }
        public DateTime Birthday
        {
            get; set;
        }
        public decimal Identitycard
        {
            get; set;
        }
        [Required(ErrorMessage = "Input UserName:")]
        public string UserName
        {
            get; set;
        }
        [Required(ErrorMessage = "Input Password:")]
        [DataType(DataType.Password)]
        public string Password
        {
            get; set;
        }
        [Compare("Password")]
        [DataType(DataType.Password)]
        public string ConfirmPassword
        {
            get; set;
        }




    }
}