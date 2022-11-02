using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Music.Models;

namespace Web_Music.Areas.Admin.Controllers
{
    public class SANPHAMController : Controller
    {
        MyDBConect db = new MyDBConect();
        // GET: Admin/SANPHAM
        public ActionResult Index()
        {
            
            var list = db.SAN_PHAMs.ToList();
            return View(list);
        }
    }
}