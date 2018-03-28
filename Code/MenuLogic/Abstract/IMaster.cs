using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MenuLogic.Entity;

namespace MenuLogic.Abstract
{
	public interface IMaster
	{
		IQueryable<USRProfile> UserProfile { get; }
		IQueryable<tbemHead> Head { get; }
		IQueryable<MapTable> MapTable { get; }

        void Save(List<MapTable> c,int uid);
        List<tbemHead> RemainMenu(int uid);
	}
}
