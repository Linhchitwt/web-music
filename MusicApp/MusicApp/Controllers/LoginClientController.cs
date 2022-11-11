using Model.Dao;
using MusicApp.Models;
using MusicApp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicApp.Controllers
{
    public class LoginClientController : BaseController
    {
        // GET: LoginClient
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login(LoginClientModel model)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserDao();
                var resultKH = dao.Login(model.UserName, Encryptor.MD5Hash(model.PassWord));
                if (resultKH == 2)
                {
                    var userKH = dao.GetBymaKH(model.UserName);
                    var userSessionKH = new UserLogin();
                    Session.Add(CommonConstants.USER_SESSION, userSessionKH);
                    return RedirectToAction("Index", "Home");
                }
                else if (resultKH == 0)
                {
                    ModelState.AddModelError("", "Account is not exist");
                }
                else if (resultKH == -1)
                {
                    ModelState.AddModelError("", "Your account is blocked");
                }
                else if (resultKH == -2)
                {
                    ModelState.AddModelError("", "Password is not correct");
                }
            }
            return View("Index");
        }
        

        }
}