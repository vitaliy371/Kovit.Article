<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleEdit"
    CodeFile="kovitArticleEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<div class="kovitEditContainer">
 <asp:Panel ID="pnlEditLink" runat="server" Visible="false">
     
    <asp:HyperLink ID="lnkEditCategory" runat="server">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editcategory" /><asp:Label ID="lblEditCategory" runat="server" resourcekey="lblEditCategory"></asp:Label></asp:HyperLink>
    <asp:HyperLink ID="lnkEditFiles" runat="server">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editfiles" /><asp:Label ID="lblEditFiles" runat="server" resourcekey="lblEditFiles"></asp:Label></asp:HyperLink>
    <asp:HyperLink ID="lnkEditEvents" runat="server">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editevents" /><asp:Label ID="lblEditEvents" runat="server" resourcekey="lblEditEvents"></asp:Label></asp:HyperLink>
            <h1>EDIT</h1>
</asp:Panel>
    <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<table cellspacing="0" cellpadding="10" border="0" summary="Edit Table">
    <tr valign="top">
        <td class="SubHead">
            <asp:Label ID="lblLanguage" runat="server" resourcekey="lblLanguage"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddLanguage" runat="server" AutoPostBack="true">
            </asp:DropDownList>
        </td>
        <td class="SubHead">
            <asp:Label ID="lblPublicationDate" runat="server" resourcekey="lblPublicationDate"></asp:Label>
        </td>
        <td valign="top">
            <asp:TextBox ID="tbPublicationDate" runat="server" CssClass="NormalTextBox" CausesValidation="True"></asp:TextBox>
            <asp:HyperLink ID="cmdCalendar" resourcekey="Calendar" CssClass="CommandButton" runat="server">Calendar</asp:HyperLink>&nbsp;
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle"></asp:Label>
        </td>
        <td colspan="3">
            <asp:TextBox ID="tbTitle" runat="server" MaxLength="128" Columns="90"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbDescription" runat="server" MaxLength="160" Columns="25" Rows="5"
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="SubHead">
            <asp:Label ID="lblKeyWord" runat="server" resourcekey="lblKeyWord"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbKeyWord" runat="server" MaxLength="160" Columns="25" Rows="5"
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblFeatured" runat="server" resourcekey="lblFeatured"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkIsFeatured" Checked="false" runat="server" /></td>
        <td class="SubHead">
            <asp:Label ID="lblHidden" runat="server" resourcekey="lblHidden"></asp:Label>
        </td>
        <td>
            <asp:CheckBox ID="chkisHidden" Checked="false" runat="server" /></td>
    </tr>
    <tr valign="top">
        <td class="SubHead">
            <asp:Label ID="lblArticleURL" runat="server" resourcekey="lblArticleURL"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbArticleURL" runat="server" MaxLength="128"></asp:TextBox>
        </td>
        <td class="SubHead">
            <asp:Label ID="lblSortOrder" runat="server" resourcekey="lblSortOrder"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbSortOrder" runat="server" MaxLength="6"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <dnn:Label ID="lblContent" runat="server" ControlName="lblContent" Suffix=":"></dnn:Label>
        </td>
        <td colspan="3" class="txtEditorCell" valign="top">
            <dnn:TextEditor ID="txtContent" runat="server"  Width="100%"  Height="300" />
            <asp:RequiredFieldValidator ID="valContent" resourcekey="valContent.ErrorMessage"
                ControlToValidate="txtContent" CssClass="NormalRed" Display="Dynamic" ErrorMessage="<br>Content is required"
                runat="server" />
        </td>
    </tr>
    
</table>
<p>
    <asp:LinkButton CssClass="CommandButton" ID="cmdUpdate" resourcekey="cmdUpdate" runat="server"
        BorderStyle="none" Text="Update"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdCancel" resourcekey="cmdCancel" runat="server"
        BorderStyle="none" Text="Cancel" CausesValidation="False"></asp:LinkButton>&nbsp;
    <asp:LinkButton CssClass="CommandButton" ID="cmdDelete" resourcekey="cmdDelete" runat="server"
        BorderStyle="none" Text="Delete" CausesValidation="False"></asp:LinkButton>&nbsp;
</p>
<dnn:Audit ID="ctlAudit" runat="server" />
</div>
