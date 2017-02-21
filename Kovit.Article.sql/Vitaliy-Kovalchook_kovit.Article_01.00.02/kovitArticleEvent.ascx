<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticleEvent"
    CodeFile="kovitArticleEvent.ascx.vb" AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>
   <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<div class="kovitEventList">
    <h2>
        Наше расписание</h2>
    <asp:Repeater ID="rptEvents" runat="server" EnableViewState="false">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
            <h3>
                <%#FormatArticleDate(DataBinder.Eval(Container.DataItem, "StartDate"))%>
            </h3>
            <div>
                <%#DataBinder.Eval(Container.DataItem, "Title")%>
            </div>
            <p>
                <%#DataBinder.Eval(Container.DataItem, "Description")%>
                <a href="<%#ArticleLink(DataBinder.Eval(Container.DataItem, "ArticleID"), LanguageID )%>">
                    подробнее...</a>
            </p>
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
</div>
