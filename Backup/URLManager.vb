Imports Microsoft.VisualBasic
Imports System.Web
Imports System.Web.UI
Imports System.Globalization
Imports DotNetNuke.Common.Globals
Imports DotNetNuke.Entities.Tabs
Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Services.Localization
Imports Kovit.Article.Entity

Public Class URLManager
    Public Shared Function ReWritedURL(ByVal contextPage As Page) As String
        Return String.Format("{0}://{1}{2}", contextPage.Request.Url.Scheme, contextPage.Request.Url.Authority, contextPage.Request.RawUrl)
    End Function
    Public Shared Function BaseURL(ByVal contextPage As Page) As String
        Return String.Format("{0}://{1}{2}", contextPage.Request.Url.Scheme, contextPage.Request.Url.Authority, contextPage.Request.ApplicationPath.TrimEnd("/") + "/")
    End Function

    Public Shared Function PortalAliasURL(ByVal contextPage As Page) As String
        Return String.Format("{0}{1}", contextPage.Request.Url.Authority, contextPage.Request.ApplicationPath.TrimEnd("/"))
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

    Public Shared Function ArticleLink(ByVal oPage As Page, ByVal TargetTabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
        Return ArticleLink(URLManager.PortalAliasURL(oPage), TargetTabID, ArticleID, LangaugeID, PageNo)
    End Function
    Public Shared Function ArticleLink(ByVal oPage As Page, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
        Dim TargetTabID As Integer = ArticleInfo.GetArticleTargetTab(String.Empty, ArticleID)
        Return ArticleLink(URLManager.PortalAliasURL(oPage), TargetTabID, ArticleID, LangaugeID, PageNo)
    End Function

    Public Shared Function ArticleLink(ByVal ActiveAlias As String, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
        Dim TargetTabID As Integer = ArticleInfo.GetArticleTargetTab(String.Empty, ArticleID)
        Return ArticleLink(ActiveAlias, TargetTabID, ArticleID, LangaugeID, PageNo)
    End Function


 
    Public Shared Function ArticleLink(ByVal ActiveAlias As String, ByVal TargetTabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
        Dim errStr As String = ""
    
        Dim lc As New LocaleController


        Dim ai As ArticleInfo = ArticleInfo.GetThis(ArticleID)

        If ArticleID > 0 Then

            Dim loc As Locale = lc.GetLocale(LangaugeID)

            


            Dim ps As New PortalSettings(TargetTabID, ai.PortalID)
            LoadPortalSetting(ps, ActiveAlias, TargetTabID)


            If PageNo > 1 Then
                Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ArticleID.ToString() & "=" & ai.ArticleURL, "page=" & PageNo.ToString())
            Else
                Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ArticleID.ToString() & "=" & ai.ArticleURL)
            End If




        Else


            errStr = "Invalid ArticleID"
        End If
        Return errStr

    End Function

    Public Shared Sub LoadPortalSetting(ByRef ps As PortalSettings, ByRef ActiveAlias As String, ByVal TargetTabID As Integer)

        Dim tabc As New TabController
        Dim pac As New PortalAliasController

        Dim tab As DotNetNuke.Entities.Tabs.TabInfo = tabc.GetTab(TargetTabID, ps.PortalId, False)
        If tab Is Nothing Then
            Dim clist As ArrayList = ArticleCategoryInfo.GetTargetTabList("", ps.PortalId)
            If Not clist Is Nothing AndAlso clist.Count > 0 Then
                ps.ActiveTab = CType(clist(0), DotNetNuke.Entities.Tabs.TabInfo)
            End If
        Else
            ps.ActiveTab = tab
        End If


        If (Not ps Is Nothing) AndAlso ps.PortalAlias Is Nothing Then
            Dim paal As ArrayList = pac.GetPortalAliasArrayByPortalID(ps.PortalId)
            If paal.Count = 1 Then
                ps.PortalAlias = paal(0)
            Else
                For i As Integer = 1 To paal.Count
                    If ActiveAlias.ToLower = CType(paal(i - 1), PortalAliasInfo).HTTPAlias.ToLower Then
                        ps.PortalAlias = paal(i - 1)
                    End If
                Next
            End If

        End If
    End Sub


    Public Shared Function FreeTextLink(ByVal TargetTabID As Integer, ByVal FreeText As String, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal PageNo As Integer) As String
        Dim tc As New TabController
        Dim lc As New LocaleController()
        Dim loc As Locale = lc.GetLocale(LangaugeID)

        Dim tab As DotNetNuke.Entities.Tabs.TabInfo = tc.GetTab(TargetTabID, 0, True)
        If Not tab Is Nothing Then
            Dim ps As PortalSettings = New PortalSettings(tab.PortalID)
            If (Not ps Is Nothing) AndAlso ps.PortalAlias Is Nothing Then
                Dim pac As New PortalAliasController
                Dim paal As ArrayList = pac.GetPortalAliasArrayByPortalID(tab.PortalID)
                If paal.Count > 0 Then
                    ps.PortalAlias = paal(0)
                Else
                    Return "404-Error.aspx?aspxerrorpath=/portal-alias-error-portalID-" & tab.PortalID & "count-" & paal.Count & ".aspx"
                End If
            Else
                Return "404-Error.aspx?aspxerrorpath=/portal-alias-error-portalID-" & tab.PortalID & ".aspx"
            End If
            If PageNo > 1 Then
                Return NavigateURL(TargetTabID, False, ps, "", loc.Code, "FreeText=" & FreeText, "category=" & ArticleCategoryID, "page=" & PageNo.ToString())
            Else
                Return NavigateURL(TargetTabID, False, ps, "", loc.Code, "FreeText=" & FreeText, "category=" & ArticleCategoryID)
            End If
        Else
            Return "404-Error.aspx?aspxerrorpath=/tabid/" & TargetTabID & "/Not-exist.aspx"
        End If



    End Function


    Public Shared Function ArticleCategoryLink(ByVal oPage As Page, ByVal TargetTabID As Integer, ByVal portalid As Integer, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal ArticleCategoryURL As String, ByVal PageNo As Integer) As String
        Return ArticleCategoryLink(TargetTabID, portalid, ArticleCategoryID, LangaugeID, ArticleCategoryURL, PageNo, URLManager.PortalAliasURL(oPage))
    End Function

    Public Shared Function ArticleCategoryLink(ByVal TargetTabID As Integer, ByVal portalid As Integer, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal ArticleCategoryURL As String, ByVal PageNo As Integer, ByVal ActiveAlias As String) As String
        Dim lc As New LocaleController()
        Dim loc As Locale = lc.GetLocale(LangaugeID)
        Dim ps As New PortalSettings(TargetTabID, portalid)

        LoadPortalSetting(ps, ActiveAlias, TargetTabID)

        If PageNo > 1 Then
            Return NavigateURL(TargetTabID, False, ps, "", loc.Code, "category=" & ArticleCategoryID.ToString(), ArticleCategoryURL & "=page", PageNo.ToString())

        Else
            Return NavigateURL(TargetTabID, False, ps, "", loc.Code, "category=" & ArticleCategoryID.ToString(), ArticleCategoryURL)

        End If
    End Function
    Public Shared Function ArticleCategoryUnubscribeLink(ByVal host As String, ByVal TargetTabID As Integer, ByVal PortalID As Integer, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal ArticleCategoryURL As String, ByVal ControlKey As String) As String
        Dim loc As Locale = Localization.GetLocaleByID(LangaugeID)

        'HTTP Context
        If HttpContext.Current Is Nothing Then
            Return NavigateURL(TargetTabID, "language", loc.Code, "", "category=" & ArticleCategoryID.ToString(), ArticleCategoryURL & "=unsubscribe", ControlKey)
        Else
            'USE own method
            Dim tabc As New TabController

            Dim tabpath As String = tabc.GetTab(TargetTabID, PortalID, True).TabPath.Replace("//", "/")
            Return String.Format("http://{0}/language/{1}{2}/category/{3}/{4}/unsubscribe/{5}.aspx", _
            host, loc.Code, tabpath, ArticleCategoryID.ToString(), ArticleCategoryURL, ControlKey)
        End If
    End Function


    Public Shared Function DateLink(ByVal contextPage As Page, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal ToDate As Date, ByVal PageNo As Integer) As String
        If PageNo > 1 Then
            Return String.Format("{0}language/{1}/{2}/date/{3}/page/{4}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage), ToDate.ToString("yyyy-MM", CultureInfo.InvariantCulture), PageNo)
        Else
            Return String.Format("{0}language/{1}/{2}/date/{3}.aspx", BaseURL(contextPage), Localization.GetLocaleByID(LangaugeID).Code, TabPathURL(contextPage), ToDate.ToString("yyyy-MM", CultureInfo.InvariantCulture))
        End If
    End Function





    Public Shared Function ArticleAtributeLink(ByVal TargetTabID As Integer, ByVal portalid As Integer, ByVal ArticleCategoryID As Integer, ByVal LangaugeID As Integer, ByVal ArticleCategoryURL As String, ByVal PageNo As Integer, ByVal ActiveAlias As String, ByVal Atributes As String(), ByVal FreeText As String) As String
        Dim lc As New LocaleController()
        Dim loc As Locale = lc.GetLocale(LangaugeID)
        Dim ps As New PortalSettings(TargetTabID, portalid)

        LoadPortalSetting(ps, ActiveAlias, TargetTabID)


        If String.IsNullOrEmpty(FreeText) And Atributes.Length = 0 Then
            Return ArticleCategoryLink(TargetTabID, portalid, ArticleCategoryID, LangaugeID, Core.NormalizeForURL(ArticleCategoryURL), PageNo, ActiveAlias)
        Else

            If Not String.IsNullOrEmpty(FreeText) And Atributes.Length = 0 Then

                Return FreeTextLink(TargetTabID, FreeText, ArticleCategoryID, LangaugeID, PageNo)

            Else
                If PageNo > 1 Then


                    If String.IsNullOrEmpty(FreeText) Then
                        Dim ap As String() = New String(Atributes.Length + 3) {}
                        ap(0) = "category=" & ArticleCategoryID.ToString()
                        ap(1) = Core.NormalizeForURL(ArticleCategoryURL) & "=attributes"
                        For index As Integer = 0 To Atributes.Length - 2
                            ap(2 + index) = Atributes(index)
                        Next
                        ap(Atributes.Length - 1) = "page=" & PageNo.ToString()
                        Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ap)
                    Else
                        Dim ap As String() = New String(Atributes.Length + 4) {}
                        ap(0) = "category=" & ArticleCategoryID.ToString()
                        ap(1) = "freetext=" & FreeText
                        ap(2) = Core.NormalizeForURL(ArticleCategoryURL) & "=attributes"

                        For index As Integer = 0 To Atributes.Length - 2
                            ap(3 + index) = Atributes(index)
                        Next

                        ap(Atributes.Length - 1) = "page=" & PageNo.ToString()
                        Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ap)
                    End If



                Else
                    If String.IsNullOrEmpty(FreeText) Then
                        Dim ap As String() = New String(Atributes.Length + 2) {}
                        ap(0) = "category=" & ArticleCategoryID.ToString()
                        ap(2) = Core.NormalizeForURL(ArticleCategoryURL) & "=attributes"
                        For index As Integer = 0 To Atributes.Length - 1
                            ap(3 + index) = Atributes(index)
                        Next
                        Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ap)
                    Else
                        Dim ap As String() = New String(Atributes.Length + 3) {}
                        ap(0) = "category=" & ArticleCategoryID.ToString()
                        ap(1) = "freetext=" & FreeText
                        ap(2) = Core.NormalizeForURL(ArticleCategoryURL) & "=attributes"
                        For index As Integer = 0 To Atributes.Length - 1
                            ap(3 + index) = Atributes(index)
                        Next
                        Return NavigateURL(TargetTabID, False, ps, "", loc.Code, ap)
                    End If

                End If
            End If

           



        End If


   


    End Function

End Class

