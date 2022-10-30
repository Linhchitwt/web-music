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
        public string Insert(TAI_KHOAN entity)
        {
            db.TAI_KHOAN.Add(entity);
            db.SaveChanges();
            return entity.UserName;
        }
        //public bool Update(TAI_KHOAN entity)
        //{
        //    try
        //    {
        //        var user = db.TAI_KHOAN.Find(entity.ID);
        //        user.Name = entity.Name;
        //        if (!string.IsNullOrEmpty(entity.Password))
        //        {
        //            user.Password = entity.Password;
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
        public IEnumerable<TAI_KHOAN> ListAllPaging(string searchString, int page, int pageSize)
        {
            IQueryable<TAI_KHOAN> model = db.TAI_KHOAN;
            if (!string.IsNullOrEmpty(searchString))
            {
                model = model.Where(x => x.UserName.Contains(searchString));
            }
            return model.ToPagedList(page, pageSize);
            //tao dau trang
        }
        public TAI_KHOAN GetById(string userName)
        {
            return db.TAI_KHOAN.SingleOrDefault(x => x.UserName == userName);
        }
        public TAI_KHOAN ViewDetail(string username)
        {
            return db.TAI_KHOAN.Find(username);
        }

        public int Login(string userName, string passWord)
        {
            var result = db.TK_AD.SingleOrDefault(x => x.UserName == userName);
            if (result == null)
            {
                return 0;
            }
            else
            {
                if (result.TrangThai == false)
                {
                    return -1;
                }
                else
                {
                    if (result.PassWord == passWord)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                }
            }

        }

    }
}
