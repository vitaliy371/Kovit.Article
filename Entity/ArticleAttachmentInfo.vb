Imports System


Imports Kovit.Article.Data

Namespace Entity
    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleAttachmentInfo Class the business object representing a single
    '''		ArticleAttachment object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleAttachmentInfo
#Region " Private fields "

        Private _articleAttachmentID As Integer
        Private _articleAttachmentTypeCode As String
        Private _fileId As Integer
        Private _title As String
        Private _sortOrder As Integer
        Private _articleID As Integer

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleAttachmentTypeCode = ""
            _fileId = 0
            _title = ""
            _sortOrder = (65535)
            _articleID = 0


        End Sub

        Public Sub New(ByVal articleAttachmentTypeCode As String, ByVal fileId As Integer, ByVal title As String, ByVal sortOrder As Integer, ByVal articleID As Integer)
            _articleAttachmentTypeCode = articleAttachmentTypeCode
            _fileId = fileId
            _title = title
            _sortOrder = sortOrder
            _articleID = articleID
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleAttachmentID() As Integer
            Get
                Return _articleAttachmentID
            End Get
            Set(ByVal Value As Integer)
                _articleAttachmentID = Value
            End Set
        End Property

        Public Property ArticleAttachmentTypeCode() As String
            Get
                Return _articleAttachmentTypeCode
            End Get
            Set(ByVal Value As String)
                _articleAttachmentTypeCode = Value
            End Set
        End Property

        Public Property FileId() As Integer
            Get
                Return _fileId
            End Get
            Set(ByVal Value As Integer)
                _fileId = Value
            End Set
        End Property

        Public Property Title() As String
            Get
                Return _title
            End Get
            Set(ByVal Value As String)
                _title = Value
            End Set
        End Property

        Public Property SortOrder() As Integer
            Get
                Return _sortOrder
            End Get
            Set(ByVal Value As Integer)
                _sortOrder = Value
            End Set
        End Property

        Public Property ArticleID() As Integer
            Get
                Return _articleID
            End Get
            Set(ByVal Value As Integer)
                _articleID = Value
            End Set
        End Property

#End Region

#Region "ArticleAttachment Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentAdd", String.Empty, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.Title, MyClass.SortOrder, MyClass.ArticleID), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentAdd", ErrorMessage, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.Title, MyClass.SortOrder, MyClass.ArticleID), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDelete", String.Empty, MyClass.ArticleAttachmentID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleAttachmentID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDelete", String.Empty, ArticleAttachmentID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentUpdate", ErrorMessage, MyClass.ArticleAttachmentID, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.Title, MyClass.SortOrder, MyClass.ArticleID)
        End Sub

        Public Shared Function GetThis(ByVal ArticleAttachmentID As Integer) As ArticleAttachmentInfo
            Return AbstractController.GetObject(GetType(ArticleAttachmentInfo), "ArticleAttachmentGet", String.Empty, ArticleAttachmentID.ToString())
        End Function

        Public Shared Function GetArticleAttachmentList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAttachmentInfo), "ArticleAttachmentGetAll", String.Empty)
        End Function

        '=================================== HAND MADE

        Public Shared Function GetArticleAttachmentImageList(ByRef ErrorMessage As String, ByVal PortalID As Integer, ByVal ArticleID As Integer, ByVal ArticleAttachmentTypeCode As String) As ArrayList
            Return AbstractController.GetObjectList(GetType(DotNetNuke.Services.FileSystem.FileInfo), "ArticleAttachmentGetAllByType", ErrorMessage, PortalID, ArticleID, ArticleAttachmentTypeCode)
        End Function
 
        Public Shared Sub GetArticleAttachmentImageList(ByRef ds As DataSet, ByVal PortalID As Integer, ByVal ArticleID As Integer, ByVal ArticleAttachmentTypeCode As String)
            AbstractController.LoadDataSet(ds, "ArticleAttachmentGetAllByType", String.Empty, PortalID, ArticleID, ArticleAttachmentTypeCode)
        End Sub


        Public Shared Sub GetArticleAttachmentImageListNoCache(ByRef ds As DataSet, ByVal PortalID As Integer, ByVal ArticleID As Integer, ByVal ArticleAttachmentTypeCode As String)
            AbstractController.LoadDataSet(False, ds, "ArticleAttachmentGetAllByType", String.Empty, PortalID, ArticleID, ArticleAttachmentTypeCode)
        End Sub


        Public Shared Sub DeleteByFileID(ByRef ErrorMessage As String, ByVal FileID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDeleteByFileID", ErrorMessage, FileID.ToString())
        End Sub

#End Region
    End Class

End Namespace
