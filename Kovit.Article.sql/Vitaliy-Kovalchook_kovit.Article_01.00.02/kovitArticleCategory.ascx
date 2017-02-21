<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleCategory"
    CodeFile="kovitArticleCategory.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
<asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<asp:Literal ID="litCategoryList" runat="server"></asp:Literal>
