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
    Partial Class kovitArticleEventEdit
        Inherits Entities.Modules.PortalModuleBase


#Region "Private Members"

        Public ArticleId As Integer = Common.Utilities.Null.NullInteger

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
                    Dim Al As ArrayList = ArticleEventInfo.GetArticleEventList(ArticleId)
                    rptEvents.DataSource = Al
                    rptEvents.DataBind()
                End If

                lnkEdit.NavigateUrl = EditUrl("ArticleID", ArticleId, "edit")
                lnkEditCategory.NavigateUrl = EditUrl("ArticleID", ArticleId, "editcategory")
                lnkEditFiles.NavigateUrl = EditUrl("ArticleID", ArticleId, "editfiles")

                cmdStartCal.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(tbStartDate)
                cmdEndCal.NavigateUrl = DotNetNuke.Common.Utilities.Calendar.InvokePopupCal(tbEndDate)

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


        Private Sub cmdAdd_Click(ByVal sender As Object, ByVal e As EventArgs) Handles cmdAdd.Click
            Try


                Dim objArticleEventInfo As ArticleEventInfo = New ArticleEventInfo

                'objbfseArticle.ModuleId = ModuleId
                objArticleEventInfo.ArticleID = ArticleId

                Date.TryParse(tbStartDate.Text, objArticleEventInfo.StartDate)
                Date.TryParse(tbEndDate.Text, objArticleEventInfo.EndDate)
                objArticleEventInfo.Title = tbTitle.Text
                objArticleEventInfo.Description = tbDescription.Text
                
                'objArticleEventInfo.LastModifiedByUserID = Me.UserId
                'objArticleEventInfo.LastModifiedOnDate = Today()
 
                'ArticleId = 
                objArticleEventInfo.AddThis()
                ' refresh cache
                ModuleController.SynchronizeModule(Me.ModuleId)
                Response.Redirect(EditUrl("ArticleID", ArticleId, "editevents"), True)
            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
        End Sub

#End Region

 
    End Class

End Namespace