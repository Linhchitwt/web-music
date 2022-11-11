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
        public string Insert(KHACH_HANG entity)
        {
            db.KHACH_HANG.Add(entity);
            db.SaveChanges();
            return entity.UserName;
        }

       
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
            var resultKH = db.KHACH_HANG.SingleOrDefault(x => x.UserName == userName);
            if (result == null && resultKH == null)
            {
                return 0;
            }
            else if (resultKH != null && resultKH.UserName == userName)
            {
                if (resultKH.TrangThai == false)
                {
                    return -1;
                }
                else
                {
                    if (resultKH.Pass == passWord)
                    {
                        return 2;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }
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
