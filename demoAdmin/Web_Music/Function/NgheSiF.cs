using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Music.Models;
using System.Web.Mvc;
using System.Web.Security;

namespace Web_Music.Function
{
    public class NgheSiF
    {
        MyDBConect db = new MyDBConect();
     
        public List<NGHE_SI> ListAll()
        {
            var result = db.NGHE_SIs.ToList();
            return result;
        }
        public List<NGHE_SI> ListBrand(string ID)
        {
            var result = db.NGHE_SIs.Where(p => p.mans == ID).ToList();
            return result;
        }
        public string AutoID()
        {
            string result;
            //string values = db.NGHE_SIs.SqlQuery("SELECT max(RIGHT(MAns, 8)) FROM nghe_si").SingleOrDefault().ToString();
            int value = int.Parse(db.Database.SqlQuery<string>("SELECT max(RIGHT(MAns, 8)) FROM nghe_si").SingleOrDefault().ToString());
            if (0 <= value&&value < 9)
            {
                result = "NS0000000" + Convert.ToString(value+1);
            }
            else if (9 <= value && value < 99)
            {
                result = "NS000000" + Convert.ToString(value + 1);
            }
            else if (99 <= value && value < 999)
            {
                result = "NS00000" + Convert.ToString(value + 1);
            }
            else if (999 <= value && value < 9999)
            {
                result = "NS0000" + Convert.ToString(value + 1);
            }
            else if (9999 <= value && value < 99999)
            {
                result = "NS000" + Convert.ToString(value + 1);
            }
            else if (99999 <= value && value <999999)
            {
                result = "NS00" + Convert.ToString(value + 1);
            }
           
            else 
            {
                result = "NS0" + Convert.ToString(value + 1);
            }
            return result;
        }
        public bool Insert(NGHE_SI Model)
        {
            var result = db.NGHE_SIs.Find(Model.mans);
       
            if (result != null)
            {
                return false;
            }
            else
            {
                db.NGHE_SIs.Add(Model);
                db.SaveChanges();
                return true;
            }
        }
        public NGHE_SI Find(string id)
        {
            var result = db.NGHE_SIs.Find(id);
            return result;
        }
        public bool Edit(NGHE_SI Model)
        {
            var result = db.NGHE_SIs.Find(Model.mans);
            if (result != null)
            {
                result.mans = Model.mans;
                result.TenNS = Model.TenNS;
                result.GT = Model.GT;
                result.URL_img = Model.URL_img;
                result.QueQuan = Model.QueQuan;
              
                result.NS_URL = Model.NS_URL;
                result.NgheDanh = Model.NgheDanh;
                db.SaveChanges();
                return true;
            }
            else return true;
        }
        public bool Delete(string id)
        {
            var result = db.NGHE_SIs.Find(id);
            if (result != null)
            {
                db.NGHE_SIs.Remove(result);
                db.SaveChanges();
                return true;
            }
            else return false;
        }
       
    }
}