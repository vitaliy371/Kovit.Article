Imports System.Collections.Generic
Imports DotNetNuke
Imports DotNetNuke.Entities.Modules
Imports Kovit.kovitArticle.Data

Namespace Kovit.Modules.kovitArticle

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The EditDynamicModule class is used to manage content
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class kovitArticleEvent
        Inherits Entities.Modules.PortalModuleBase


#Region "Private Members"

        Public LanguageID As Integer = 0

#End Region

#Region "Event Handlers"

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
            Dim ErrorMessage As String = String.Empty
            Try
                If Not Request.QueryString("language") Is Nothing Then
                    LanguageID = Localization.GetLocale(Request.QueryString("language")).LanguageID
                Else
                    LanguageID = Localization.GetLocale(PortalController.GetCurrentPortalSettings().DefaultLanguage()).LanguageID
                End If
                rptEvents.DataSource = ArticleEventInfo.GetArticleEventList()
                rptEvents.DataBind()
                ' If this is the first visit to the page, bind the role data to the datalist
                If Page.IsPostBack = False Then

                End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub

 

#End Region
        Public Shared Function FormatArticleDate(ByVal paramDate As DateTime)
            Return Core.FormatDate(paramDate, "dd.MM.yyyy")

        End Function
        Public Function ArticleLink(ByVal ArticleID As Integer, ByVal LangaugeID As Integer) As String
            Dim ErrorMessage As String = String.Empty
            Try
                Dim Setting As Integer
                Integer.TryParse(Me.Settings("TargetTab"), Setting)
                Return URLManager.ArticleLink(Page, Setting, ArticleID, LangaugeID, 1)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
            Return "ErrorPage.aspx"
        End Function
    End Class

End Namespace