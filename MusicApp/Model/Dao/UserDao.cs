using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;
using Model.EF;
namespace Model.Dao
{
    public class UserDao
    {
        Model1 db = null;
        public UserDao()
        {
            db = new Model1();
        }
        //public long Insert(KHACH_HANG entity)
        //{
        //    db.KHACH_HANG.Add(entity);
        //    db.SaveChanges();
        //    return entity.CCCD;
        //}
        //public string Insert(KHACH_HANG entity)
        //{
        //    db.KHACH_HANG.Add(entity);
        //    db.ADMIN.Add(entity);
        //    db.SaveChanges();
        //    return entity.makh;
        //}
        //public bool Update(ADMIN entity)
        //{
        //    try
        //    {
        //        var user = db.ADMIN.Find(entity.ID);
        //        user.Name = entity.Name;
        //        if (!string.IsNullOrEmpty(entity.Pass))
        //        {
        //            user.Pass = entity.Pass;
        //        }
        //        user.Phone = entity.Phone;
        //        user.Email = entity.Email;
        //        user.Address = entity.Address;
        //        user.ModifieBy = entity.ModifieBy;
        //        user.ModifiedDate = DateTime.Now;
        //        db.SaveChanges();
        //        return true;

        //    }
        //    catch (Exception ex)
        //    {
        //        return false;
        //    }
        //}
        public IEnumerable<ADMIN> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<ADMIN> model = db.ADMINs;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString));
            }
            return model.ToPagedList(page, pageSize);
            //tao dau trang
        }
        public ADMIN GetBymaKH(string username)
        {
            return db.ADMINs.SingleOrDefault(x => x.UserName == username);
        }
        public ADMIN ViewDetail(string username)
        {
            return db.ADMINs.Find(username);
        }

        public int Login(string userName, string passWord)
        {
            var result = db.ADMINs.SingleOrDefault(x => x.UserName == userName);
            //var resultKH = db.KHACH_HANG.SingleOrDefault(x => x.UserName == userName);
            if (result == null/* && resultKH == null*/)
            {
                return 0;
            }
            //if (resultKH != null && resultKH.UserName == userName)
            //{
            //    if (resultKH.TrangThai == false)
            //    {
            //        return -1;
            //    }
            //    else
            //    {
            //        if (resultKH.Pass == passWord)
            //        {
            //            return 2;
            //        }
            //        else
            //        {
            //            return -2;
            //        }
            //    }
            //}
            else if (result.UserName == userName)
            {
                if (result.TrangThai == false)
                {
                    return -1;
                }
                else
                {
                    if (result.Pass == passWord)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
            else
            {
                return -9;
            }

        }

    }
}
