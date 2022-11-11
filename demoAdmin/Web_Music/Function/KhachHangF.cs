using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Music.Models;

namespace Web_Music.Function
{
    public class KhachHangF
    {
        MyDBConect db = new MyDBConect();
        public string AutoID()
        {
            string result;
            //string values = db.NGHE_SIs.SqlQuery("SELECT max(RIGHT(MAns, 8)) FROM nghe_si").SingleOrDefault().ToString();
            int value = int.Parse(db.Database.SqlQuery<string>("SELECT max(RIGHT(MAKH, 8)) FROM khach_hang").SingleOrDefault().ToString());
            if (0 <= value && value < 9)
            {
                result = "KH0000000" + Convert.ToString(value + 1);
            }
            else if (9 <= value && value < 99)
            {
                result = "KH000000" + Convert.ToString(value + 1);
            }
            else if (99 <= value && value < 999)
            {
                result = "KH00000" + Convert.ToString(value + 1);
            }
            else if (999 <= value && value < 9999)
            {
                result = "KH0000" + Convert.ToString(value + 1);
            }
            else if (9999 <= value && value < 99999)
            {
                result = "KH000" + Convert.ToString(value + 1);
            }
            else if (99999 <= value && value < 999999)
            {
                result = "KH00" + Convert.ToString(value + 1);
            }

            else
            {
                result = "KH0" + Convert.ToString(value + 1);
            }
            return result;
        }
    }
}