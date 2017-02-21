Imports DotNetNuke
Imports System.Web.UI
Imports System.Collections.Generic
Imports System.Reflection
Imports Kovit.kovitArticle.Data
Imports System.Net
Imports System.IO
Imports System.Web.Services
Imports System.Web.Script.Services
Imports DotNetNuke.Entities
Imports DotNetNuke.Entities.Portals
Imports DotNetNuke.Services.Syndication
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
    Partial Class kovitArticle
        Inherits Entities.Modules.PortalModuleBase
        Implements Entities.Modules.IActionable

#Region "Private Members"

        Private strTemplate As String
        Public ArticleID As Integer = 0
        Private LanguageID As Integer = 0
        Private CategoryID As Integer = 0
        Public CurrentPage As Integer = 1
        Private ItemsPerPage As Integer = 10
        Private SortMode As Integer = 1 '0 - sortorder, 1-pub date, 2-title
        Public AvarageRating As String = "0"
        Public TotalVotes As Integer = 0
        Private objArticleRatingInfo As ArticleRatingInfo = New ArticleRatingInfo()

        Private Title As String = String.Empty
        Private Description As String = String.Empty
        Private Keyword As String = String.Empty

#End Region
        Private Sub ProcessQueryString()
            If Not Request.QueryString("page") Is Nothing Then
                Integer.TryParse(Request.QueryString("page"), CurrentPage)
            End If
            If Not Request.QueryString("category") Is Nothing Then
                Integer.TryParse(Request.QueryString("category"), CategoryID)
            End If
            If Not Request.QueryString("language") Is Nothing Then
                LanguageID = Localization.GetLocale(Request.QueryString("language")).LanguageID
            Else
                LanguageID = Localization.GetLocale(PortalController.GetCurrentPortalSettings().DefaultLanguage()).LanguageID
            End If


            If Request.QueryString.Keys.Count > 2 Then

                Select Case Request.QueryString.Keys(2).ToString().ToLower()
                    Case "page"

                    Case "category"

                    Case "date"

                    Case "featured"

                    Case "topRated"

                    Case Else
                        '================== ArticleID ============
                        Integer.TryParse(Request.QueryString.Keys(2).ToString(), ArticleID)
                End Select

            End If
        End Sub






#Region "Event Handlers"

        Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            Dim ErrorMessage As String = String.Empty
            Try
                Core.RegisterJavaScript(Page, "jquery.lightbox-0.5", ControlPath)
                Core.RegisterCSS(Page, "jquery.lightbox-0.5", ControlPath)
                ProcessQueryString()
                If ArticleID > 0 Then
                    pnlArticleItem.Visible = True
                    rptArticleList.Visible = False
                    Dim objArticleInfo As ArticleInfo = ArticleInfo.GetThis(ArticleID)
                    lblPublicationDate.Text = FormatArticleDate(objArticleInfo.PublicationDate)
                    litTitle.Text = objArticleInfo.Title
                    litArticleHTML.Text = Server.HtmlDecode(objArticleInfo.ArticleHTML)

                    Dim AttachmentArrayList As ArrayList = New ArrayList()
                    AttachmentArrayList = ArticleAttachmentInfo.GetArticleAttachmentImageList(PortalId, ArticleID, "raw-image")
                    If AttachmentArrayList.Count > 0 Then
                        rptGallery.DataSource = AttachmentArrayList
                        rptGallery.DataBind()
                    Else
                        rptGallery.Visible = False
                    End If
                    AttachmentArrayList = ArticleAttachmentInfo.GetArticleAttachmentImageList(PortalId, ArticleID, "download")

                    If AttachmentArrayList.Count > 0 Then
                        rptDownload.DataSource = AttachmentArrayList
                        rptDownload.DataBind()
                    Else
                        rptDownload.Visible = False
                    End If

                    lnkEdit.Visible = IsEditable
                    btnResetRating.Visible = IsEditable
                    If IsEditable Then
                        lnkEdit.NavigateUrl = EditUrl("ArticleID", ArticleID, "edit") 'fix it!!!
                    End If

                    Dim objArticleRating As ArticleRatingInfo = ArticleRatingInfo.GetArticleRating(ArticleID)
                    If Not objArticleRating Is Nothing Then
                        AvarageRating = objArticleRating.IpAddress
                        TotalVotes = objArticleRating.Rating
                    End If
                    Dim ArticleCommentArrayList As ArrayList = New ArrayList()
                    ArticleCommentArrayList = ArticleCommentInfo.GetArticleCommentListByArticle(ArticleID)
                    rptArticleComment.DataSource = ArticleCommentArrayList
                    rptArticleComment.DataBind()
                    'SEO
                    Title = objArticleInfo.Title
                    Description = objArticleInfo.Description
                    Keyword = objArticleInfo.KeyWord
                Else
                    Dim ArticleArrayList As ArrayList = New ArrayList()

                    'ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer
                    Dim params As Object() = {PortalId, LanguageID, CategoryID, CurrentPage, ItemsPerPage, SortMode, 0, 0}
                    ArticleInfo.SearchArticles(ArticleArrayList, ErrorMessage, params)
                    Dim ItemsTotal As Integer
                    Integer.TryParse(params(7), ItemsTotal)
                    ' bind the content to the repeater
                    rptArticleList.DataSource = ArticleArrayList
                    rptArticleList.DataBind()
                    If ItemsTotal > 1 Then
                        Dim pages As New Dictionary(Of String, String)
                        Dim objArticleCategory As ArticleCategoryInfo
                        If CategoryID > 0 Then
                            objArticleCategory = ArticleCategoryInfo.GetThis(CategoryID)
                            Title = objArticleCategory.Title
                            Description = objArticleCategory.Description
                            Keyword = objArticleCategory.KeyWord
                        Else
                            objArticleCategory = New ArticleCategoryInfo()
                            objArticleCategory.TabID = DotNetNuke.Entities.Portals.PortalSettings.Current.ActiveTab.TabID
                            objArticleCategory.ArticleCategoryURL = "All"
                        End If
                        For counter As Integer = 1 To ItemsTotal
                            pages.Add(counter.ToString(), ArticleCategoryLink(objArticleCategory.TabID, CategoryID, objArticleCategory.ArticleCategoryURL, counter.ToString()))
                        Next
                        rptPagerTop.DataSource = pages
                        rptPagerBottom.DataSource = pages
                        rptPagerTop.DataBind()
                        rptPagerBottom.DataBind()
                    Else
                        rptPagerTop.Visible = False
                        rptPagerBottom.Visible = False
                    End If

                    If CategoryID > 0 Then
                        Dim objArticleCategoryInfo As ArticleCategoryInfo = ArticleCategoryInfo.GetThis(CategoryID)
                        If Not objArticleCategoryInfo Is Nothing Then
                            'SEO
                            Title = objArticleCategoryInfo.Title
                            Description = objArticleCategoryInfo.Description
                            Keyword = objArticleCategoryInfo.KeyWord
                        End If
                    End If

                    'End If
                End If
                Core.ProcessSEO(Me.Page, Title, Description, Keyword)
               
            Catch exc As Exception        'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
            'If Not String.IsNullOrEmpty(Me.Settings("ArticleCategoryCode")) Then
            '    Category = Me.Settings("ArticleCategoryCode").ToString()
            '    lblHeader.Text = "ddd" 'TryCast(ArticleCategoryInfo.GetThis(Category), ArticleCategoryInfo).ArticleCategoryName.ToString()
            'Else
            '    lblHeader.Text = "" '"Установите отображение в настройках"
            'End If

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
                DotNetNuke.Framework.jQuery.RequestRegistration()
                If Not Page.IsPostBack Then



                End If
            Catch exc As Exception        'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub


        Protected Sub rptArticleComment_OnItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles rptArticleComment.ItemCommand
            If e.CommandName = "Delete" Then
                Dim ArticleCommentID As Integer
                Integer.TryParse(e.CommandArgument, ArticleCommentID)
                ArticleCommentInfo.DeleteThis(ArticleCommentID)
                Response.Redirect(URLManager.ReWritedURL(Page))
                'rptArticleComment.DataBind()
            End If
        End Sub

        Protected Sub btnResetRating_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnResetRating.Click
            ProcessQueryString()
            ArticleRatingInfo.DeleteThis(ArticleID)
            Response.Redirect(URLManager.ReWritedURL(Page))
        End Sub
#End Region
#Region "URLs & Formaters"

        

        Public Function ReWritedURL() As String
            Return URLManager.ReWritedURL(Page)
        End Function

        Public Function ArticleCategoryLink(ByVal TargetTabID As Integer, ByVal ArticleCategoryID As Integer, ByVal ArticleCategoryURL As String, ByVal PageNo As Integer) As String
            Return URLManager.ArticleCategoryLink(Page, TargetTabID, ArticleCategoryID, LanguageID, ArticleCategoryURL, PageNo)
        End Function


        Public Function WebServicePath()
            Return String.Format("{0}://{1}{2}{3}", Page.Request.Url.Scheme, Page.Request.Url.Authority, ControlPath, "kovitArticle.asmx")
        End Function

        Public Function BaseURL() As String
            Return URLManager.BaseURL(Page)
        End Function


        Public Function ArticleLink(ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal PageNo As Integer) As String
            Return URLManager.ArticleLink(Page, DotNetNuke.Entities.Portals.PortalSettings.Current.ActiveTab.TabID, ArticleID, LangaugeID, 1)
        End Function


        Public Shared Function FormatArticleDate(ByVal paramDate As DateTime)
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

        Public Function CurrentPageStyle(ByVal objpageNo As Object)
            Dim pageNo As Integer
            Integer.TryParse(objpageNo, pageNo)
            Return IIf((pageNo = CurrentPage), "background:#365391;color:#fff;", "")
        End Function


        Public Function BottomLinks(ByVal ArticleCategoryCode As String, ByVal ArticleID As Integer, ByVal ArticleName As String, ByVal AttachmentURL As String) As String
            If String.IsNullOrEmpty(AttachmentURL) Then
                Return String.Format("<a class=""button"" href=""Article-{0}/{1}/{2}.aspx""  /><span>читать полностью</span></a>", ArticleCategoryCode, ArticleID.ToString(), ArticleName)
            Else
                Return String.Format("<a class=""button"" href=""{0}ArticleFiles/{1}"" /><span>скачать файл</span></a>", Me.PortalSettings.HomeDirectory, Server.UrlPathEncode(AttachmentURL))
            End If
        End Function
        Public Function GetLocale(ByVal key As String)

            Return Localization.GetString(key, LocalResourceFile)

        End Function

 
#End Region



        Public ReadOnly Property RatingWidth() As Integer
            Get
                Dim fl As Double
                Double.TryParse(AvarageRating, NumberStyles.Any, NumberFormatInfo.InvariantInfo, fl)
                Return Math.Round(fl * 28)
            End Get
        End Property








#Region "Optional Interfaces"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' Registers the module actions required for interfacing with the portal framework
        ''' </summary>
        ''' <value></value>
        ''' <returns></returns>
        ''' <remarks></remarks>



        Public ReadOnly Property ModuleActions() As Entities.Modules.Actions.ModuleActionCollection Implements Entities.Modules.IActionable.ModuleActions
            Get
                Dim Actions As New Entities.Modules.Actions.ModuleActionCollection
                Actions.Add(GetNextActionID, Localization.GetString(Entities.Modules.Actions.ModuleActionType.AddContent, LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, "", "", EditUrl(), False, SecurityAccessLevel.Edit, True, False)
                'Actions.Add(GetNextActionID, Localization.GetString("", LocalResourceFile), Entities.Modules.Actions.ModuleActionType.AddContent, "", "", EditUrl("editcategory"), False, SecurityAccessLevel.Edit, True, False)

                Return Actions
            End Get
        End Property

#End Region


    End Class




End Namespace
