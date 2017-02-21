 
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
    Partial Class kovitArticleEdit
        Inherits Entities.Modules.PortalModuleBase


#Region "Private Members"

        Private ArticleId As Integer = Common.Utilities.Null.NullInteger
 
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
            Try

                ' Determine ItemId of bfseArticle to Update
                If Not (Request.QueryString("ArticleId") Is Nothing) Then
                    ArticleId = Int32.Parse(Request.QueryString("ArticleId"))
 
                End If



                ' If this is the first visit to the page, bind the role data to the datalist
                If Page.IsPostBack = False Then

                    For Each language As Locale In Localization.GetLocales(Null.NullInteger).Values
                        ddLanguage.Items.Add(New ListItem(language.Text, language.LanguageID))
                    Next
 
                    cmdCalendar.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(tbPublicationDate)
                    'UI.Utilities.ClientAPI.AddButtonConfirm(cmdDelete, Services.Localization.Localization.GetString("DeleteItem"))



                    If Not Common.Utilities.Null.IsNull(ArticleId) Then
                        ' get content

                        Dim objArticleInfo As ArticleInfo = ArticleInfo.GetThis(ArticleId)
                        If Not objArticleInfo Is Nothing Then
                            ddLanguage.SelectedValue = objArticleInfo.LanguageID
                            tbPublicationDate.Text = objArticleInfo.PublicationDate
                            tbTitle.Text = objArticleInfo.Title
                            tbDescription.Text = objArticleInfo.Description
                            tbKeyWord.Text = objArticleInfo.KeyWord
                            tbArticleURL.Text = objArticleInfo.ArticleURL
                            tbSortOrder.Text = objArticleInfo.SortOrder
                            chkisHidden.Checked = objArticleInfo.IsHidden
                            chkIsFeatured.Checked = objArticleInfo.IsFeatured
                            txtContent.Text = objArticleInfo.ArticleHTML
                            ctlAudit.LastModifiedByUser = objArticleInfo.LastModifiedByUserID
                            ctlAudit.LastModifiedDate = objArticleInfo.LastModifiedOnDate
                            ctlAudit.CreatedByUser = objArticleInfo.CreatedByUserID.ToString
                            ctlAudit.CreatedDate = objArticleInfo.CreatedOnDate

                            lnkEditCategory.NavigateUrl = EditUrl("ArticleID", ArticleId, "editcategory")
                            lnkEditFiles.NavigateUrl = EditUrl("ArticleID", ArticleId, "editfiles")
                            lnkEditEvents.NavigateUrl = EditUrl("ArticleID", ArticleId, "editevents")
                            pnlEditLink.Visible = True
                        Else ' security violation attempt to access item not related to this Module
                            Response.Redirect(NavigateURL(), True)
                        End If
                    Else
                        cmdDelete.Visible = False
                        ctlAudit.Visible = False
                    End If
                End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdCancel_Click runs when the cancel button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdCancel_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdCancel.Click
            Try
                Response.Redirect(NavigateURL(), True)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdUpdate_Click runs when the update button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdUpdate_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdUpdate.Click
            Dim ErrorMessage As String = String.Empty
            Try
                Dim objArticleInfo As ArticleInfo = New ArticleInfo
                'objbfseArticle.ModuleId = ModuleId
                objArticleInfo.ArticleID = ArticleId
                objArticleInfo.PortalID = PortalId
                Integer.TryParse(ddLanguage.SelectedValue, objArticleInfo.LanguageID)
                Date.TryParse(tbPublicationDate.Text, objArticleInfo.PublicationDate)
                objArticleInfo.Title = tbTitle.Text
                objArticleInfo.Description = tbDescription.Text
                objArticleInfo.KeyWord = tbKeyWord.Text
                objArticleInfo.ArticleURL = tbArticleURL.Text

                If objArticleInfo.ArticleURL = String.Empty Then
                    objArticleInfo.ArticleURL = Core.Translitarate(objArticleInfo.Title.Replace(" ", "-"))
                End If

                If tbSortOrder.Text = String.Empty Then
                    objArticleInfo.SortOrder = 65535
                Else
                    Integer.TryParse(tbSortOrder.Text, objArticleInfo.SortOrder)
                End If
                Boolean.TryParse(chkisHidden.Checked, objArticleInfo.IsHidden)
                Boolean.TryParse(chkIsFeatured.Checked, objArticleInfo.IsFeatured)
                objArticleInfo.ArticleHTML = txtContent.Text
                objArticleInfo.LastModifiedByUserID = Me.UserId
                objArticleInfo.LastModifiedOnDate = Today()
                If Common.Utilities.Null.IsNull(ArticleId) Then
                    objArticleInfo.CreatedByUserID = Me.UserId
                    objArticleInfo.CreatedOnDate = Today()
                    ArticleId = objArticleInfo.AddThis(ErrorMessage)
                    ' refresh cache
                    ModuleController.SynchronizeModule(Me.ModuleId)
                    Response.Redirect(EditUrl("ArticleID", ArticleId, "editcategory"), True)
                Else
                    ' update the content within the bfseArticle table

                    objArticleInfo.UpdateThis()
                End If

                ' refresh cache
                ModuleController.SynchronizeModule(Me.ModuleId)

                ' Redirect back to the portal home page
                Response.Redirect(NavigateURL(), True)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub



        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' cmdDelete_Click runs when the delete button is clicked
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Private Sub cmdDelete_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdDelete.Click
            Try
                ' Only attempt to delete the item if it exists already
                If Not Common.Utilities.Null.IsNull(ArticleId) Then
                    ArticleInfo.DeleteThis(ArticleId)
                    ' refresh cache
                    ModuleController.SynchronizeModule(Me.ModuleId)
                End If

                ' Redirect back to the portal home page
                Response.Redirect(NavigateURL(), True)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

 
 
#End Region
 
    End Class

End Namespace