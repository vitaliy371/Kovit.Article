Imports Microsoft.VisualBasic
Imports DotNetNuke.Services.Localization
Imports System.Globalization
Imports DotNetNuke.Entities.Portals
Imports Kovit.Article.Data
Imports Kovit.Article.Entity

Namespace Email
    Public Class CategorySubscriptionScheduler
        Inherits DotNetNuke.Services.Scheduling.SchedulerClient
        Const TemplatePath As String = "~/DesktopModules/kovit/kovit.Article/App_LocalResources/kovitArticle.ascx.resx"

        Private Shared isRunning As Boolean

        Public Sub New(ByVal objScheduleHistoryItem As _
        DotNetNuke.Services.Scheduling.ScheduleHistoryItem)
            MyBase.New()
            Me.ScheduleHistoryItem = objScheduleHistoryItem
        End Sub


        Public Overrides Sub DoWork()
            Me.Progressing()
            'run process
            Try
                If Not isRunning Then
                    isRunning = True
                    CreateSubscriptionMessages()
                End If
                EmailProvider.Instance().Start()
                Me.Completed()
                isRunning = False
                Me.ScheduleHistoryItem.Succeeded = True
                Me.ScheduleHistoryItem.AddLogNote("Email processing completed at " & DateTime.Now.ToShortDateString() & " " & DateTime.Now.ToShortTimeString())
            Catch ex As Exception
                isRunning = False
                Me.Completed()
                Me.ScheduleHistoryItem.Succeeded = False
                Me.ScheduleHistoryItem.AddLogNote("Email processing failed at " & DateTime.Now.ToShortDateString() & " " & DateTime.Now.ToShortTimeString() & ex.Message)
                Me.Errored(ex)
            End Try
            Me.Completed()
        End Sub

        Public Shared Sub CreateSubscriptionMessages()
            CreateSubscriptionMessages(Date.Today.AddDays(-1)) ' Day
        End Sub
        Public Shared Sub CreateSubscriptionMessages(ByVal FromDate As DateTime)

            Dim UpdatedCategories As ArrayList = ArticleCategoryInfo.GetUpdtedFrom(String.Empty, FromDate)
            For Each cat As ArticleCategoryInfo In UpdatedCategories


                Dim Articles As New ArrayList
                Dim EmailPortal As EmailPortalInfo = EmailPortalInfo.GetThisByPortalID(cat.PortalID)
                Dim objLocale As DotNetNuke.Services.Localization.Locale = Localization.GetLocaleByID(cat.LanguageID)

                Dim eMessage As New EmailMessageInfo

                Dim UnsubscribeLink As String = URLManager.ArticleCategoryUnubscribeLink(GetHost(cat.PortalID), cat.TabID, cat.PortalID, cat.ArticleCategoryID, cat.LanguageID, cat.ArticleCategoryURL, "[UnsubscribeKey]")

                Dim UpdatedCategoriesSubjectTemplate As String = _
                Localization.GetString("UpdatedCategoriesSubjectTemplate", TemplatePath, DotNetNuke.Common.Globals.GetPortalSettings, objLocale.Code, False)
                If String.IsNullOrEmpty(UpdatedCategoriesSubjectTemplate) Then
                    UpdatedCategoriesSubjectTemplate = "category {0} update notification"
                End If


                Dim MessageBodyTemplate As String = _
                Localization.GetString("UpdatedCategoriesMessageBodyTemplate", TemplatePath, DotNetNuke.Common.Globals.GetPortalSettings, objLocale.Code, False)
                If String.IsNullOrEmpty(MessageBodyTemplate) Then
                    MessageBodyTemplate = "<h3>Category {0} update notification</h3><div>{1}</div><div><small>If you do not wish to receive these messages in the future, please <a href=""{2}"">unsubscribe</a></small></div>"
                End If


                Dim UpdatedItemTemplate As String = _
                Localization.GetString("UpdatedItemTemplate ", TemplatePath, DotNetNuke.Common.Globals.GetPortalSettings, objLocale.Code, False)
                If String.IsNullOrEmpty(UpdatedItemTemplate) Then
                    'Article.Title, Article.PublicationDate, Article.Description, Url
                    UpdatedItemTemplate = "<div><h2><a href=""{3}"">{0}</a>({1})</h2><p>{2}</p><div>"
                End If

                Dim CategoryItems As String = GetUpdatesByCategory(cat, UpdatedItemTemplate, FromDate)

                eMessage.MessageBody = String.Format(MessageBodyTemplate, cat.Title, CategoryItems, UnsubscribeLink)
                eMessage.Subject = String.Format(UpdatedCategoriesSubjectTemplate, cat.Title)
                Dim EmailMessageID = eMessage.AddThis()

                Dim RepicientList As ArrayList = ArticleCategorySubscriptionInfo.GetArticleCategorySubscribers(cat.ArticleCategoryID)
                If Not RepicientList Is Nothing Then
                    For Each rep As EmailRecipientInfo In RepicientList
                        Dim eMessageState As New EmailMessageStateInfo
                        eMessageState.EmaillStateID = 1
                        eMessageState.EmailMessageID = EmailMessageID
                        eMessageState.EmailPortalID = EmailPortal.EmailPortalID
                        eMessageState.EmailRecipientID = rep.EmailRecipientID
                        eMessageState.AddThis()
                    Next
                End If
            Next
        End Sub
        Public Shared Function GetHost(ByVal PortalID As Integer) As String
            Dim pac As New PortalAliasController
            Dim paal As ArrayList = pac.GetPortalAliasArrayByPortalID(PortalID)
            If paal.Count > 0 Then
                Return TryCast(paal(0), PortalAliasInfo).HTTPAlias.ToString
            Else
                Return "UnknownHost"
            End If
        End Function


        Public Shared Function GetUpdatesByCategory(ByVal objCategory As ArticleCategoryInfo, ByVal Template As String, ByVal FromDate As DateTime) As String
            Dim resultString As New Text.StringBuilder



            Dim Articles As New ArrayList
            Dim params As Object() = {objCategory.PortalID, objCategory.LanguageID, objCategory.ArticleCategoryID, 1, 100, 0, 0, FromDate, -1, "", 0}
            ArticleInfo.SearchArticles(Articles, String.Empty, params) 'ignore error
            For Each Article As ArticleInfo In Articles
                Dim Url As String = ArticleLink(GetHost(objCategory.PortalID), objCategory.TabID, Article.ArticleID, Article.LanguageID, Article.ArticleURL, 1)
                resultString.Append(String.Format(Template, Article.Title, Article.PublicationDate.ToString("d.MM.yyyy", CultureInfo.InvariantCulture), Article.Description, Url))
            Next
            Return resultString.ToString()
        End Function
        Public Shared Function ArticleLink(ByVal TargetHost As String, ByVal TabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal PageNo As Integer) As String
            Return URLManager.ArticleLink(TargetHost, TabID, ArticleID, LangaugeID, 1)
        End Function
    End Class
End Namespace