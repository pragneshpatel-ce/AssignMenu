using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MenuLogic.Entity
{
	[Table("MapTable")]
	public class MapTable
	{
		[Key]
		public int MapId { get; set; }
		public int loginid { get; set; }
		[ForeignKey("loginid")]
		public virtual USRProfile FkUser { get; set; }
		public int HTMLID { get; set; }
        [ForeignKey("HTMLID")]
        public virtual tbemHead FKMenu { get; set; }
        public int ParentId { get; set; }
		public bool IsActive { get; set; }
	}

	public class Custom
	{
        public int MapId { get; set; }
        public int Index { get; set; }
		public int? MenuId { get; set; }
		public string MenuName { get; set; }
		public int? UserId { get; set; }
		public int? ParentId { get; set; }
		public bool IsActive { get; set; }
	}
}
