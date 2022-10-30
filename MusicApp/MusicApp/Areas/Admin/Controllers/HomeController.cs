using Model.Dao;
using MusicApp.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicApp.Areas.Admin.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index()
        {
            return View();
        }

    }
}