using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Web_Music.Controllers
{
    public class TrendController : Controller
    {
        // GET: Trend
        public ActionResult Index()
        {
            return View();
        }

        // GET: Trend/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Trend/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Trend/Create
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

        // GET: Trend/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Trend/Edit/5
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

        // GET: Trend/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Trend/Delete/5
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
