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
    
    public class UserController : BaseController
    {
        Model1 db = new Model1();
        // GET: Admin/User
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.searchString = searchString; //giu duoc chu trong o tim kiem
            return View(model);
        }
        [HttpGet]
        public ActionResult CreateTK()
        {
            return View();
        }
        [HttpPost]
        
        //public ActionResult CreateTK(int id = 0)
        //{
        //    ADMIN tk = new ADMIN();
        //    var lasttk = db.KHACH_HANG.OrderByDescending(c => c.ID).FirstOrDefault();
        //    if (id != 0)
        //    {
        //        tk = db.ADMIN.Where(x => x.ID == id).FirstOrDefault<ADMIN>();
        //    }
        //    else if (lasttk == null)
        //    {
        //        tk.MaKH = "TK00000001";
        //    }
        //    else
        //    {
        //        tk.MaKH = "TK" + (Convert.ToInt32(lasttk.MaKH.Substring(8, lasttk.MaKH.Length - 8)) + 1).ToString("D3");
        //    }
        //    return View("Index");
        //}
        [HttpGet]

        public ActionResult Edit(string username)
        {
            var user = new UserDao().ViewDetail(username);

            return View(user);
        }

        
    }
}