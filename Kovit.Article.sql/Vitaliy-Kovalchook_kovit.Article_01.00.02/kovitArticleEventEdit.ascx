<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleEventEdit"
    CodeFile="kovitArticleEventEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<div class="kovitEditContainer">
<asp:Panel ID="pnlEditLink" runat="server">
    <asp:HyperLink ID="lnkEdit" runat="server">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="Edit" /><asp:Label ID="lblEdit" runat="server" resourcekey="lblEdit"></asp:Label></asp:HyperLink>
    <asp:HyperLink ID="lnkEditCategory" runat="server">
        <asp:Image ID="Image2" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editcategory" /><asp:Label ID="lblEditCategory" runat="server" resourcekey="lblEditCategory"></asp:Label></asp:HyperLink>
    <asp:HyperLink ID="lnkEditFiles" runat="server">
        <asp:Image ID="Image3" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="editfiles" /><asp:Label ID="lblEditFiles" runat="server" resourcekey="lblEditFiles"></asp:Label></asp:HyperLink>
</asp:Panel>
<h1>
    EVENTS</h1>
<table style="width: 100%;" cellspacing="0" cellpadding="10" border="0" summary="Edit Table">
    <tr valign="top">
        <td class="SubHead">
            STARTDATE
        </td>
        <td valign="top">
            <asp:TextBox ID="tbStartDate" runat="server" CssClass="NormalTextBox" CausesValidation="True"></asp:TextBox>
            <asp:HyperLink ID="cmdStartCal" resourcekey="Calendar" CssClass="CommandButton" runat="server">Calendar</asp:HyperLink>&nbsp;
        </td>
        <td class="SubHead">
            ENDDATE
        </td>
        <td valign="top">
            <asp:TextBox ID="tbEndDate" runat="server" CssClass="NormalTextBox" CausesValidation="True"></asp:TextBox>
            <asp:HyperLink ID="cmdEndCal" resourcekey="Calendar" CssClass="CommandButton" runat="server">Calendar</asp:HyperLink>&nbsp;
        </td>
    </tr>
    <tr>
        <td class="SubHead">
            <asp:Label ID="lblTitle" runat="server" resourcekey="lblTitle"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbTitle" runat="server" MaxLength="128" Columns="25" Rows="3" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="SubHead">
            <asp:Label ID="lblDescription" runat="server" resourcekey="lblDescription"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="tbDescription" runat="server" MaxLength="160" Columns="25" Rows="3"
                TextMode="MultiLine"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="4">
            <asp:LinkButton CssClass="CommandButton" ID="cmdAdd" resourcekey="cmdAdd" runat="server"
                BorderStyle="none" Text="Add"></asp:LinkButton></td>
    </tr>
</table>
<asp:Repeater ID="rptEvents" runat="server" EnableViewState="false">
    <HeaderTemplate>
        <table cellspacing="0" cellpadding="10" border="1">
            <tr>
                <th>
                    Удалить</th>
                <th>
                    Начало</th>
                <th>
                    Конец</th>
                <th>
                    Титул</th>
                <th>
                    Описание</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <th>
                <a href="#"><span>Удалить</span></a></th>
            <th>
                <%#DataBinder.Eval(Container.DataItem, "StartDate")%>
            </th>
            <th>
                 <%#DataBinder.Eval(Container.DataItem, "EndDate")%></th>
            <th>
                 <%#DataBinder.Eval(Container.DataItem, "Title")%></th>
            <th>
                 <%#DataBinder.Eval(Container.DataItem, "Description")%></th>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<dnn:Audit ID="ctlAudit" runat="server" />
</div>