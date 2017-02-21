<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleCategoryListEdit"
    CodeFile="kovitArticleCategoryListEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<asp:Panel ID="pnlEditLink" runat="server">
    <asp:HyperLink ID="lnkEdit" runat="server">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="Edit" /><asp:Label ID="lblEdit" runat="server" resourcekey="lblEdit"></asp:Label></asp:HyperLink>
 
    <asp:HyperLink ID="lnkEditFiles" runat="server">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editfiles" /><asp:Label ID="lblEditFiles" runat="server" resourcekey="lblEditFiles"></asp:Label></asp:HyperLink>
    <asp:HyperLink ID="lnkEditEvents" runat="server">
        <asp:Image ID="Image4" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editevents" /><asp:Label ID="lblEditEvents" runat="server" resourcekey="lblEditEvents"></asp:Label></asp:HyperLink>
</asp:Panel>
   <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<h1>CATEGOREIS</h1>
<table style="width: 100%;" cellspacing="0" cellpadding="10" border="0" summary="Edit Table">
    <tr valign="top">
        <td class="SubHead">
            <asp:Label ID="lblCategories" runat="server" resourcekey="lblCategories"></asp:Label>
        </td>
        <td colspan="3">
            <dnn:DualListBox ID="ctlCategories" runat="server" DataValueField="ArticleCategoryID"
                DataTextField="Title" AddKey="AddCategory" RemoveKey="RemoveCategory" AddAllKey="AddAllCategorys"
                RemoveAllKey="RemoveAllCategorys" AddImageURL="~/images/rt.gif" AddAllImageURL="~/images/ffwd.gif"
                RemoveImageURL="~/images/lt.gif" RemoveAllImageURL="~/images/frev.gif" ContainerStyle-HorizontalAlign="Center">
                <AvailableListBoxStyle CssClass="NormalTextBox" Height="230px" Width="275px" />
                <HeaderStyle CssClass="NormalBold" />
                <SelectedListBoxStyle CssClass="NormalTextBox" Height="230px" Width="275px" />
            </dnn:DualListBox>
        </td>
    </tr>
</table>
<dnn:Audit ID="ctlAudit" runat="server" />
