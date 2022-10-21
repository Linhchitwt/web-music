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

        public TK_AD GetById(string userName)
        {
            return db.TK_AD.SingleOrDefault(x => x.UserName == userName);
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
