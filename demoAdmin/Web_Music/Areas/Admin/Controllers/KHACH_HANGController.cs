using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web_Music.Models;
using System.Data;
using System.IO;

namespace Web_Music.Areas.Admin.Controllers
{
    public class KHACH_HANGController : Controller
    {
        private MyDBConect db = new MyDBConect();

        // GET: Admin/KHACH_HANG
      public ActionResult Index()
        {
            return View(db.KHACH_HANG.ToList());
        }

        // GET: Admin/KHACH_HANG/Details/5
        public async Task<ActionResult> Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KHACH_HANG kHACH_HANG = await db.KHACH_HANG.FindAsync(id);
            if (kHACH_HANG == null)
            {
                return HttpNotFound();
            }
            return View(kHACH_HANG);
        }

        // GET: Admin/KHACH_HANG/Create
        public ActionResult Create()
        {
            ViewBag.MaPQ = new SelectList(db.PHAN_QUYEN, "MaPQ", "TenQuyen");
            return View();
        }

        // POST: Admin/KHACH_HANG/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(KHACH_HANG kHACH_HANG)
        {
            if (ModelState.IsValid)
            {
                db.KHACH_HANG.Add(kHACH_HANG);
                db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaPQ = new SelectList(db.PHAN_QUYEN, "MaPQ", "TenQuyen", kHACH_HANG.MaPQ);
            return View(kHACH_HANG);
        }

        // GET: Admin/KHACH_HANG/Edit/5
        public async Task<ActionResult> Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KHACH_HANG kHACH_HANG = await db.KHACH_HANG.FindAsync(id);
            if (kHACH_HANG == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaPQ = new SelectList(db.PHAN_QUYEN, "MaPQ", "TenQuyen", kHACH_HANG.MaPQ);
            return View(kHACH_HANG);
        }

        // POST: Admin/KHACH_HANG/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaKH,TenKH,URL_img,UserName,Pass,DiaChi,SDT,STK,NgaySinh,TrangThai,GT,CCCD,Email,GhiChu,MaPQ")] KHACH_HANG kHACH_HANG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(kHACH_HANG).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaPQ = new SelectList(db.PHAN_QUYEN, "MaPQ", "TenQuyen", kHACH_HANG.MaPQ);
            return View(kHACH_HANG);
        }

        // GET: Admin/KHACH_HANG/Delete/5
        public async Task<ActionResult> Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            KHACH_HANG kHACH_HANG = await db.KHACH_HANG.FindAsync(id);
            if (kHACH_HANG == null)
            {
                return HttpNotFound();
            }
            return View(kHACH_HANG);
        }

        // POST: Admin/KHACH_HANG/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(string id)
        {
            KHACH_HANG kHACH_HANG = await db.KHACH_HANG.FindAsync(id);
            db.KHACH_HANG.Remove(kHACH_HANG);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
