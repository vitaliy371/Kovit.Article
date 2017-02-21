Imports System
Imports Kovit.kovitArticle.Data

Namespace Kovit.kovitArticle.Data

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
		Private _sortOrder As Integer
		Private _articleID As Integer
		
#End Region
		
#Region " Constructors "
		
		Public Sub New()
			' default object initialization
			Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
			_articleAttachmentTypeCode = ""
			_fileId = 0
			_sortOrder = (65535)
			_articleID = 0

			
		end sub
	
		Public Sub New(articleAttachmentTypeCode As String, fileId As Integer, sortOrder As Integer, articleID As Integer)
			_articleAttachmentTypeCode = articleAttachmentTypeCode
			_fileId = fileId
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
 
        Public Function AddThis(ByVal ArticleAttachment As ArticleAttachmentInfo) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentAdd", String.Empty, ArticleAttachment.ArticleAttachmentTypeCode, ArticleAttachment.FileId, ArticleAttachment.SortOrder, ArticleAttachment.ArticleID), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentAdd", ErrorMessage, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.SortOrder, MyClass.ArticleID), Integer)
        End Function
 
        Public Shared Sub DeleteThis(ByRef ErrorMessage As String, ByVal ArticleAttachmentID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDelete", ArticleAttachmentID.ToString())
        End Sub
        Public Sub DeleteThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDelete", ErrorMessage, MyClass.ArticleAttachmentID)
        End Sub

        Public Shared Sub DeleteByFileID(ByRef ErrorMessage As String, ByVal FileID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentDeleteByFileID", ErrorMessage, FileID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentUpdate", ErrorMessage, MyClass.ArticleAttachmentID, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.SortOrder, MyClass.ArticleID)
        End Sub
        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentUpdate", String.Empty, MyClass.ArticleAttachmentID, MyClass.ArticleAttachmentTypeCode, MyClass.FileId, MyClass.SortOrder, MyClass.ArticleID)
        End Sub

        Public Shared Function GetThis(ByRef ErrorMessage As String, ByVal ArticleAttachmentID As Integer) As ArticleAttachmentInfo
            Return AbstractController.GetObject(GetType(ArticleAttachmentInfo), "ArticleAttachmentGet", ErrorMessage, ArticleAttachmentID.ToString())
        End Function


        Public Shared Function GetThis(ByVal ArticleAttachmentID As Integer) As ArticleAttachmentInfo
            Return AbstractController.GetObject(GetType(ArticleAttachmentInfo), "ArticleAttachmentGet", String.Empty, ArticleAttachmentID.ToString())
        End Function

        Public Shared Function GetArticleAttachmentList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAttachmentInfo), "ArticleAttachmentGetAll", String.Empty)
        End Function

        Public Shared Function GetArticleAttachmentList(ByRef ErrorMessage As String) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAttachmentInfo), "ArticleAttachmentGetAll", ErrorMessage)
        End Function

        Public Shared Function GetArticleAttachmentImageList(ByRef ErrorMessage As String, ByVal PortalID As Integer, ByVal ArticleID As Integer, ByVal ArticleAttachmentTypeCode As String) As ArrayList
            Return AbstractController.GetObjectList(GetType(DotNetNuke.Services.FileSystem.FileInfo), "ArticleAttachmentGetAllByType", ErrorMessage, PortalID, ArticleID, ArticleAttachmentTypeCode)
        End Function

        Public Shared Function GetArticleAttachmentImageList(ByVal PortalID As Integer, ByVal ArticleID As Integer, ByVal ArticleAttachmentTypeCode As String) As ArrayList
            Return AbstractController.GetObjectList(GetType(DotNetNuke.Services.FileSystem.FileInfo), "ArticleAttachmentGetAllByType", String.Empty, PortalID, ArticleID, ArticleAttachmentTypeCode)
        End Function
#End Region
	End Class
	
End Namespace
