Imports DotNetNuke
Imports DotNetNuke.Common
Imports DotNetNuke.Common.Utilities
Imports DotNetNuke.Entities.Tabs
Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Security.Permissions
Imports System.Web
Imports DotNetNuke.Services.Localization
Imports System.Collections.Generic
Imports DotNetNuke.Services.Sitemap
Imports DotNetNuke.Entities.Modules
Imports Kovit.Article.Entity


Public Class SitemapProvider
    Inherits Global.DotNetNuke.Services.Sitemap.SitemapProvider

    Private useLevelBasedPagePriority As Boolean
    Private minPagePriority As Single
    Private includeHiddenPages As Boolean
    Private ps As PortalSettings

    ''' <summary>
    ''' Includes page urls on the sitemap
    ''' </summary>
    ''' <remarks>
    ''' Pages that are included:
    ''' - are not deleted
    ''' - are not disabled
    ''' - are normal pages (not links,...)
    ''' - are visible (based on date and permissions)
    ''' </remarks>
    Public Overrides Function GetUrls(ByVal portalId As Integer, ByVal ps As PortalSettings, ByVal version As String) As List(Of SitemapUrl)

        Dim pageUrl As SitemapUrl
        Dim urls As New List(Of SitemapUrl)
        Dim ErrorMessage As String = String.Empty
        Const SortMode As Integer = 1

        Dim alCategory As ArrayList = ArticleCategoryInfo.GetArticleCategoryListByPortal(portalId)
        If Not alCategory Is Nothing AndAlso alCategory.Count > 0 Then
            For Each objCategory As ArticleCategoryInfo In alCategory
                If Not objCategory Is Nothing AndAlso objCategory.ArticleCategoryID <> 0 Then
                    'Add Category URL    
                    pageUrl = New SitemapUrl()
                    pageUrl.Priority = 0.5
                    pageUrl.Url = URLManager.ArticleCategoryLink(objCategory.TabID, portalId, objCategory.ArticleCategoryID, objCategory.LanguageID, objCategory.ArticleCategoryURL, 1, ps.PortalAlias.HTTPAlias)
                    pageUrl.LastModified = objCategory.LastModifiedOnDate
                    pageUrl.ChangeFrequency = SitemapChangeFrequency.Weekly
                    urls.Add(pageUrl)

                    'Dim URL As String = URLManager.ArticleCategoryLink(Me.Page, TabId, PortalId, objCategory.ArticleCategoryID, objCategory.LanguageID, objCategory.ArticleCategoryURL, 1)
                    'ByVal PortalID As Integer, ByVal LanguageID As Integer,  @CategoryID int, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer, OnlyFeatured, FromDate, ToDate, FreeText, @Total OUTPUT
                    Dim params As Object() = {portalId, objCategory.LanguageID, objCategory.ArticleCategoryID, 1, 1000, SortMode, 0, -1, -1, String.Empty, 0}
                    Dim Articles As New ArrayList()
                    ArticleInfo.SearchArticles(Articles, ErrorMessage, params)
                    For Each objArticle As ArticleInfo In Articles

                        Dim guid As String = String.Format("{0}={1}", objArticle.ArticleID, objArticle.ArticleURL)
                        Dim Text As String = objArticle.Title & " " & objArticle.Description & " " & Core.HTML2Text(objArticle.ArticleHTML)

                        pageUrl = New SitemapUrl()
                        pageUrl.Priority = 0.5
                        If objArticle.IsFeatured = True Then pageUrl.Priority = 1
                        pageUrl.Url = URLManager.ArticleLink(ps.PortalAlias.HTTPAlias, objArticle.ArticleID, objArticle.LanguageID, 1)
                        pageUrl.LastModified = objArticle.LastModifiedOnDate
                        pageUrl.ChangeFrequency = SitemapChangeFrequency.Weekly
                        urls.Add(pageUrl)
                    Next
                End If
            Next
        End If
        

 
        'For Each objArticle As ArticleInfo In Articles
        '    pageUrl = New SitemapUrl()
        '    pageUrl.Priority = 0.5
        '    If objArticle.IsFeatured = True Then pageUrl.Priority = 1
        '    Dim al As ArrayList = ArticleCategoryInfo.GetTargetTabList(ErrorMessage, portalId)
        '    If al.Count > 0 Then
        '        Dim ti As DotNetNuke.Entities.Tabs.TabInfo = al(0)
        '        If Not ti Is Nothing Then
        '            pageUrl.Url = URLManager.ArticleLink(me. , ti.TabID, objArticle.ArticleID, objArticle.LanguageID, 1)
        '            pageUrl.LastModified = objArticle.PublicationDate
        '            pageUrl.ChangeFrequency = SitemapChangeFrequency.Weekly
        '            urls.Add(pageUrl)
        '        End If
        '    End If
        'Next
        Return urls
    End Function


End Class

