﻿using System.Collections.Generic;
using System.Linq;
using System.Web;
using Mstc.Core.DataAccess;
using umbraco.BusinessLogic;
using umbraco.presentation.umbracobase;

namespace Mstc.Core.WebMethods
{
	[RestExtension("SwimAdmin")]
	public class SwimAdmin
	{
		[RestExtensionMethod()]
		public static bool UpdateSwimCredits()
		{
			string memberNodeIdsString = HttpContext.Current.Request["memberNodeIds"];
            int creditCost =4;

			IMemberDal memberDal = new MemberDal(new DataConnection());

		    if (memberNodeIdsString.Length > 0)
		    {
                List<string> nodeIds = memberNodeIdsString.Split(',').ToList();
                int.TryParse(HttpContext.Current.Request["memberCost"], out creditCost);
                memberDal.UpdateSwimCredits(nodeIds, creditCost);
		    }

            Log.Add(LogTypes.Custom, -1, string.Format("Decremented swim credits for nodeIds: {0}", memberNodeIdsString));

			return true;
		}

	}
}