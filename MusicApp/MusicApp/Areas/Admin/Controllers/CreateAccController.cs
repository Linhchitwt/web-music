using Model.Dao;
using Model.EF;
using MusicApp.Areas.Admin.Model;
using MusicApp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicApp.Areas.Admin.Controllers
{
    public class CreateAccController : BaseController
    {
        Model1 db = new Model1();
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(int id = 0)
        {
            RegisterInfo obj = new RegisterInfo();
            TAI_KHOAN tk = new TAI_KHOAN();
            var lasttk = db.TAI_KHOAN.OrderByDescending(c => c.ID).FirstOrDefault();
            if (id != 0)
            {
                tk = db.TAI_KHOAN.Where(x => x.ID == id).FirstOrDefault<TAI_KHOAN>();
            }
            else if (lasttk == null)
            {
                tk.MaKH = "TK00000001";
            }
            else
            {
                tk.MaKH = "TK" + (Convert.ToInt32(lasttk.MaKH.Substring(8, lasttk.MaKH.Length - 8)) + 1).ToString("D3");
            }
            tk.UserName = obj.UserName;
            tk.PassWord = obj.Password;
            tk.TrangThai = true;
            tk.MaPQ = "2";
            db.TAI_KHOAN.Add(tk);
            db.SaveChanges();
            return View("Index");
        }
        
        //[HttpPost]
        //public ActionResult Create(TAI_KHOAN acc)
        //{
        //    using (db)
        //    {
        //        db.TAI_KHOAN.Add(acc);
        //        db.SaveChanges();
        //    }
        //    return View("Index");
            
        //}
    }
}