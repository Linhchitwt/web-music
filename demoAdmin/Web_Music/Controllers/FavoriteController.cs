using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Music.Controllers
{
    public class FavoriteController : Controller
    {
        // GET: Favorite
        public ActionResult Index()
        {
            return View();
        }
    }
}