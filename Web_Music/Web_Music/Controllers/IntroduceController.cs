using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web_Music.Models;
using Web_Music.Function;

namespace Web_Music.Controllers
{
    public class IntroduceController : Controller
    {
        MyDBConect db = new MyDBConect();
        // GET: Introduce
        public ActionResult Index()
        {
            return View();
        }
        //public ActionResult DangKi()
        //{

        //    return PartialView();
        //}

        public ActionResult DangKi(KHACH_HANG Model)
        {
            //var item = new KhachHangF();
           
            //Model.MaKH= item.AutoID();
            //db.KHACH_HANG.Add(Model);
            //db.SaveChanges();
            return PartialView();
        }
     
        
        // GET: Introduce/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Introduce/Create
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

        // GET: Introduce/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Introduce/Edit/5
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

        // GET: Introduce/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Introduce/Delete/5
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
