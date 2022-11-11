using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Music.Models;
using Web_Music.Function;
using System.Data.SqlClient;


namespace Web_Music.Controllers
{
    public class HomeController : Controller
    {
        MyDBConect db = new MyDBConect();
        
        // GET: Home
        public ActionResult Index()
        {
            var list = new SanPhamF().SP();
            ViewBag.list = list;
            ViewBag.count = list.Count;
            return View();
            
        
            
        }
        public ActionResult MenuSP()
        {
            //var list = (from sp in db.SAN_PHAM.ToList()
            //                //            join tb in db.TRINH_BAY.ToList()
            //                //            on sp.masp equals tb.MaNS
            //                //            join ns in db.NGHE_SI.ToList()
            //                //            on tb.MaNS equals ns.mans
            //            select sp).ToList();
            //var list = db.SAN_PHAMs.ToList();
            var list = new SanPhamF().SP();
            int i = 0;
            ViewBag.list = list;
            foreach (var item in list)
            {
                ViewBag.i = item;
                i++;
            }
            ViewBag.size = i;
            //var list = db.SAN_PHAMs.SqlQuery("select * from san_pham").ToList();
            return PartialView();
        }

       public ActionResult Menu()
        {
            var list = db.SAN_PHAMs.ToList();
            return PartialView(list);
        }
        // GET: Home/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Home/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Home/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Home/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Home/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Home/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Home/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
