using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MenuLogic.Entity
{
	[Table("tbemHead")]
	public class tbemHead
	{
		[Key]
		public int ID { get; set; }
		public string InnerHtml { get; set; }
		public string Url { get; set; }
		public int? ParentId { get; set; }
		public int? LoginID { get; set; }
		public int? isPublish { get; set; }
	}
}
