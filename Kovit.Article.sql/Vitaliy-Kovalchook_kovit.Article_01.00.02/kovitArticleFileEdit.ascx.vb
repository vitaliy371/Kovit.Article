Imports System.Collections.Generic
Imports DotNetNuke
Imports DotNetNuke.Entities.Modules
Imports DotNetNuke.Services.FileSystem
Imports Kovit.kovitArticle.Data
Imports System.Drawing
Imports System.Drawing.Imaging





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
    Partial Class kovitArticleFileEdit
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
            Dim ErrorMessage As String = String.Empty
            Try
                ' Determine ItemId of bfseArticle to Update
                If Not (Request.QueryString("ArticleId") Is Nothing) Then
                    ArticleId = Int32.Parse(Request.QueryString("ArticleId"))

                End If
                lnkEdit.NavigateUrl = EditUrl("ArticleID", ArticleId, "edit")
                lnkEditCategory.NavigateUrl = EditUrl("ArticleID", ArticleId, "editcategory")
                lnkEditEvents.NavigateUrl = EditUrl("ArticleID", ArticleId, "editevents")


                Dim fc As DotNetNuke.Services.FileSystem.FileController = New DotNetNuke.Services.FileSystem.FileController
                Dim arl As ArrayList = ArticleAttachmentInfo.GetArticleAttachmentImageList(PortalId, ArticleId, "")
                rptArticleFile.DataSource = arl
                rptArticleFile.DataBind()
                ' If this is the first visit to the page, bind the role data to the datalist
                If Page.IsPostBack = False Then



                    If Not Common.Utilities.Null.IsNull(ArticleId) Then
                        ' get content


                        'If Not objArticleInfo Is Nothing Then

                        'Else ' security violation attempt to access item not related to this Module
                        '    Response.Redirect(NavigateURL(), True)
                        'End If
                    Else

                        'ctlAudit.Visible = False
                    End If
                End If

            Catch exc As Exception    'Module failed to load
                ProcessModuleLoadException(Me, exc)
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub


        Protected Sub rptArticleFile_OnItemCommand(ByVal source As Object, ByVal e As RepeaterCommandEventArgs) Handles rptArticleFile.ItemCommand
            Dim ErrorMessage As String = String.Empty
            If e.CommandName = "Delete" Then
                Dim params() As String = e.CommandArgument.ToString().Split("|")
                Dim FolderId As Integer
                Dim FileId As Integer
                Integer.TryParse(params(1), FolderId)
                Integer.TryParse(params(2), FileId)
                ArticleAttachmentInfo.DeleteByFileID(ErrorMessage, FileId)
                Dim fc As DotNetNuke.Services.FileSystem.FileController = New DotNetNuke.Services.FileSystem.FileController()
                fc.DeleteFile(PortalId, params(0), FolderId, True)
                Response.Redirect(EditUrl("ArticleID", ArticleId, "editfiles"))
                'rptArticleComment.DataBind()
            End If
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub
        Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnUpload.Click
            Dim ErrorMessage As String = String.Empty


            If fileUpload.HasFile() Then
                Dim articlePath As String = PortalSettings.HomeDirectoryMapPath() & "kovitArticle\"

                If Not System.IO.Directory.Exists(articlePath) Then
                    System.IO.Directory.CreateDirectory(articlePath)
                End If

                Dim savedFileName As String = Core.Translitarate(fileUpload.FileName)

                savedFileName = savedFileName.Replace(" ", "-")
                savedFileName = savedFileName.Replace("---", "-")
                savedFileName = savedFileName.Replace("--", "-")
                savedFileName = Core.GetSafeFileName(savedFileName)
                ErrorMessage += Core.SaveFile(fileUpload, articlePath, savedFileName, savedFileName)
                Dim objFolderController As FolderController = New FolderController()
                Dim objFileController As FileController = New FileController()


                Dim objfolder As FolderInfo = objFolderController.GetFolder(PortalId, "kovitArticle/", True)
                If Not objfolder Is Nothing Then
                    Dim FileID As Integer
                    Dim objFile As FileInfo = New FileInfo()
                    objFile.FolderId = objfolder.FolderID
                    Dim objAttachment As New ArticleAttachmentInfo()
                    objAttachment.ArticleID = ArticleId
                    Select Case fileUpload.PostedFile.ContentType
                        'Case "image/bmp"
                        'Using thumbnail
                        '    Dim quantizer As New OctreeQuantizer(255, 8)
                        '    Using quantized As Bitmap = quantizer.Quantize(Bitmap)
                        '        Response.ContentType = "image/gif"
                        '        quantized.Save(Response.OutputStream, ImageFormat.Gif)
                        '    End Using
                        'End Using
                        Case "image/gif", "image/png", "image/jpg", "image/jpeg", "image/bmp"
                            FileID = objFileController.AddFile(PortalId, savedFileName, fileUpload.PostedFile.ContentType, fileUpload.PostedFile.ContentLength, 0, 0, fileUpload.PostedFile.ContentType, objfolder.FolderPath, objfolder.FolderID, True)
                            objAttachment.FileId = FileID
                            objAttachment.ArticleAttachmentTypeCode = "raw-image"
                            objAttachment.AddThis(ErrorMessage)

                            Using fs As New IO.FileStream(articlePath & savedFileName, IO.FileMode.Open)

                                Dim codecs() As ImageCodecInfo = ImageCodecInfo.GetImageEncoders()
                                For Each codec As ImageCodecInfo In codecs
                                    If codec.MimeType = fileUpload.PostedFile.ContentType Then
                                        Using BitMapFile As Image = System.Drawing.Image.FromStream(fs, True, False)
                                            If Not BitMapFile Is Nothing Then
                                                Dim sz As Size = Core.adaptProportionalSize(New Size(100, 100), BitMapFile.Size)
                                                DirectCast(BitMapFile.GetThumbnailImage(sz.Width, sz.Height, Nothing, IntPtr.Zero), Bitmap).Save(articlePath & "100x100-" & savedFileName)
                                            End If
                                        End Using
                                        Using BitMapFile = System.Drawing.Image.FromStream(fs, True, False)
                                            If Not BitMapFile Is Nothing Then
                                                Dim HighEncoderParameters As EncoderParameters = New EncoderParameters(1)
                                                HighEncoderParameters.Param(0) = New EncoderParameter(Encoder.Quality, 75L)
                                                Dim sz As Size = Core.adaptProportionalSize(New Size(800, 500), BitMapFile.Size)
                                                Using thumbnail As System.Drawing.Image = New Bitmap(sz.Width, sz.Height)
                                                    Using Graphic As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(thumbnail)
                                                        Graphic.DrawImage(BitMapFile, 0, 0, sz.Width, sz.Height)
                                                        'Graphic.DrawString(Request.Url.Authority, New Font("Arial", 10, FontStyle.Regular), Brushes.Black, 5, 5)
                                                        thumbnail.Save(articlePath & "800x500-" & savedFileName, codec, HighEncoderParameters)
                                                    End Using
                                                End Using
                                            End If
                                        End Using
                                        Exit For
                                    End If
                                Next
                            End Using
                        Case Else
                            FileID = objFileController.AddFile(PortalId, savedFileName, fileUpload.PostedFile.ContentType, fileUpload.PostedFile.ContentLength, 0, 0, fileUpload.PostedFile.ContentType, objfolder.FolderPath, objfolder.FolderID, True)
                            objAttachment.ArticleAttachmentTypeCode = "download"
                            objAttachment.FileId = FileID
                            objAttachment.AddThis(ErrorMessage)
                    End Select
                    objAttachment.ArticleAttachmentTypeCode = "raw-image"

                Else
                    ErrorMessage += "Folder kovitArticle/ not found in database"
                End If

            Else
                ErrorMessage += "No file selected"
            End If
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            Else
                Response.Redirect(EditUrl("ArticleID", ArticleId, "editfiles"))
            End If
        End Sub
#End Region



    End Class

End Namespace