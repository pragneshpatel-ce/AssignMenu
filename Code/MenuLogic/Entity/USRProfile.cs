using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MenuLogic.Entity
{
	[Table("tbusr")]
	public class USRProfile
	{
		[Key]
		public int usrid { get; set; }
		public long? usrempid { get; set; }
		public string usrnam { get; set; }
		public string usrpass { get; set; }
		public string usrdesc { get; set; }
		public int? isPublished { get; set; }
		public int? StoreId { get; set; }
		public int? IsCrtId { get; set; }
		public DateTime? IsCrtDate { get; set; }
		public int? IsUpdId { get; set; }
		public DateTime? IsUpdDate { get; set; }
	}
}
