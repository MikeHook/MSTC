using System;
using System.Data;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Net.Mail;
using System.Collections.Generic;

namespace cFront.Projects.CFSL.Web.UI.UserControls
{
	// ===============================================================================================================================================================
    public class ContactForm : UserControl
	{
		protected TextBox 		txtName, txtEmail, txtMsg;
		protected DropDownList topicSelect;
		protected PlaceHolder 	phMessageForm, phMessageSent;
		protected int			intViewState;
		protected Label			lblResult;
		
		void Page_Load()
		{
			ViewState["ViewContactForm"] = 0;
			
			intViewState = (int)ViewState["ViewContactForm"];
			
			if(intViewState == 0)
			{
				phMessageSent.Visible = false;
				phMessageForm.Visible = true;
			}
			else if(intViewState == 1)
			{
				phMessageSent.Visible = true;
				phMessageForm.Visible = false;
			}
			
		}
			
		protected void SendMessage(Object s, EventArgs e)
		{	
			if(Page.IsValid)
			{
				MailMessage objMail = new MailMessage();

				Dictionary<string, string> emailLookup = new Dictionary<string, string>() {
					{ "Membership", "members@midsussextriclub.com" },
					{ "Sponsorship", "sponsorship@midsussextriclub.com" },
					{ "Juniors", "juniors@midsussextriclub.com" },
					{ "Website", "support@midsussextriclub.com" },
				};

				string toAddress;
				if (emailLookup.TryGetValue(topicSelect.SelectedValue, out toAddress) == false)
					toAddress = ConfigurationManager.AppSettings["contactFormEmailTo"] ?? "info@midsussextriclub.com";

				objMail.To.Add(toAddress);
				objMail.From = new MailAddress(txtEmail.Text);
				objMail.Subject = "[Website Enquiry]";
				
				objMail.IsBodyHtml = true;
				
				objMail.Body = "<p>" + txtMsg.Text + "</p><p>Message from: " + txtName.Text + "</p><p>Email: " + txtEmail.Text + "</p>";

				var GmailSmtpClient = new GmailSmtpClient();
				GmailSmtpClient.Send(objMail);
					
				ViewState["ViewContactForm"] = 1;
				
				phMessageSent.Visible = true;
				phMessageForm.Visible = false;
			}
			else
			{
				lblResult.Text = "The words you entered were incorrect. Please try again";
				lblResult.Visible = true;
			}
		}
	}
}	