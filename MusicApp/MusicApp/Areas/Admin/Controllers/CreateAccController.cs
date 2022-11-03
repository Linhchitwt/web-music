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
        //[HttpPost]
        //public ActionResult Create(KHACH_HANG user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var dao = new UserDao();

        //        var encriptedMd5Pas = Encryptor.MD5Hash(user.Pass);
        //        user.Pass = encriptedMd5Pas;

        //        long id = dao.Insert(user);
        //        if (id > 0)
        //        {
        //            return RedirectToAction("Index", "Login");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "Add user successfully");
        //        }
        //    }
        //    return View("Index");

        //}
        
    }
}