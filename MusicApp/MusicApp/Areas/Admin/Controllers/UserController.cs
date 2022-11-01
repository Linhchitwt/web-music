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
    
    public class UserController : BaseController
    {
        Model1 db = new Model1();
        // GET: Admin/User
        public ActionResult Index(string searchString, int page = 1, int pageSize = 10)
        {
            var dao = new UserDao();
            var model = dao.ListAllPaging(searchString, page, pageSize);
            ViewBag.searchString = searchString; //giu duoc chu trong o tim kiem
            return View(model);
        }
        [HttpGet]
        public ActionResult CreateTK()
        {
            return View();
        }
        [HttpPost]
        //public ActionResult CreateTK(RegisterInfo obj)
        //{
        //    var dao = new UserDao();
        //    KHACH_HANG kh = new KHACH_HANG();
        //    kh.TenKH = obj.Name;
        //    kh.DiaChi = obj.Address;
        //    kh.SDT = obj.PhoneNumber;
        //    kh.NgaySinh = obj.Birthday;
        //    kh.CCCD = obj.Identitycard;
        //    kh.TrangThai = true;
        //    db.KHACH_HANG.Add(kh);
        //    db.SaveChanges();

        //    TAI_KHOAN tk = new TAI_KHOAN();
        //    tk.UserName = obj.UserName;
        //    tk.PassWord = obj.Password;
        //    tk.TrangThai = true;
        //    tk.MaPQ = "2";
        //    int id = dao.Insert(tk);
        //    if (id > 0)
        //    {
        //        return RedirectToAction("Index", "Home");
        //    }
        //    else
        //    {
        //        ModelState.AddModelError("", "Add user successfully");
        //    }
        //    return View("Index");
            

        //}
        public ActionResult CreateTK(int id = 0)
        {
            TAI_KHOAN tk = new TAI_KHOAN();
            var lasttk = db.TAI_KHOAN.OrderByDescending(c => c.ID).FirstOrDefault();
            if (id != 0)
            {
                tk = db.TAI_KHOAN.Where(x => x.ID == id).FirstOrDefault<TAI_KHOAN>();
            }
            else if (lasttk == null)
            {
                tk.MaKH = "TK00000001";
            }
            else
            {
                tk.MaKH = "TK" + (Convert.ToInt32(lasttk.MaKH.Substring(8, lasttk.MaKH.Length - 8)) + 1).ToString("D3");
            }
            return View("Index");
        }
        [HttpGet]

        public ActionResult Edit(string username)
        {
            var user = new UserDao().ViewDetail(username);

            return View(user);
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