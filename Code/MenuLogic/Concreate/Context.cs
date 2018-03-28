using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using MenuLogic.Entity;

namespace MenuLogic.Concreate
{
	public class Context:DbContext
	{
		public Context() : base("demoCon") { }
		public DbSet<USRProfile> dbUSRProfile { get; set; }
		public DbSet<MapTable> dbMapTable { get; set; }
		public DbSet<tbemHead> dbtbemHead { get; set; }
	}
}
