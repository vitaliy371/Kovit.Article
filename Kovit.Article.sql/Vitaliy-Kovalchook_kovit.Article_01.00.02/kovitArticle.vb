Imports System.Web
Imports System.Xml
Imports System.Web.Script.Services
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports Kovit.kovitArticle.Data

Namespace Kovit.kovitArticle
    <WebService([Namespace]:="http://tempuri.org/")> _
     <WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
     <System.Web.Script.Services.ScriptService()> _
     Public Class WebService
        Inherits System.Web.Services.WebService

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
            Dim ratingInt, ArticleIDInt As Integer
            Integer.TryParse(ArticleID, ArticleIDInt)
            Dim xmlDoc As New XmlDocument()
            Dim objArticleComment As ArticleCommentInfo = New ArticleCommentInfo(ArticleIDInt, HTML2Text(text), HTML2Text(email), HTML2Text(name), False, HttpContext.Current.Request.UserHostAddress, 1, Today())
            objArticleComment.AddThis()
            xmlDoc.InnerXml = "<root>ok</root>"
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
End Namespace