Imports System
Imports DotNetNuke.Services.Localization
Imports DotNetNuke.Entities.Portals
Imports System.Xml
Imports System.Math
Imports System.Web
Imports System.Drawing
Imports System.Drawing.Imaging
Imports System.Text
Imports System.Collections.Generic
Imports Kovit.Article.Entity
 
    Public Class RSS
        Implements IHttpHandler
        Private PortalId As Integer
        Private LanguageID As Integer
        Private CategoryID As Integer
        Private SortMode As Integer = 0 '0 -pub date , 1- sortorder, 2-title
        Private ErrorMessage As String = String.Empty
        Const RssTemplate As String = "<?xml version=""1.0"" encoding=""utf-8""?><rss version=""2.0""  xmlns:dc=""http://purl.org/dc/elements/1.1/""><channel><title>{1}</title><link>{2}</link><description>{3}</description><language>{4}</language><copyright>{5}</copyright><managingEditor>{6}</managingEditor><webMaster>{7}</webMaster><category>{8}</category><generator>{9}</generator><lastBuildDate>{10}</lastBuildDate><ttl>30</ttl><image><url>{11}</url><title>{12}</title><link>{13}</link></image>{0}</channel></rss>"
        Const ItemTemplate As String = "<item><title>{0}</title><link>{1}</link><comments>{2}</comments><author>{3}</author><category domain=""{4}"">{5}</category><description><![CDATA[{6}]]></description><source url=""{7}"">{8}</source><pubDate>{9}</pubDate></item>" '<guid isPermaLink=""false"">{10}</guid>
        Const FeedGenerator As String = "RSS for Kovit.Article v.01.00.03"
        Public Sub ProcessRequest(ByVal context As HttpContext) Implements IHttpHandler.ProcessRequest
            ' Extract input parameters from the query string
            Integer.TryParse(context.Request.QueryString("p"), PortalId)
            Integer.TryParse(context.Request.QueryString("l"), LanguageID)
            Integer.TryParse(context.Request.QueryString("c"), CategoryID)
            Dim rssFeed As New StringBuilder
            Try
                'FORMING TITLE AND CATEGORY LIST
                Dim NumberOfItems As Integer = 10
                Dim FeedTitle As String
                Dim FeedLink As String
                Dim FeedDescription As String
                Dim FeedLanguage As String
                Dim FeedCopyright As String
                Dim FeedManagingEditor As String
                Dim FeedWebMaster As String
                Dim FeedCategory As String
                Dim FeedLastBuildDate As String

                Dim FeedImageUrl As String
                Dim FeedImageTitle As String
                Dim FeedImageLink As String

                Dim UpdatedCategories As New ArrayList
                Dim locale As Locale = Localization.GetLocaleByID(LanguageID)
                Dim pc As PortalController = New PortalController()
                Dim pi As PortalInfo = pc.GetPortal(PortalId)
            'Dim pac As New PortalAliasController
            
            Dim baseUrl = String.Format("{0}://{1}{2}", HttpContext.Current.Request.Url.Scheme, HttpContext.Current.Request.Url.Authority, HttpContext.Current.Request.ApplicationPath.TrimEnd("/") + "/")

            FeedLastBuildDate = GetRFC822Date(Date.Now)
            FeedLanguage = locale.Code
            FeedTitle = pi.PortalName
            FeedDescription = pi.Description
            FeedWebMaster = pi.Email & " (Real Name)"
            FeedManagingEditor = pi.Email & " (Real Name)"
            FeedCategory = pi.KeyWords
            FeedLink = HttpContext.Current.Request.Url().ToString().Replace("&", "&amp;")
            FeedCopyright = "Copyright by " & pi.FooterText & " http://" & ContextAlias & "/"
            FeedImageUrl = String.Format("{0}Portals/{1}/{2}", baseUrl, pi.PortalID, pi.LogoFile)
            FeedImageTitle = pi.PortalName
            FeedImageLink = FeedLink
            If CategoryID > 0 Then
                'Single category
                Dim objCategory As ArticleCategoryInfo = ArticleCategoryInfo.GetThis(CategoryID)
                If Not objCategory Is Nothing Then
                    FeedTitle = objCategory.Title & " RSS"
                    FeedDescription = objCategory.Description & " RSS"
                    UpdatedCategories.Add(objCategory)
                Else
                    FeedTitle = "INVALID CATEGORY ID"
                    FeedDescription = "INVALID CATEGORY ID"
                End If
            Else
                FeedTitle = String.Format("http://{0}/ RSS", ContextAlias)
                FeedDescription = pi.Description
                UpdatedCategories = ArticleCategoryInfo.GetArticleCategoryList("", PortalId, LanguageID)
                NumberOfItems = 30
            End If
            'List of Updated Items
            Dim Items As String = String.Empty
            If Not UpdatedCategories Is Nothing Then


                For Each objCategory As ArticleCategoryInfo In UpdatedCategories
                    If Not objCategory Is Nothing Then
                        Dim params As Object() = {PortalId, LanguageID, objCategory.ArticleCategoryID, 1, NumberOfItems, SortMode, False, -1, -1, "", 0}
                        Dim Articles As New ArrayList
                        ArticleInfo.SearchArticles(Articles, ErrorMessage, params)
                        'Dim ItemsTotal As Integer
                        'Integer.TryParse(params(7), ItemsTotal)             
                        If Articles.Count > 0 Then
                            FeedCategory = ""
                        End If
                        For Each objArticle As ArticleInfo In Articles
                            '0 - title, 1 - link, 2 - comments,
                            '3 - author, 4- category domain, 5 - category
                            '6 - description, 7 - source url, 8- source
                            '9 - pubDate, 10 - guid

                            Dim Link As String = ArticleLink(objCategory.TabID, objArticle.ArticleID, objArticle.LanguageID, objArticle.ArticleURL, 1)
                            Items += String.Format(ItemTemplate, objCategory.Title.Replace("&", "&amp;") & " -&gt; " & objArticle.Title.Replace("&", "&amp;"), Link, _
                            Link & "#lastComment", FeedManagingEditor, ContextAlias, objCategory.Title, objArticle.Description, _
                            Link, objCategory.Title, GetRFC822Date(objArticle.PublicationDate)) ', Link
                            FeedCategory += objArticle.Description & ", "
                        Next
                    End If
                Next

               
            Else
                'No updates

            End If
            '0 - items, 1 - title, 2 - link
            '3 - description, 4 - language, 5 - copyright
            '6- managingEditor, 7 - webMaster, 8 - category
            '9 - generator,  10 - lastBuildDate
            '11 - imageurl, 12 - imagetitle, 13 - imagelink
            rssFeed.Append(String.Format(RssTemplate, Items, FeedTitle, FeedLink, FeedDescription _
            , FeedLanguage, FeedCopyright, FeedManagingEditor, FeedWebMaster, FeedCategory _
            , FeedGenerator, FeedLastBuildDate, FeedImageUrl, FeedImageTitle, FeedImageLink))

        Catch exc As Exception        'Module failed to load                                
            DotNetNuke.Services.Exceptions.Exceptions.ProcessPageLoadException(exc)
            rssFeed.Append(exc.Message)
        End Try

            context.Response.ClearHeaders()
            context.Response.ClearContent()
            context.Response.ContentType = "text/xml"

            context.Response.ContentEncoding = Encoding.GetEncoding("UTF-8")
            context.Response.Charset = "UTF-8"
            context.Response.Write(rssFeed.ToString())
        End Sub
    Public ReadOnly Property ContextAlias()
        Get
            Return HttpContext.Current.Request.Url.Authority & HttpContext.Current.Request.ApplicationPath.TrimEnd("/")
        End Get
    End Property
        Public ReadOnly Property IsReusable() As Boolean Implements IHttpHandler.IsReusable
            Get
                Return True
            End Get
        End Property

        Public Function ArticleLink(ByVal TabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal PageNo As Integer) As String
        Return URLManager.ArticleLink(HttpContext.Current.Request.Url.Authority & HttpContext.Current.Request.ApplicationPath.TrimEnd("/"), TabID, ArticleID, LangaugeID, 1)
        End Function

        Public Function GetRFC822Date(ByVal pDateTime As DateTime) As String

            ' Date format should be as such
            ' Wed, 21 Sep 2005 09:40:02 GMT

            Dim sb As New StringBuilder

            pDateTime = pDateTime.AddHours(+5) ' Change depending on where your time zone is
            sb.Append(GetShortDayName(pDateTime.DayOfWeek.ToString))
            sb.Append(", ")
            sb.Append(pDateTime.Day)
            sb.Append(" ")
            sb.Append(GetShortMonth(pDateTime.Month))
            sb.Append(" ")
            sb.Append(pDateTime.Year)
            sb.Append(" ")
            sb.Append(PadTime(pDateTime.Hour))
            sb.Append(":")
            sb.Append(PadTime(pDateTime.Minute))
            sb.Append(":")
            sb.Append(PadTime(pDateTime.Second))
            sb.Append(" GMT")
            Return sb.ToString
        End Function

        Private Function PadTime(ByVal pTime As Integer) As String
            If pTime < 10 Then
                Return "0" & pTime
            Else
                Return pTime
            End If

        End Function

        Private Function GetShortDayName(ByVal pLongDay As String) As String
            Select Case pLongDay
                Case "Monday"
                    Return "Mon"
                Case "Tuesday"
                    Return "Tue"
                Case "Wednesday"
                    Return "Wed"
                Case "Thursday"
                    Return "Thu"
                Case "Friday"
                    Return "Fri"
                Case "Saturday"
                    Return "Sat"
                Case "Sunday"
                    Return "Sun"
                Case Else
                    Return "Mon"
            End Select
        End Function


        Public Function GetShortMonth(ByVal pIntMonth As Integer) As String
            Select Case pIntMonth
                Case 1
                    Return "Jan"
                Case 2
                    Return "Feb"
                Case 3
                    Return "Mar"
                Case 4
                    Return "Apr"
                Case 5
                    Return "May"
                Case 6
                    Return "Jun"
                Case 7
                    Return "Jul"
                Case 8
                    Return "Aug"
                Case 9
                    Return "Sep"
                Case 10
                    Return "Oct"
                Case 11
                    Return "Nov"
                Case 12
                    Return "Dec"
                Case Else
                    Return "Jan"
            End Select


        End Function

    End Class
