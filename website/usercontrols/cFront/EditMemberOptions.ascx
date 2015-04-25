﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditMemberOptions.ascx.cs" Inherits="usercontrols_cFront_EditMemberOptions" %>

<h2>Membership</h2>

<div class="contact-form-wrapper">
    <div class="form-group <%=EnableRenewal ? "" : "hide"%>">
        <div class="col-sm-12">
            <umbraco:Macro ID="membershipRenewalPageMacro" runat="server" Language="cshtml" linkID="[#membershipRenewalPage]" linkText="Renew now"
                Class="btn btn-yellow pull-left">@RenderPage("~/macroscripts/PageLink.cshtml")
            </umbraco:Macro>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-6 control-label"><b>Membership expires:</b></label>
        <div class="col-sm-6 member-date">
            <p>
                <asp:Literal ID="membershipExpiry" runat="server"></asp:Literal>
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-6 control-label"><b>Membership Type:</b></label>
        <div class="col-sm-6 member-date">
            <p>
                <asp:Literal ID="membershipType" runat="server"></asp:Literal>
            </p>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-6 control-label"><b>Optional extras:</b></label>
        <div class="col-sm-6 member-date">
            <p>
                <asp:Literal ID="membershipOptionalExtras" runat="server"></asp:Literal>
            </p>
        </div>
    </div>
    <div class="form-group <%=ShowMemberAdminLink ? "" : "hide"%>">
        <label class="col-sm-6 control-label"><b>Super secret admin page:</b></label>
        <div class="col-sm-6 member-date">
            <p>
                <a href="/members-area/members-admin-details.aspx">Members Admin Details</a>
            </p>
        </div>
    </div>
</div>

<div id="open-water-section" class="<%=EnableOpenWater ? "" : "hide"%>">
    <h2>Open Water Swim</h2>
    <div class="contact-form-wrapper">
        <div class="form-group">
            <label class="col-sm-6 control-label"><b>O/W swim auth number:</b></label>
            <div class="col-sm-6 member-date">
                <p>
                    <asp:HyperLink ID="openWaterAuthNumber" runat="server" data-toggle="tooltip" data-placement="bottom"
                        title="Take this number with you to open water swim sessions. You can't get in the water unless you have your number!"></asp:HyperLink>
                </p>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-6 control-label"><b>O/W Swim credits:</b></label>
            <div class="col-sm-6 member-date">
                <p>
                    <asp:Literal ID="litSwimCredits" runat="server"></asp:Literal>
                    <asp:HiddenField ID="hiddenEmail" runat="server" />
                </p>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btn_5SwimCredits" runat="server" Text="Buy 5 credits" CssClass="btn btn-yellow pull-left" OnClick="btn_5SwimCreditsClick" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btn_10SwimCredits" runat="server" Text="Buy 10 credits" CssClass="btn btn-yellow pull-left" OnClick="btn_10SwimCreditsClick" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-12">
                <asp:Button ID="btn_15SwimCredits" runat="server" Text="Buy 15 credits" CssClass="btn btn-yellow pull-left" OnClick="btn_15SwimCreditsClick" />
            </div>
        </div>
        <div class="form-group <%=ShowSwimAdminLink ? "" : "hide"%>">
            <label class="col-sm-6 control-label"><b>Swim admin page:</b></label>
            <div class="col-sm-6 member-date">
                <p>
                    <a href="/members-area/swim-admin.aspx">Swim Admin</a>
                </p>
            </div>
        </div>
    </div>
</div>

