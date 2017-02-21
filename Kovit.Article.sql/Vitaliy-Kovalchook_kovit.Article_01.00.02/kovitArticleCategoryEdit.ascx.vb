 
Imports DotNetNuke
Imports DotNetNuke.Entities.Modules
Imports Kovit.kovitArticle.Data

Namespace Kovit.Modules.kovitArticleCategory

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The EditDynamicModule class is used to manage content
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class kovitArticleCategoryEdit
        Inherits Entities.Modules.PortalModuleBase


#Region "Private Members"

        Private ArticleCategoryId As Integer = Common.Utilities.Null.NullInteger
        Private LanguageID As Integer
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
                ' Determine Id to Update or 0 for New
                If Not (Request.QueryString("ArticleCategoryId") Is Nothing) Then
                    ArticleCategoryId = Int32.Parse(Request.QueryString("ArticleCategoryId"))
                End If


                If Not Page.IsPostBack Then
                    ' FILL Aviable ParentCategories
                    ddParentCategory.DataSource() = ArticleCategoryInfo.GetArticleCategoryList(ErrorMessage, PortalId, LanguageID)
                    ddParentCategory.DataBind()
                    ' FILL Aviable Target Tabs
                    ddTargetTab.DataSource() = ArticleCategoryInfo.GetTargetTabList(ErrorMessage, PortalId)
                    ddTargetTab.DataBind()
                    ' FILL Aviable Languages
                    For Each language As Locale In Localization.GetLocales(Null.NullInteger).Values
                        ddLanguage.Items.Add(New ListItem(language.Text, language.LanguageID))
                    Next
                    If Not Common.Utilities.Null.IsNull(ArticleCategoryId) Then
                        ' EDIT MODE GET Article Category by ID
                        Dim objArticleCategoryInfo As ArticleCategoryInfo = ArticleCategoryInfo.GetThis(ArticleCategoryId)
                        If Not objArticleCategoryInfo Is Nothing Then
                            ddParentCategory.SelectedValue = objArticleCategoryInfo.ParentCategoryID
                            ddTargetTab.SelectedValue = objArticleCategoryInfo.TabID
                            ddLanguage.SelectedValue = objArticleCategoryInfo.LanguageID
                            tbTitle.Text = objArticleCategoryInfo.Title
                            tbDescription.Text = objArticleCategoryInfo.Description
                            tbKeyWord.Text = objArticleCategoryInfo.KeyWord
                            tbArticleCategoryURL.Text = objArticleCategoryInfo.ArticleCategoryURL
                            tbSortOrder.Text = objArticleCategoryInfo.SortOrder
                            ctlAudit.CreatedByUser = objArticleCategoryInfo.CreatedByUserID
                            ctlAudit.CreatedDate = objArticleCategoryInfo.CreatedOnDate
                            ctlAudit.LastModifiedByUser = objArticleCategoryInfo.LastModifiedByUserID
                            ctlAudit.LastModifiedDate = objArticleCategoryInfo.LastModifiedOnDate
                        Else ' security violation attempt to access item not related to this Module
                            Response.Redirect(NavigateURL(), True)
                        End If
                    Else
                        'NEW MODE 
                        cmdDelete.Visible = False
                        ctlAudit.Visible = False

                    End If
                End If


                

                ' Language dropdown changed or submit                        ' 
                If ddParentCategory.SelectedValue = "0" Then
                    ddLanguage.Enabled = True
                Else
                    Dim ParentID As Integer
                    Integer.TryParse(ddParentCategory.SelectedValue, ParentID)
                    Dim objParentArticleCategoryInfo As ArticleCategoryInfo = ArticleCategoryInfo.GetThis(ParentID)
                    If Not objParentArticleCategoryInfo Is Nothing Then
                        ddLanguage.SelectedValue = objParentArticleCategoryInfo.LanguageID
                        ddLanguage.Enabled = False
                    End If
                End If

                cmdDelete.Attributes.Add("onClick", "javascript:return confirm('Do you realy want to delete category?');")


                'End If

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
            Try
                Dim objArticleCategoryInfo As ArticleCategoryInfo = New ArticleCategoryInfo()
                objArticleCategoryInfo.ArticleCategoryID = ArticleCategoryId
                Integer.TryParse(ddParentCategory.SelectedValue, objArticleCategoryInfo.ParentCategoryID)
                Integer.TryParse(ddTargetTab.SelectedValue, objArticleCategoryInfo.TabID)
                Integer.TryParse(ddLanguage.SelectedValue, objArticleCategoryInfo.LanguageID)
                objArticleCategoryInfo.PortalID = PortalId
                objArticleCategoryInfo.Title = tbTitle.Text
                objArticleCategoryInfo.Description = tbDescription.Text
                objArticleCategoryInfo.KeyWord = tbKeyWord.Text
                If objArticleCategoryInfo.ArticleCategoryURL = String.Empty Then
                    objArticleCategoryInfo.ArticleCategoryURL = Core.Translitarate(objArticleCategoryInfo.Title.Replace(" ", "-"))
                Else
                    objArticleCategoryInfo.ArticleCategoryURL = tbArticleCategoryURL.Text
                End If
                If tbSortOrder.Text = String.Empty Then
                    objArticleCategoryInfo.SortOrder = 65535
                Else
                    Integer.TryParse(tbSortOrder.Text, objArticleCategoryInfo.SortOrder)
                End If
                Date.TryParse(Date.Today, objArticleCategoryInfo.CreatedOnDate)
                Integer.TryParse(DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo.UserID, objArticleCategoryInfo.CreatedByUserID)
                Date.TryParse(Date.Today, objArticleCategoryInfo.LastModifiedOnDate)
                Integer.TryParse(DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo.UserID, objArticleCategoryInfo.LastModifiedByUserID)
                

                
                Dim ErrorMessage As String = String.Empty
                If Common.Utilities.Null.IsNull(ArticleCategoryId) Then
                    ' add the content within the bfseArticleCategory table
                    ArticleCategoryId = objArticleCategoryInfo.AddThis(ErrorMessage)
                    If Not String.IsNullOrEmpty(ErrorMessage) Then
                        lblError.Text = ErrorMessage
                        lblError.Visible = True
                    Else
                        ' refresh cache
                        'ModuleController.SynchronizeModule(Me.ModuleId)
                        ' Redirect back to the portal home page
                        Response.Redirect(NavigateURL(), True)
                    End If
                Else
                    ' update the content within the bfseArticleCategory table
                    objArticleCategoryInfo.UpdateThis(ErrorMessage)
                    If Not String.IsNullOrEmpty(ErrorMessage) Then
                        lblError.Text = ErrorMessage
                        lblError.Visible = True
                    Else
                        ' refresh cache
                        ' ModuleController.SynchronizeModule(Me.ModuleId)
                        ' Redirect back to the portal home page
                        Response.Redirect(NavigateURL(), True)
                    End If

                End If

                

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
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
                If Not Common.Utilities.Null.IsNull(ArticleCategoryId) Then
                    ArticleCategoryInfo.DeleteThis(ArticleCategoryId)
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