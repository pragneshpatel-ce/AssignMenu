using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Ninject;
using MenuLogic.Abstract;
using MenuLogic.Concreate;

namespace AssignTreeMenu.Infrastructure
{
	public class NinjectControllerFactory : DefaultControllerFactory
	{
		private IKernel ninjectKernal;
		public NinjectControllerFactory()
		{
			ninjectKernal = new StandardKernel();
			AddBinding();
		}
		protected override IController GetControllerInstance(System.Web.Routing.RequestContext requestContext, Type controllerType)
		{
			return controllerType == null
				? null : (IController)ninjectKernal.Get(controllerType);
		}

		public void AddBinding()
		{
			ninjectKernal.Bind<IMaster>().To<EFMaster>();
		}
	}
}
