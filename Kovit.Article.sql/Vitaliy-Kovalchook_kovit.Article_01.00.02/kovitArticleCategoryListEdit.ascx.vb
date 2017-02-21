'
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
'
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
    Partial Class kovitArticleCategoryListEdit
        Inherits Entities.Modules.PortalModuleBase


#Region "Private Members"

        Private _ArticleId As Integer

#End Region

#Region "Event Handlers"
        Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
            ' Determine ItemId of bfseArticle to Update
            Dim ErrorMessage As String = String.Empty
            ctlCategories.AvailableDataSource = ArticleCategoryInfo.GetArticleCategoryAvailableList(ErrorMessage, ArticleID)
            ctlCategories.SelectedDataSource = ArticleCategoryInfo.GetArticleCategoryAssignedList(ErrorMessage, ArticleID)
            ctlCategories.DataBind()
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If

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


                lnkEdit.NavigateUrl = EditUrl("ArticleID", ArticleID, "edit")

                lnkEditFiles.NavigateUrl = EditUrl("ArticleID", ArticleID, "editfiles")
                lnkEditEvents.NavigateUrl = EditUrl("ArticleID", ArticleID, "editevents")
                ' If this is the first visit to the page, bind the role data to the datalist
                If Page.IsPostBack = False Then

 

                    If Not Common.Utilities.Null.IsNull(ArticleId) Then
                        ' get content


                        'If Not objArticleInfo Is Nothing Then

                        'Else ' security violation attempt to access item not related to this Module
                        '    Response.Redirect(NavigateURL(), True)
                        'End If
                    Else

                        ctlAudit.Visible = False
                    End If
                End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

 



        Protected Sub ctlCategories_AddAllButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles ctlCategories.AddAllButtonClick
            Dim ErrorMessage As String = String.Empty
            For Each objArticleCategoryInfo As ArticleCategoryInfo In ArticleCategoryInfo.GetArticleCategoryAvailableList(ErrorMessage, ArticleID)
                'Add item all
                ArticleCategoryListInfo.AddThis(ArticleID, objArticleCategoryInfo.ArticleCategoryID)
            Next
            
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            Else
                ' refresh cache
                ModuleController.SynchronizeModule(Me.ModuleId)
                ' Redirect back to the portal home page
                Response.Redirect(EditUrl("ArticleID", ArticleID, "editcategory"), True)
            End If
        End Sub

        Protected Sub ctlCategories_AddButtonClick(ByVal sender As Object, ByVal e As UI.WebControls.DualListBoxEventArgs) Handles ctlCategories.AddButtonClick
            If e.Items IsNot Nothing Then
                For Each ArticleCategoryID As Integer In e.Items
                    'Add item
                    ArticleCategoryListInfo.AddThis(ArticleID, ArticleCategoryID)
                Next
            End If
            ' refresh cache
            ModuleController.SynchronizeModule(Me.ModuleId)

            ' Redirect back to the portal home page
            Response.Redirect(EditUrl("ArticleID", ArticleID, "editcategory"), True)
        End Sub

        Protected Sub ctlCategories_RemoveAllButtonClick(ByVal sender As Object, ByVal e As System.EventArgs) Handles ctlCategories.RemoveAllButtonClick
            'Add all Portals

            'For Each ArticleCategoryID As Integer In e.
            'Remove all
            'objArticleCategoryListInfo.
            'Next
            ' refresh cache
            ModuleController.SynchronizeModule(Me.ModuleId)

            ' Redirect back to the portal home page
            Response.Redirect(EditUrl("ArticleID", ArticleID, "editcategory"), True)
        End Sub

        Protected Sub ctlCategories_RemoveButtonClick(ByVal sender As Object, ByVal e As UI.WebControls.DualListBoxEventArgs) Handles ctlCategories.RemoveButtonClick
            If e.Items IsNot Nothing Then
                For Each ArticleCategoryID As Integer In e.Items
                    ArticleCategoryListInfo.DeleteThis(ArticleId, ArticleCategoryID)
                Next
            End If
            ' refresh cache
            ModuleController.SynchronizeModule(Me.ModuleId)

            ' Redirect back to the portal home page
            Response.Redirect(EditUrl("ArticleID", ArticleID, "editcategory"), True)
        End Sub
#End Region

 


        Public ReadOnly Property ArticleID() As Integer
            Get
                If Not (Request.QueryString("ArticleId") Is Nothing) Then
                    Integer.TryParse(Request.QueryString("ArticleId"), _ArticleId)
                    Return _ArticleId
                Else
                    Return Common.Utilities.Null.NullInteger
                End If
            End Get
        End Property

    End Class

End Namespace