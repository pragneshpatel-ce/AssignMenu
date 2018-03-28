using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MenuLogic.Entity;
using MenuLogic.Abstract;

namespace AssignTreeMenu.Controllers
{
	public class AssignMenuController : Controller
	{
		private IMaster _iMaster;
		public AssignMenuController(IMaster imaster)
		{
			_iMaster = imaster;
		}

		public ActionResult Index()
		{
			var UserProfiles = _iMaster.UserProfile.ToList();
			return View(UserProfiles);
		}

		public ActionResult Setting(int uid)
		{
			List<Custom> lcust = new List<Custom>();
			int cnt = 0;
			try
			{
				List<MapTable> ischeck = _iMaster.MapTable.Where(c => c.loginid == uid).ToList();
				if (ischeck.Count() > 0)
				{
					List<tbemHead> remMenu = _iMaster.RemainMenu(uid).ToList();
					if (remMenu.Count() > 0)
					{
						foreach (var item in remMenu)
						{
							var index = remMenu.IndexOf(item);
							Custom c = new Custom();
							c.MapId = 0;
							c.Index = index;
							c.IsActive = false;
							c.MenuId = item.ID;
							c.MenuName = item.InnerHtml;
							c.ParentId = item.ParentId;
							c.UserId = uid;
							lcust.Add(c);
						}
					}
					if (remMenu.Count > 0)
					{
						cnt = remMenu.Count() - 1;
					}
					foreach (var data in ischeck)
					{
						Custom c = new Custom();
						c.MapId = data.MapId;
						c.Index = cnt;
						c.IsActive = data.IsActive;
						c.MenuId = data.HTMLID;
						c.MenuName = data.FKMenu.InnerHtml;
						c.ParentId = data.ParentId;
						c.UserId = data.loginid;
						lcust.Add(c);
						cnt = cnt + 1;
					}
				}
				else
				{
					var menu = _iMaster.Head.ToList();
					if (menu.Count > 0)
					{
						foreach (var item in menu)
						{
							var idx = menu.IndexOf(item);
							Custom c = new Custom();
							c.MapId = 0;
							c.Index = idx;
							c.MenuId = item.ID;
							c.MenuName = item.InnerHtml;
							c.UserId = uid;
							c.ParentId = Convert.ToInt32(item.ParentId);
							c.IsActive = false;
							lcust.Add(c);
						}
					}
				}
			}
			catch (Exception ex)
			{

			}
			return View(lcust);
		}

		[HttpPost]
		public ActionResult Setting(List<Custom> c, string wordlist)
		{
			try
			{
				var selectedIds = wordlist != null ? (wordlist.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries)) : null;

				List<MapTable> _lMap = new List<MapTable>();
				if (c.Count() > 0)
				{
					foreach (var item in c)
					{
						MapTable mp = new MapTable();
						mp.MapId = 0;
						if (selectedIds != null ? selectedIds.Contains(Convert.ToString(item.MenuId)) : false)
						{
							mp.IsActive = true;
						}
						else
						{
							mp.IsActive = false;
						}
						mp.loginid = Convert.ToInt32(item.UserId);
						mp.ParentId = Convert.ToInt32(item.ParentId);
						mp.HTMLID = Convert.ToInt32(item.MenuId);
						_lMap.Add(mp);
					}
				}
				_iMaster.Save(_lMap, (int)c.First().UserId);
				return Json(new[] { "Success", "Menu Assigened Successfully" }, JsonRequestBehavior.AllowGet);
			}
			catch (Exception ex)
			{
				return Json(new[] { "Fail", "Opps ! Something Went Wrong" }, JsonRequestBehavior.AllowGet);

			}
		}

	}
}
