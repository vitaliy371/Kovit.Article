<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleFileEdit"
    CodeFile="kovitArticleFileEdit.ascx.vb" AutoEventWireup="false" Explicit="True" %>
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
        <asp:HyperLink ID="lnkEditEvents" runat="server">
            <asp:Image ID="Image4" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                resourcekey="editevents" /><asp:Label ID="lblEditEvents" runat="server" resourcekey="lblEditEvents"></asp:Label></asp:HyperLink>
    </asp:Panel>
    <h1>
        FILES</h1>
    <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
    <table>
        <tr>
            <td>
                <asp:FileUpload ID="fileUpload" runat="server" /></td>
            <td>
            </td>
            <td>
                <asp:Button ID="btnUpload" runat="server" Text="UploadFile" />
            </td>
        </tr>
    </table>
    <asp:Repeater ID="rptArticleFile" runat="server">
        <HeaderTemplate>
            <table>
                <tr>
                    <th>
                        command</th>
                    <th>
                        FileName</th>
                    <th>
                        size</th>
                </tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr>
                <td>
                    <asp:LinkButton ID="btnDelete" Visible="<%# IsEditable %>" CommandName="Delete" runat="server"
                        Text="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"FileName") & "|" & DataBinder.Eval(Container.DataItem,"FolderID")& "|" & DataBinder.Eval(Container.DataItem,"FileId")%>' /></td>
                <td>
                    <%#DataBinder.Eval(Container.DataItem, "FileName")%>
                </td>
                <td>
                    <%#DataBinder.Eval(Container.DataItem, "size")%>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <dnn:Audit ID="ctlAudit" runat="server" />
</div>
