Imports Microsoft.VisualBasic
Imports Kovit.kovitArticle.Data
Namespace Kovit.Modules.kovitArticle

    Public Class URLManager
        Public Shared Function ReWritedURL(ByVal contextPage As Page) As String
            Return String.Format("{0}://{1}{2}", contextPage.Request.Url.Scheme, contextPage.Request.Url.Authority, contextPage.Request.RawUrl)
        End Function
        Public Shared Function BaseURL(ByVal contextPage As Page) As String
            Return String.Format("{0}://{1}{2}", contextPage.Request.Url.Scheme, contextPage.Request.Url.Authority, contextPage.Request.ApplicationPath.TrimEnd("/") + "/")
        End Function
        Public Shared Function TabPathURL(ByVal contextPage As Page) As String
            Dim TabPath As String = NavigateURL()
            TabPath = TabPath.Replace(BaseURL(contextPage), "")
            TabPath = TabPath.Replace(".aspx", "")
            If TabPath.StartsWith("language/") Then
                TabPath = TabPath.Substring(15, TabPath.Length - 15)
            End If
            Return TabPath
        End Function

        Public Shared Function ArticleLink(ByVal contextPage As Page, ByVal TargetTabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
            Dim tc As TabController = New TabController()
            Dim ti As DotNetNuke.Entities.Tabs.TabInfo = tc.GetTab(TargetTabID)
            If ArticleID > 0 Then
                Dim ai As ArticleInfo = ArticleInfo.GetThis(ArticleID)
                If (Not ai Is Nothing) And Not (ti Is Nothing) Then
                    If PageNo > 1 Then
                        Return String.Format("{0}language/{1}/{2}/{3}/{4}/page/{5}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, ti.TabName, ArticleID, PageNo, ai.ArticleURL)
                    Else
                        Return String.Format("{0}language/{1}/{2}/{3}/{4}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, ti.TabName, ArticleID, ai.ArticleURL)
                    End If
                End If
                Return "INVALID-ARTICLE-ID"
            Else
                Return "INVALID-ARTICLE-ID"
            End If
        End Function
        Public Shared Function ArticleCategoryLink(ByVal contextPage As Page, ByVal TargetTabID As Integer, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal ArticleCategoryURL As String, ByVal PageNo As Integer) As String
            Dim tc As TabController = New TabController()
            Dim ti As DotNetNuke.Entities.Tabs.TabInfo = tc.GetTab(TargetTabID)
            If Not ti Is Nothing Then
                If PageNo > 1 Then
                    Return String.Format("{0}language/{1}/{2}/category/{3}/page/{4}/{5}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, ti.TabName, ArticleCategoryID, PageNo, ArticleCategoryURL)
                Else
                    Return String.Format("{0}language/{1}/{2}/category/{3}/{4}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, ti.TabName, ArticleCategoryID, ArticleCategoryURL)
                End If
            Else

            End If
        End Function
        Public Shared Function DateLink(ByVal contextPage As Page, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal ToDate As Date, ByVal PageNo As Integer) As String
            If PageNo > 1 Then
                Return String.Format("{0}language/{1}/{2}/{3}/date/{4}/page/{5}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage), ToDate.ToString("yyyy-MM", CultureInfo.InvariantCulture), PageNo)
            Else
                Return String.Format("{0}language/{1}/{2}/{3}/date/{4}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage), ToDate.ToString("yyyy-MM", CultureInfo.InvariantCulture))
            End If
        End Function
        Public Shared Function FeaturedLink(ByVal contextPage As Page, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
            Return String.Format("{0}language/{1}/featured.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage))
        End Function
        Public Shared Function TopRatedLink(ByVal contextPage As Page, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
            Return String.Format("{0}language/{1}/top.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage))
        End Function

        

    End Class

End Namespace