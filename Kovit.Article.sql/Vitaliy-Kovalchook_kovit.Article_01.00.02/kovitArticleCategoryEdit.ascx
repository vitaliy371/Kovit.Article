<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticleCategory.kovitArticleCategoryEdit"
    CodeFile="kovitArticleCategoryEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<h1>
    EDIT CATEGORIES</h1>
<asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<table style="width: 100%;" cellspacing="0" cellpadding="10" border="0" summary="Edit Table">
    <tr>        <td class="SubHead">
            <asp:Label ID="lblParentCategory" runat="server" resourcekey="lblParentCategory"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddParentCategory" runat="server" DataTextField="Title" DataValueField="ArticleCategoryID" AutoPostBack="true">
            </asp:DropDownList>
        </td>
        
        <td class="SubHead">
            <asp:Label ID="lblTargetTab" runat="server" resourcekey="lblTargetTab"></asp:Label>
        </td>
        <td valign="bottom">
            <asp:DropDownList ID="ddTargetTab" runat="server" DataTextField="TabName" DataValueField="TabID">
            </asp:DropDownList>
        </td>
    </tr>
    <tr valign="top">
<td class="SubHead">
            <asp:Label ID="lblLanguage" runat="server" resourcekey="lblLanguage"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="ddLanguage" runat="server">
            </asp:DropDownList>
        </td>
        <td class="SubHead">
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbTitle" runat="server" MaxLength="255"></asp:TextBox>
        </td>
    </tr>
    <tr valign="top">
            <td class="SubHead">
            <asp:Label ID="lblArticleCategoryURL" runat="server" resourcekey="lblArticleCategoryURL"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbArticleCategoryURL" runat="server" MaxLength="2048"></asp:TextBox>
        </td>
        

        <td class="SubHead">
            <asp:Label ID="lblSortOrder" runat="server" resourcekey="lblSortOrder"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbSortOrder" runat="server" MaxLength="2048"></asp:TextBox></td>
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
