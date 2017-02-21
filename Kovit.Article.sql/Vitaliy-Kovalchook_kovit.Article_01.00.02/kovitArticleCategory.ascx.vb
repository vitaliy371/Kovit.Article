 
Imports DotNetNuke
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports Kovit.kovitArticle.Data
Imports System.Net
Imports System.IO
Imports DotNetNuke.Entities

Namespace Kovit.Modules.kovitArticle

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The ViewDynamicModule class displays the content
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class kovitArticleCategory
        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

#Region "Private Members"

        Private strTemplate As String
        Private LanguageID As Integer = 0
        Private CategoryID As Integer = 0
#End Region

        Public Function PageURL() As String
            Return URLManager.ReWritedURL(Page)
        End Function




        Public Shared Function FormatArticleCategoryDate(ByVal paramDate As DateTime)
            Return Core.FormatDate(paramDate, "d.MM.yyyy")

        End Function

        Public Shared Function FormatText(ByVal paramString As String)
            Dim result As String = Core.HTML2Text(paramString)
            If result.Length > 250 Then
                Return result.Substring(0, 247) & "..."
            Else
                Return result
            End If
        End Function


        Public Function CategoryLink(ByVal ArticleCategoryURL As String, ByVal TargetTabID As Integer, ByVal ArticleCategoryID As Integer, ByVal Title As String, ByVal LanguageID As Integer) As String
            Return String.Format("<a href=""{0}""><span>{1}</span></a>", URLManager.ArticleCategoryLink(Page, TargetTabID, ArticleCategoryID, LanguageID, ArticleCategoryURL, 1), Title)
        End Function
        Private Sub ProcessQueryString()
            Dim ErrorMessage As String = String.Empty
            If Not Request.QueryString("category") Is Nothing Then
                Integer.TryParse(Request.QueryString("category"), CategoryID)
            End If
            If Not Request.QueryString("language") Is Nothing Then
                LanguageID = Localization.GetLocale(Request.QueryString("language")).LanguageID
            Else
                LanguageID = Localization.GetLocale(PortalController.GetCurrentPortalSettings().DefaultLanguage()).LanguageID
            End If
            Dim ArticleCategoryArrayList As ArrayList = New ArrayList()

            'If Not String.IsNullOrEmpty(Category) Then
            ArticleCategoryArrayList = ArticleCategoryInfo.GetArticleCategoryList(ErrorMessage, PortalId, LanguageID)

            Dim sb As New StringBuilder()

            sb.Append("<ul class=""ArticleCategoryMenu noaccordion"" id=""ArticleCategoryMenu"" >")
 
            Dim ParentCount As Integer = 0
  


            For Each CategoryItem As ArticleCategoryInfo In ArticleCategoryArrayList
                If CategoryItem.ParentCategoryID = 0 AndAlso CategoryItem.ArticleCategoryID <> 0 Then
                    Dim childstr As String = getChildStr(CategoryItem.ArticleCategoryID, ArticleCategoryArrayList)
                    sb.Append("<li>")
                    If IsEditable Then
                        sb.Append("<a  href=""" & EditUrl("ArticleCategoryID", CategoryItem.ArticleCategoryID, "edit") & """><small>edit " & CategoryItem.Title & "</small></a>")
                    End If
                    If String.IsNullOrEmpty(childstr) Then
                        sb.Append("<a href=""" & ArticleCategoryLink(CategoryItem.TabID, CategoryItem.ArticleCategoryID, CategoryItem.ArticleCategoryURL, 1) & """>")
                        sb.Append("<span>")
                        sb.Append(CategoryItem.Title & "</span></a>")

                    Else
                        ParentCount += 1
                        sb.Append("<a href=""#"" class=""m" & ParentCount & """>") 'vbCrLf &
                        sb.Append("<span>" & CategoryItem.Title & "</span></a>")

                        sb.Append(childstr)
                    End If

                    sb.Append("</li>")
                Else

                End If

            Next
            sb.Append("</ul>")
            litCategoryList.Text = sb.ToString()
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub

        Private Function getChildStr(ByRef CurrentCategoryID As Integer, ByRef ArticleCategories As ArrayList) As String
            Dim sb As New StringBuilder
            Dim childcount As Integer = 0
            For Each CategoryItem As ArticleCategoryInfo In ArticleCategories
                If CategoryItem.ParentCategoryID = CurrentCategoryID Then
                    childcount += 1
                    sb.Append("<li>")
                    If IsEditable Then
                        sb.Append("<a  href=""" & EditUrl("ArticleCategoryID", CategoryItem.ArticleCategoryID, "edit") & """><small>edit " & CategoryItem.Title & "</small></a>")
                    End If
                    sb.Append("<a href=""" & ArticleCategoryLink(CategoryItem.TabID, CategoryItem.ArticleCategoryID, CategoryItem.ArticleCategoryURL, 1) & """>")
                    sb.Append("<span>")
                    sb.Append(CategoryItem.Title & "</span></a>") 'vbCrLf & 

                    sb.Append("</li>") 'vbCrLf & 
                End If
            Next
            If childcount > 0 Then
                Return String.Format("<ul>{0}</ul>", sb.ToString())
            Else
                Return String.Empty
            End If

        End Function
        Public Function ArticleCategoryLink(ByVal TargetTabID As Integer, ByVal ArticleCategoryID As Integer, ByVal ArticleURL As String, ByVal PageNo As Integer) As String
            Return URLManager.ArticleCategoryLink(Page, TargetTabID, ArticleCategoryID, LanguageID, ArticleURL, PageNo)
        End Function

#Region "Event Handlers"

        Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            ProcessQueryString()
            Core.RegisterJavaScript(Page, "CategoryMenu", ControlPath)
            Core.RegisterJavaScript(Page, "jQuery.cookie", ControlPath)

            'Core.RegisterCSS(Page, "superfish", ControlPath)
            'Core.RegisterCSS(Page, "superfish-vertical", ControlPath)
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Page_Load runs when the control is loaded
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
            Try
                If Not Page.IsPostBack Then

                    If Not String.IsNullOrEmpty(Me.Settings("ArticleCategoryCategoryCode")) Then
                        'Category = Me.Settings("ArticleCategoryCategoryCode").ToString()
                        'lblHeader.Text = "xxx" 'TryCast(ArticleCategoryInfo.GetThis(Category), ArticleCategoryInfo).GetArticleCategoryList()
                    Else
                        'lblHeader.Text = "" '"Установите отображение в настройках"
                    End If
 
                End If
            Catch exc As Exception        'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub



#End Region

#Region "Optional Interfaces"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Registers the module actions required for interfacing with the portal framework
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public ReadOnly Property ModuleActions() As Entities.Modules.Actions.ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New Entities.Modules.Actions.ModuleActionCollection
                Actions.Add(GetNextActionID, Localization.GetString(Entities.Modules.Actions.ModuleActionType.AddContent, LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, "", "", EditUrl(), False, SecurityAccessLevel.Edit, True, False)
                Return Actions
            End Get
        End Property

#End Region

    End Class




End Namespace
