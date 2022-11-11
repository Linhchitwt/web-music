using Model.Dao;
using Model.EF;
using MusicApp.Areas.Admin.Model;
using MusicApp.Common;
using MusicApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MusicApp.Controllers
{
    public class CreateAccController : BaseController
    {
        Model1 Db = new Model1();
        // GET: CreateAcc
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(KHACH_HANG client)
        {
            using (Db)
            {
                var lastKH = Db.KHACH_HANG.OrderByDescending(c => c.ID).FirstOrDefault();
                if (client.ID != 0)
                {
                    client = Db.KHACH_HANG.Where(x => x.ID == client.ID).FirstOrDefault<KHACH_HANG>();

                }
                else if (lastKH == null)
                {
                    client.MaKH = "KH00000001";
                }
                else
                {
                    client.MaKH = "KH" + (Convert.ToInt64(lastKH.MaKH.Substring(2, lastKH.MaKH.Length - 2)) + 1).ToString("D8");
                    var encriptedMd5Pas = Encryptor.MD5Hash(client.Pass);
                    client.Pass = encriptedMd5Pas;
                }
                Db.KHACH_HANG.Add(client);
                Db.SaveChanges();
            }
            return RedirectToAction("Index", "LoginClient");
        }
    }
}