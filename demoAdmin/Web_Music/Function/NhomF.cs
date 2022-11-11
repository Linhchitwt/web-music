using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web_Music.Models;

namespace Web_Music.Function
{
    public class NhomF
    {
        MyDBConect db = new MyDBConect();
        public List<NHOM> ListAll()
        {
            var result = db.NHOMs.ToList();
            return result;
        }
        public List<NHOM> ListBrand(string ID)
        {
            var result = db.NHOMs.Where(p => p.MaNHOM == ID).ToList();
            return result;
        }
        public string AutoID()
        {
            string result;
            //string values = db.NHOMs.SqlQuery("SELECT max(RIGHT(MAns, 8)) FROM NHOM").SingleOrDefault().ToString();
            int value = int.Parse(db.Database.SqlQuery<string>("SELECT max(RIGHT(MaNHOM, 8)) FROM NHOM").SingleOrDefault().ToString());
            if (0 <= value && value < 9)
            {
                result = "NH0000000" + Convert.ToString(value + 1);
            }
            else if (9 <= value && value < 99)
            {
                result = "NH000000" + Convert.ToString(value + 1);
            }
            else if (99 <= value && value < 999)
            {
                result = "NH00000" + Convert.ToString(value + 1);
            }
            else if (999 <= value && value < 9999)
            {
                result = "NH0000" + Convert.ToString(value + 1);
            }
            else if (9999 <= value && value < 99999)
            {
                result = "NH000" + Convert.ToString(value + 1);
            }
            else if (99999 <= value && value < 999999)
            {
                result = "NH00" + Convert.ToString(value + 1);
            }

            else
            {
                result = "NS0" + Convert.ToString(value + 1);
            }
            return result;
        }
        public bool Insert(NHOM Model)
        {
            var result = db.NHOMs.Find(Model.MaNHOM);

            if (result != null)
            {
                return false;
            }
            else
            {
                db.NHOMs.Add(Model);
                db.SaveChanges();
                return true;
            }
        }
        public NHOM Find(string id)
        {
            var result = db.NHOMs.Find(id);
            return result;
        }
        public bool Edit(NHOM Model)
        {
            var result = db.NHOMs.Find(Model.MaNHOM);
            if (result != null)
            {
                //result.mans = Model.mans;
                //result.TenNS = Model.TenNS;
                //result.GT = Model.GT;
                //result.URL_img = Model.URL_img;
                //result.QueQuan = Model.QueQuan;
                //result.ThongTin = Model.ThongTin;
                //result.NS_URL = Model.NS_URL;
                //result.NgheDanh = Model.NgheDanh;
                //db.SaveChanges();
                return true;
            }
            else return true;
        }
        public bool Delete(string id)
        {
            var result = db.NHOMs.Find(id);
            if (result != null)
            {
                db.NHOMs.Remove(result);
                db.SaveChanges();
                return true;
            }
            else return false;
        }
    }
}