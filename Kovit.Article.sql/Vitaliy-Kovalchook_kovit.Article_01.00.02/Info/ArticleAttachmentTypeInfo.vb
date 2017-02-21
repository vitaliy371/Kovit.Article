Imports System
Imports Kovit.kovitArticle.Data

Namespace Kovit.kovitArticle.Data

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleAttachmentTypeInfo Class the business object representing a single
	'''		ArticleAttachmentType object, as used by the Data module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
	<Serializable()> _
	Public Class ArticleAttachmentTypeInfo 
	
#Region " Private fields "
		
		Private _articleAttachmentTypeCode As String
		Private _articleAttachmentTypeName As String
		
#End Region
		
#Region " Constructors "


        Public Const FILE As String = "FILE"
        Public Const IMAGE As String = "IMAGE"
        Public Const VIDEO As String = "VIDEO"
        Public Const AUDIO As String = "AUDIO"
        Public Const FLASH As String = "FLASH"



		Public Sub New()
			' default object initialization
			Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
			_articleAttachmentTypeCode = ""
			_articleAttachmentTypeName = ""

			
		end sub
	
		Public Sub New(articleAttachmentTypeCode As String, articleAttachmentTypeName As String)
			_articleAttachmentTypeCode = articleAttachmentTypeCode
			_articleAttachmentTypeName = articleAttachmentTypeName
		End Sub
		
#End Region

#Region " Properties "

		Public Property ArticleAttachmentTypeCode() As String
			Get	
				Return _articleAttachmentTypeCode
			End Get
			Set(ByVal Value As String)
				_articleAttachmentTypeCode = Value
			End Set
		End Property

		Public Property ArticleAttachmentTypeName() As String
			Get	
				Return _articleAttachmentTypeName
			End Get
			Set(ByVal Value As String)
				_articleAttachmentTypeName = Value
			End Set
		End Property

#End Region

#Region "ArticleAttachmentType Data Access"
 
     Public Shared Function AddThis(ByVal ArticleAttachmentType As ArticleAttachmentTypeInfo) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentTypeAdd", articleAttachmentType.ArticleAttachmentTypeCode, articleAttachmentType.ArticleAttachmentTypeName), Integer)
        End Function

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAttachmentTypeAdd", MyClass.ArticleAttachmentTypeCode, MyClass.ArticleAttachmentTypeName), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal ArticleAttachmentType As ArticleAttachmentTypeInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentTypeDelete", ArticleAttachmentType.ArticleAttachmentTypeCode)
        End Sub

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentTypeDelete", MyClass.ArticleAttachmentTypeCode)
        End Sub

        Public Shared Sub UpdateThis(ByVal ArticleAttachmentType As ArticleAttachmentTypeInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentTypeUpdate", articleAttachmentType.ArticleAttachmentTypeCode, articleAttachmentType.ArticleAttachmentTypeName)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAttachmentTypeUpdate", MyClass.ArticleAttachmentTypeCode, MyClass.ArticleAttachmentTypeName)
        End Sub

        Public Shared Function GetThis(ByVal ArticleAttachmentTypeID As Integer) As ArticleAttachmentTypeInfo
            Return AbstractController.GetObject(GetType(ArticleAttachmentTypeInfo), String.Empty, "ArticleAttachmentTypeGet", ArticleAttachmentTypeID.ToString())
        End Function

        Public Shared Function GetArticleAttachmentTypeList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAttachmentTypeInfo), String.Empty, "ArticleAttachmentTypeGetAll")
        End Function
 

#End Region
	End Class
	
End Namespace
