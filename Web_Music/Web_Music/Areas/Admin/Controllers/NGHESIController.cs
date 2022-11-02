using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Web_Music.Models;
using System.Data;
using System.IO;
using Web_Music.Function;


namespace Web_Music.Areas.Admin.Controllers
{
    public class NGHESIController : Controller
    {
        MyDBConect db = new MyDBConect();
        // GET: Admin/NGHESI
        public ActionResult Index()
        {

            var nghesi = new NgheSiF();
            var list = nghesi.ListAll();
            //ViewBag.size = list.Count();
            //ViewBag.list = list;
            return View(list);
        }
        //[HttpGet]
        public ActionResult Create()
        {
            NGHE_SI ns = new NGHE_SI();
            ViewBag.MaNhom = new SelectList(db.NHOMs, "MaNhom", "TenNhom");
            return View(ns);
        }
        [HttpPost]

        [ValidateAntiForgeryToken]
        public ActionResult Create(NGHE_SI Model)
        {

            //var item = new NgheSiF();
            //Model.mans = item.AutoID();
            //db.NGHE_SIs.Add(Model);

            //db.SaveChanges();
            ////if(url_img!=null && url_img.ContentLength > 0)
            ////{
            ////    int id=int.Parse()
            ////}
            //return View(Model);

            //try
            //{
                //if (ModelState.IsValid)
                //ViewBag.MaNhom = new SelectList(db.NHOMs, "MaNhom", "TenNhom");
                var item = new NgheSiF();
                    Model.mans = item.AutoID();
                   
                if (Model.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(Model.ImageUpload.FileName);
                    string extension = Path.GetExtension(Model.ImageUpload.FileName);
                    Model.URL_img = "~/Assets/img/album/" + fileName;
                    Model.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Assets/img/album/"), fileName));
                }
                var result = item.Insert(Model);
                db.SaveChanges();
                //if (url_img!=null && url_img.ContentLength > 0)
                //{
                //    //int id = int.Parse(db.NGHE_SIs.ToList().Last().mans.ToString());
                //    string _FileName = "";
                //    int index = url_img.FileName.IndexOf('.');
                //    //_FileName = "NV" + id.ToString() + "." + url_img.FileName.Substring(index + 1);
                //    _FileName = url_img.FileName.ToString();
                //    string _path=Path.Combine(Server.MapPath("~/Asset/"),_FileName);
                //    url_img.SaveAs(_path);
                //    Model.URL_img = _FileName;
                //    db.SaveChanges();
                //}
                     return RedirectToAction("Index");
                    
                    //    ModelState.AddModelError("", "Insert item Unsucessfully");
                    //}
                //}
                ////return View(Model);
            //}
            //catch
            //{
            //    return View();
            //}
        }
        [HttpGet]

        public ActionResult Edit(string id)
        {
            var item = new NgheSiF();
            var result = item.Find(id);
            if (result == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            //var Cate = new CategoryF();
            //ViewBag.Category = Cate.ListAll();
            return View(result);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NGHE_SI Model)
        {
            try
            {
                    var item = new NgheSiF();
                    var result = item.Edit(Model);
                    if (result == true) return RedirectToAction("Index");
                    else
                    {
                        ModelState.AddModelError("", "Edit item Unsucessfully");
                    }
                
                //ViewBag.Category = new SelectList(db.NGHE_SIs.ToList(), "Id", "Name", Model.mans);
                return View(Model);
            }
            catch
            {
                return View();
            }
        }

       
        public ActionResult Delete(string ID)
        {
            var item = new NgheSiF();
            //var result = item.Find(ID);
            //if (result == null)
            //{
            //    Response.StatusCode = 404;
            //    return null;
            //}
            //return View(result);
            var result = item.Delete(ID);
            return RedirectToAction("Index");
            //if (result == true)
            //    return RedirectToAction("Index");
            //else
            //{
            //    ModelState.AddModelError("", "Edit item Unsucessfully");
            //    return RedirectToAction("Index");
            //}

        }
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public ActionResult Delete(NGHE_SI Model    )
        //{

        //    var item = new NgheSiF();
        //    var result = item.Delete(Model.mans);
        //    if (result == true) 
        //        return RedirectToAction("Index");
        //    else
        //    {
        //        ModelState.AddModelError("", "Edit item Unsucessfully");
        //    }
        //    return View(Model);
        //}
        public ActionResult Detail(string id)
        {
          
            var item = new NgheSiF();
            //var qs = db.Database.SqlQuery<string>("SELECT max(RIGHT(mans, 8)) FROM nghe_si").SingleOrDefault();
            ////string val = qs.ToString();
            //ViewBag.qs = qs.ToString();
            var result = item.ListBrand(id);
            //ViewBag.img = item.Find(id).URL_img;
            ViewBag.NgheSi = result;
            return View();
        }

    }

    //[HttpGet]

    //public ActionResult Edit(string ID)
    //{
    //    var item = new NgheSiF();
    //    var result = item.Find(ID);
    //    if (result == null)
    //    {
    //        Response.StatusCode = 404;
    //        return null;
    //    }
    //    //var Cate = new CategoryF();
    //    //ViewBag.Category = Cate.ListAll();
    //    return View(result);
    //}
    //[HttpPost]
    //[ValidateAntiForgeryToken]
    //public ActionResult Edit(Producer Model)
    //{
    //    try
    //    {
    //        if (ModelState.IsValid)
    //        {
    //            var item = new ProducerF();
    //            var result = item.Edit(Model);
    //            if (result == true) return RedirectToAction("Index");
    //            else
    //            {
    //                ModelState.AddModelError("", "Edit item Unsucessfully");
    //            }
    //        }
    //        ViewBag.Category = new SelectList(db.Categories.ToList(), "Id", "Name", Model.IdParent);
    //        return View(Model);
    //    }
    //    catch
    //    {
    //        return View();
    //    }
    //}
  
  
}