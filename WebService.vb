Imports System.Web
Imports System.Text.RegularExpressions
Imports System.Xml
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Globalization
Imports DotNetNuke.Security.Roles
Imports DotNetNuke.Services.Localization
Imports DotNetNuke.Entities.Users
Imports Kovit.Article.Data
Imports Kovit.Article
Imports Kovit.Article.Entity
Imports Kovit.Article.Email


 

    <System.Web.Services.WebService()> _
    Public Class WebService
        Inherits System.Web.Services.WebService

    Const TemplatePath As String = "~/DesktopModules/kovit/kovitArticle/App_LocalResources/kovitArticle.ascx.resx"



        <WebMethod()> _
             Public Function RateIt(ByVal ArticleID As String, ByVal rating As String) As XmlDocument
            Dim ratingInt, ArticleIDInt As Integer
            Integer.TryParse(rating, ratingInt)
            Integer.TryParse(ArticleID, ArticleIDInt)
            Dim xmlDoc As New XmlDocument()
            Dim objRatingInfo As ArticleRatingInfo = New ArticleRatingInfo(ArticleIDInt, ratingInt, HttpContext.Current.Request.UserHostAddress, 1, Today())
            objRatingInfo.AddThis()
            xmlDoc.InnerXml = "<root>ok</root>"
            Return xmlDoc
        End Function

        <WebMethod()> _
          Public Function AddReview(ByVal ArticleID As String, ByVal text As String, ByVal email As String, ByVal name As String) As XmlDocument
            Dim xmlDoc As New XmlDocument()

            Dim ArticleIDInt As Integer
            Integer.TryParse(ArticleID, ArticleIDInt)

            Dim objArticleComment As ArticleCommentInfo = New ArticleCommentInfo(ArticleIDInt, HTML2Text(text), HTML2Text(email), HTML2Text(name), False, HttpContext.Current.Request.UserHostAddress, 1, Today())
            objArticleComment.AddThis()
            Dim errMessage As String = String.Empty
            Dim Article As ArticleInfo = ArticleInfo.GetThis(ArticleID)
            Dim objLocale As Locale = Localization.GetLocaleByID(Article.LanguageID)
            Dim ModeratorNotificationSubjectTemplate As String = _
            Localization.GetString("ModeratorNotificationSubjectTemplate", TemplatePath, DotNetNuke.Common.Globals.GetPortalSettings, objLocale.Code, False)
            '"category {0} update notification {1}"
            Dim ModeratorNotificationBodyTemplate As String = _
            Localization.GetString("ModeratorNotificationBodyTemplate", TemplatePath, DotNetNuke.Common.Globals.GetPortalSettings, objLocale.Code, False)
            '"category {0} update notification {1}"
            Dim acl As ArrayList = ArticleCategoryInfo.GetArticleCategoryAssignedList(errMessage, ArticleIDInt)
            If Not acl Is Nothing Then
                For Each cat As ArticleCategoryInfo In acl
                    Dim role As RoleInfo = RoleProvider.Instance.GetRole(cat.PortalID, cat.RoleID)
                    Dim userlist As ArrayList = RoleProvider.Instance.GetUsersByRoleName(cat.PortalID, role.RoleName)
                    If Not userlist Is Nothing Then
                        For Each user As UserInfo In userlist
                            xmlDoc.InnerXml = "<root>" & ModeratorNotificationSubjectTemplate & "-" & Article.Title & "</root>"
                            Dim Subj As String = String.Format(ModeratorNotificationSubjectTemplate, Article.Title)
                        Dim targethost As String = String.Format("{0}{1}", Me.Context.Request.Url.Authority, Me.Context.Request.ApplicationPath.TrimEnd("/"))

                        Dim BodyText As String = String.Format(ModeratorNotificationBodyTemplate, _
                        name, HTML2Text(text), URLManager.ArticleLink(targethost, cat.TabID, Article.ArticleID, Article.LanguageID, 1))

                            EmailProvider.Instance().AddToQuery(cat.PortalID, Subj, BodyText, user.Username, user.Email)
                        Next
                    End If
                Next
                EmailProvider.Instance().Start()
            End If
            xmlDoc.InnerXml = "<root>ok</root>"
            'Catch ex As Exception
            '    xmlDoc.InnerXml = "<root>" & ex.Message & ex.InnerException.ToString() & "</root>"
            'End Try
            Return xmlDoc
        End Function


  

        Public Const regexpWhitespace As String = "\s{2,}" 'Whitespace 
        Public Const regexpRemoveTag As String = "<[^>]*>|&#160;" 'X/HTML Tags
        Public Shared Function HTML2Text(ByRef HTML As String) As String
            Dim result As String
            ' Removes tags from passed HTML
            result = Regex.Replace(System.Web.HttpUtility.HtmlDecode(HTML), regexpRemoveTag, "")
            result = Regex.Replace(result, regexpWhitespace, " ")
            Return result
        End Function
    End Class
