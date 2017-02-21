<%@ Control Language="vb" Inherits="Kovit.Modules.kovitArticle.kovitArticle" CodeFile="kovitArticle.ascx.vb"
    AutoEventWireup="false" Explicit="True" %>
<%@ Register TagPrefix="dnn" TagName="Audit" Src="~/controls/ModuleAuditControl.ascx" %>
   <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="red" Font-Size="XX-Large"></asp:Label>
<asp:Repeater ID="rptPagerTop" runat="server" EnableViewState="false">
    <HeaderTemplate>
        <div class="Pages">
            <a>
                <asp:Label ID="lblPages" runat="server" resourcekey="lblPages"></asp:Label>
            </a>
    </HeaderTemplate>
    <ItemTemplate>
        <a href="<%#DataBinder.Eval(Container.DataItem, "value") %>"><span style="<%# CurrentPageStyle(DataBinder.Eval(Container.DataItem,"key")) %>">
            <%#DataBinder.Eval(Container.DataItem, "key")%>
        </span></a>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
<asp:Repeater ID="rptArticleList" runat="server">
    <HeaderTemplate>
        <table cellpadding="0" cellspacing="5" class="kovitArticleList">
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td>
                <h2>
                    <small>
                        <%#FormatArticleDate(DataBinder.Eval(Container.DataItem, "PublicationDate"))%>
                    </small>
                    <%#DataBinder.Eval(Container.DataItem, "Title")%>
                </h2>
                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# EditURL("ArticleID",DataBinder.Eval(Container.DataItem,"ArticleID")) %>'
                    Visible="<%# IsEditable %>" runat="server">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                        Visible="<%#IsEditable%>" resourcekey="Edit" /><asp:Label ID="lblEdit" runat="server"
                            resourcekey="lblEdit"></asp:Label></asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" NavigateUrl='<%# EditURL("ArticleID",DataBinder.Eval(Container.DataItem,"ArticleID"),"editcategory") %>'
                    Visible="<%# IsEditable %>" runat="server">
                    <asp:Image ID="Image2" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                        Visible="<%#IsEditable%>" resourcekey="editcategory" /><asp:Label ID="lblEditCategory"
                            runat="server" resourcekey="lblEditCategory"></asp:Label></asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" NavigateUrl='<%# EditURL("ArticleID",DataBinder.Eval(Container.DataItem,"ArticleID"),"editfiles") %>'
                    Visible="<%# IsEditable %>" runat="server">
                    <asp:Image ID="Image3" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                        Visible="<%#IsEditable%>" resourcekey="editfiles" /><asp:Label ID="lblEditFiles"
                            runat="server" resourcekey="lblEditFiles"></asp:Label></asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" NavigateUrl='<%# EditURL("ArticleID",DataBinder.Eval(Container.DataItem,"ArticleID"),"editevents") %>'
                    Visible="<%# IsEditable %>" runat="server">
                    <asp:Image ID="Image4" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
                        Visible="<%#IsEditable%>" resourcekey="editevents" /><asp:Label ID="lblEditEvents"
                            runat="server" resourcekey="lblEditEvents"></asp:Label></asp:HyperLink>
                <p>
                    <%#FormatText(DataBinder.Eval(Container.DataItem, "ArticleHTML"))%>
                    <a href="<%#ArticleLink(DataBinder.Eval(Container.DataItem, "ArticleID"), DataBinder.Eval(Container.DataItem, "LanguageID"), DataBinder.Eval(Container.DataItem, "ArticleURL"),1)%>">
                        <asp:Label ID="lblReadMore" runat="server" resourcekey="lblReadMore" />
                    </a>
                </p>
            </td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<asp:Repeater ID="rptPagerBottom" runat="server" EnableViewState="false">
    <HeaderTemplate>
        <div class="Pages">
            <a>
                <asp:Label ID="lblPages" runat="server" resourcekey="lblPages"></asp:Label>
            </a>
    </HeaderTemplate>
    <ItemTemplate>
        <a href="<%#DataBinder.Eval(Container.DataItem, "value") %>"><span style="<%# CurrentPageStyle(DataBinder.Eval(Container.DataItem,"key")) %>">
            <%#DataBinder.Eval(Container.DataItem, "key")%>
        </span></a>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
<asp:Panel ID="pnlArticleItem" runat="server" Visible="false" CssClass="kovitArticleItem">
    <h2>
        <small>
            <asp:Label ID="lblPublicationDate" runat="server" Text=""></asp:Label>
        </small>
        <asp:Literal ID="litTitle" runat="server"></asp:Literal>
    </h2>
    <asp:HyperLink ID="lnkEdit" Visible="<%# IsEditable %>" runat="server">
        <asp:Image ID="Image21" runat="server" ImageUrl="~/images/edit.gif" AlternateText="Edit"
            resourcekey="Edit" /><asp:Label ID="Label2" runat="server" resourcekey="lblEdit"></asp:Label>
    </asp:HyperLink>
    <asp:Literal ID="litArticleHTML" runat="server"></asp:Literal>
    <asp:Repeater ID="rptGallery" runat="server" EnableViewState="false">
        <HeaderTemplate>
            <div id="gallery">
                <h2>
                    Фотогалерея</h2>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li><a title="" class="jquerylightbox" rel="grp1" href="Portals/<%=PortalID%>/KovitArticle/800x500-<%#DataBinder.Eval(Container.DataItem, "FileName") %>">
                <img alt="" src="Portals/<%=PortalID%>/KovitArticle/100x100-<%#DataBinder.Eval(Container.DataItem, "FileName") %>" /></a>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Repeater ID="rptDownload" runat="server" EnableViewState="false">
        <HeaderTemplate>
            <div>
                <h2>
                    Файлы для скачивания</h2>
                <ul>
        </HeaderTemplate>
        <ItemTemplate>
            <li><a title="" class="download" rel="grp1" href="Portals/<%=PortalID%>/KovitArticle/<%#DataBinder.Eval(Container.DataItem, "FileName") %>">
                <span>
                    <%#DataBinder.Eval(Container.DataItem, "FileName") %>
                </span></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul> </div>
        </FooterTemplate>
    </asp:Repeater>
    <table cellpadding="0" cellspacing="5" width="100%">
        <tr>
            <td>
                <a class="button" href="javascript:history.back();"><span>Назад</span></a></td>
            <td>
                <a class="button" onclick="if(navigator.appName=='Microsoft Internet Explorer'){window.external.AddFavorite(this.href,document.title);return false}else if(navigator.appName=='Netscape'||navigator.appName=='Opera'){this.title = document.title;return true;}else return false;"
                    rel="sidebar" href="<%=ReWritedURL()%>">
                    <asp:Label ID="lblBoomarks" runat="server" resourcekey="lblBoomarks" /></a></td>
            <td>
                <a class="button" target="_blank" rel="nofollow" href="http://www.google.com/bookmarks/mark?op=add&amp;bkmk=<%=ReWritedURL()%>&amp;title=<%=Page.Title%>">
                    <asp:Label ID="lblGoogleBookmarks" runat="server" resourcekey="lblGoogleBookmarks" /></a></td>
            <td>
                <a class="button" target="_blank" rel="nofollow" href="http://del.icio.us/post?url=<%=ReWritedURL()%>&amp;title=<%=Page.Title%>">
                    <asp:Label ID="lblDeliciousBookmarks" runat="server" resourcekey="lblDeliciousBookmarks" /></a>
            </td>
        </tr>
    </table>
    <div style="text-align: left; display: block;">
        <asp:LinkButton ID="btnResetRating" runat="server">RESET RATING</asp:LinkButton>
        <div class="RatingText">
            <asp:Label ID="lblAverageRating" runat="server" resourcekey="lblAverageRating" /><span
                id="AverageRating"><%=AvarageRating%></span> (<span id="TotalVotes"><%=TotalVotes%></span>
            <asp:Label ID="lblVotes" runat="server" resourcekey="lblVotes" />)
        </div>
        <div class="StarRating">
            <a class="CurrentRating" style="width: <%=RatingWidth() %>px;"><span class="HoverRating"
                style="width: 28px;"></span></a>
        </div>
        <div id="RatingText" class="RatingText">
            <asp:Label ID="lblClickToRate" runat="server" resourcekey="lblClickToRate" />
            <span id="RatingValue">1</span>
        </div>
        <p>
            <asp:Label ID="lblNoReview" runat="server" resourcekey="lblNoReview" />
        </p>
        <div id="CommentForm" style="padding-top: 10px;">
            <textarea id="txtReview" rows="5" name="txtReview"></textarea>
            <table cellpadding="0" cellspacing="0" style="padding-bottom: 20px;">
                <tbody>
                    <tr>
                        <td>
                            <asp:Label ID="lblName" runat="server" resourcekey="lblName" />&nbsp;<asp:Label CssClass="lblValName"
                                ID="lblValName" runat="server" resourcekey="lblValName" />
                        </td>
                        <td colspan="2">
                            E-mail:&nbsp;<asp:Label CssClass="lblValEmail" ID="lblValEmail" runat="server" resourcekey="lblValEmail" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="reviewInput" id="reviewName" type="text" />
                        </td>
                        <td>
                            <input class="reviewInput" id="reviewEmail" type="text" />
                        </td>
                        <td>
                            <a id="AddReview" class="button">
                                <asp:Label ID="lblAddReview" runat="server" resourcekey="lblAddReview"></asp:Label>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="reviewDivMain">
            <h2>
                <asp:Label ID="lblComment" runat="server" resourcekey="lblComment" /></h2>
            <asp:Repeater ID="rptArticleComment" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <p class="kovitAticleComment">
                        <b>
                            <%#DataBinder.Eval(Container.DataItem, "Name")%>
                            (<i><%#FormatArticleDate(DataBinder.Eval(Container.DataItem, "CreatedOnDate"))%></i>):</b>
                        <%#DataBinder.Eval(Container.DataItem, "ArticleCommentText")%>
                        <asp:HyperLink ID="lnkMail" Visible="<%# IsEditable %>" runat="server" NavigateUrl='<%#"mailto:" +DataBinder.Eval(Container.DataItem, "Email")+ "?Subject=" + Page.Request.Url.Authority  %>'><%#DataBinder.Eval(Container.DataItem, "Email")%></asp:HyperLink>
                        <asp:Label ID="lblIPadress" Visible="<%# IsEditable %>" runat="server"><%#DataBinder.Eval(Container.DataItem, "IpAddress")%></asp:Label>
                        <asp:LinkButton ID="btnDelete" Visible="<%# IsEditable %>" CommandName="Delete" runat="server"
                            Text="Delete" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ArticleCommentID")%>' />
                    </p>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
            <a name="lastComment"></a>
        </div>
    </div>
</asp:Panel>


<script type="text/javascript">
//<![CDATA[
   var RatingAdded = false;
 
   
// wait while browser load DOM 
jQuery(document).ready(function() {

   jQuery('.jquerylightbox').lightBox();
    initMenus();
 
    $(".StarRating").mousemove(function(e) 
        { 
       // hide validation boxes       
       if (RatingAdded==false)       
       {       
 
            var  offset = $(this).offset();
            var rating = ((e.pageX - offset.left) - (e.pageX - offset.left) % 28)/28 + 1
            $(".HoverRating").css( { "width": 28 * rating + "px"});    
            $("#RatingValue").html ('<span>'+ rating  +'</span>');
            
            }
    }); 
    
      $(".StarRating").click(function(e) 
        { 
           if (RatingAdded==false)       
       {       
            var  offset = $(this).offset();
            var rating = ((e.pageX - offset.left) - (e.pageX - offset.left) % 28)/28 + 1;
            $.ajax({type: "POST",            
            url: "<%=WebservicePath()%>/RateIt",                       
            data: {'ArticleID': <%=ArticleID%> , 'rating': rating },            
            //beforeSend: function(xhr){xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");},
            dataType: "xml",
            complete: function(xhtmlReq){            
                if (xhtmlReq.status == 200)
                {   
                    var result  = $("root", xhtmlReq.responseXML).text();   
  
                    switch (result)
                    {            
                    case "ok": 
                        $("#RatingText").html('<%=GetLocale("ThankYouForVote")%>');
                        var ar = parseFloat($("#AverageRating").html());
                        var tv = Number($("#TotalVotes").html());                                                
                        var newar = Math.round(10*((tv*ar + rating)/(tv+1)))/10
                        $("#TotalVotes").html(tv + 1);
                        $("#AverageRating").html(newar);
                        $(".CurrentRating").css("width",(newar * 28) +  "px");
                        RatingAdded=true;
                    break;   
                    case "NotLoged":                 
                         //window.location = $("base")[0].href + "Login.aspx?returnURL=" + window.location;	
                    break;                 
                    default:                 
                        //CreatePopUp('popup','Close Error Viewer','<b style="color:red;">error-status:'+xhtmlReq.status + "</b>");
                    break;               
                    }
                    }
                    }
            }); 
                  }     
    });   
    // Add reviews
      $("#AddReview").click(function() 
      { 
          
          var ReviewText = $("#txtReview").val();
          var ReviewEmail = $("#reviewEmail").val();
          var ReviewName =  $("#reviewName").val();
          
           if (ReviewName.length<1)
            {
                $(".lblValName").css("display","inline");
                return false;
            }     
           var re = new RegExp("[0-9a-z._]+@[0-9a-z_^.]+.[a-z]{2,3}");
           if (re.test(ReviewEmail)==false)
            {
                $(".lblValEmail").css("display","inline");
                return false;
            }     
          
          
          
          
          $.ajax({type: "POST",            
            url: "<%=WebservicePath()%>/AddReview",                       
            data: {'ArticleID': <%=ArticleID%> , 'text': ReviewText, 'email': ReviewEmail , 'name': ReviewName  },            
            //beforeSend: function(xhr){xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded; charset=utf-8");},
            dataType: "xml",
            complete: function(xhtmlReq){            
                if (xhtmlReq.status == 200)
                {   
                    var result  = $("root", xhtmlReq.responseXML).text();   
  
                    switch (result)
                    {            
                    case "ok": 
                        window.location = "<%=ReWritedURL()%>#lastComment";	
                        location.reload(true);
                        $("#CommentForm").hide();                       
 
                    break;   
                    case "NotLoged":                 
                         //window.location = $("base")[0].href + "Login.aspx?returnURL=" + window.location;	
                    break;                 
                    default:                 
                        //CreatePopUp('popup','Close Error Viewer','<b style="color:red;">error-status:'+xhtmlReq.status + "</b>");
                    break;               
                    }
                    }}
            });     
             
             
             
      }); 
    
});


     //]]>
</script>

