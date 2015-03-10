﻿using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Linq;
using System.Web;
using GoCardlessSdk;
using GoCardlessSdk.Connect;

public class GoCardlessProvider
{
	public GoCardlessProvider()
	{
		GoCardless.Environment = (GoCardless.Environments)
			Enum.Parse(typeof (GoCardless.Environments), ConfigurationManager.AppSettings["gocardlessEnvironment"]);
		GoCardless.AccountDetails = new AccountDetails
		{
			AppId = ConfigurationManager.AppSettings["gocardlessAppId"],
			AppSecret = ConfigurationManager.AppSettings["gocardlessAppSecret"], 
			Token = ConfigurationManager.AppSettings["gocardlessToken"]
		};
	}

	public string MerchantId
	{
		get { return ConfigurationManager.AppSettings["gocardlessMerchantId"]; }
	}

	public string CreateBill(BillRequest billRequest, string redirectUri, string cancelUri)
	{
		string requestUrl = new GoCardlessSdk.Connect.ConnectClient().NewBillUrl(billRequest, redirectUri, cancelUri);
		return requestUrl;
	}

	public void ConfirmBill(NameValueCollection confirmQueryStringCollection)
	{
		GoCardless.Connect.ConfirmResource(confirmQueryStringCollection);
	}
}