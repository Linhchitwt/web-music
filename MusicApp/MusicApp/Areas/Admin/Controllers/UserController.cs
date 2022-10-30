using Model.Dao;
using Model.EF;
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
        // GET: Admin/User
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.searchString = searchString; //giu duoc chu trong o tim kiem
            return View(model);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpGet]

        public ActionResult Edit(string username)
        {
            var user = new UserDao().ViewDetail(username);

            return View(user);
        }

        [HttpPost]
        public ActionResult Create(TAI_KHOAN user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();

                var encriptedMd5Pas = Encryptor.MD5Hash(user.PassWord);
                user.PassWord = encriptedMd5Pas;

                string userName = dao.Insert(user);
                if (userName != "")
                {
                    return RedirectToAction("Index", "User");
                }
                else
                {
                    ModelState.AddModelError("", "Add user successfully");
                }
            }
            return View("Index");

        }
        //public ActionResult Edit(TAI_KHOAN user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        var dao = new UserDao();
        //        if (!string.IsNullOrEmpty(user.Password))
        //        {
        //            var encriptedMd5Pas = Encryptor.MD5Hash(user.Password);
        //            user.Password = encriptedMd5Pas;
        //        }

        //        var result = dao.Update(user);
        //        if (result)
        //        {
        //            return RedirectToAction("Index", "User");
        //        }
        //        else
        //        {
        //            ModelState.AddModelError("", "Update user successfully");
        //        }
        //    }
        //    return View("Index");

        //}
        //[HttpDelete]
        //public ActionResult Delete(int id)
        //{
        //    new UserDao().Delete(id);
        //    return RedirectToAction("Index");
        //}
    
    }
}