using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using MenuLogic.Entity;
using MenuLogic.Abstract;
using System.Data.SqlClient;

namespace MenuLogic.Concreate
{
    public class EFMaster : IMaster
    {
        public Context con = new Context();

        public IQueryable<USRProfile> UserProfile
        {
            get
            {
                return con.dbUSRProfile;
            }
        }
        public IQueryable<tbemHead> Head
        {
            get
            {
                return con.dbtbemHead;
            }
        }
        public IQueryable<MapTable> MapTable
        {
            get
            {
                return con.dbMapTable;
            }
        }

        public void Save(List<MapTable> c,int uid)
        {
            var prevdata = con.dbMapTable.Where(d => d.loginid == uid).ToList();
            if (prevdata.Count() > 0)
            {
                con.dbMapTable.RemoveRange(prevdata);
            }
            con.dbMapTable.AddRange(c);
            con.SaveChanges();
        }

        public List<tbemHead> RemainMenu(int uid)
        {
            List<tbemHead> _list = new List<tbemHead>();
            _list = con.Database.SqlQuery<tbemHead>("EXEC RemainingMeni @Uid", new SqlParameter("@Uid", uid)).ToList();
            return _list;
        }
    }
}
