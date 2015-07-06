﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using cFront.Umbraco;
using Newtonsoft.Json;
using umbraco.cms.businesslogic.member;

public partial class usercontrols_cFront_RenewMemberComplete : System.Web.UI.UserControl
{
	protected SessionProvider _sessionProvider;
	protected SessionProvider SessionProvider
	{
		get
		{
			if (_sessionProvider == null)
			{
				_sessionProvider = new SessionProvider();
			}
			return _sessionProvider;
		}
	}

	protected void Page_Load(object sender, EventArgs e)
    {
		if (IsPostBack == false)
		{
			var member = Member.GetCurrentMember();
			var membershipOptions = SessionProvider.RenewalOptions;
			if (member == null || membershipOptions == null)
			{
				return; //Ensure user is logged in and request hasn't been duplicated
			}

			//lblQueryString.Text = Request.QueryString["resource_uri"];
		    if (Request.QueryString["resource_uri"] != null)
		    {
			    ConfirmPaymentRequest();
		    }
			var memberProvider = new MemberProvider();
			memberProvider.UpdateMemberOptions(member, membershipOptions, null);

			SessionProvider.RenewalOptions = null;
	    }
    }

	private void ConfirmPaymentRequest()
	{
		var goCardlessProvider = new GoCardlessProvider();
		goCardlessProvider.ConfirmBill(Request.QueryString);
	}
}