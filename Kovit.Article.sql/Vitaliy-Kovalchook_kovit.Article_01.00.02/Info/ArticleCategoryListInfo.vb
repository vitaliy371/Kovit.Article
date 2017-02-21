Imports System
Imports Kovit.kovitArticle.Data

Namespace Kovit.kovitArticle.Data

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleCategoryListInfo Class the business object representing a single
	'''		ArticleCategoryList object, as used by the Data module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
	<Serializable()> _
	Public Class ArticleCategoryListInfo 
	
#Region " Private fields "
		
		Private _articleCategoryListID As Integer
		Private _articleID As Integer
		Private _articleCategoryID As Integer
		
#End Region
		
#Region " Constructors "
		
		Public Sub New()
			' default object initialization
			Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
			_articleID = 0
			_articleCategoryID = 0

			
		end sub
	
		Public Sub New(articleID As Integer, articleCategoryID As Integer)
			_articleID = articleID
			_articleCategoryID = articleCategoryID
		End Sub
		
#End Region

#Region " Properties "

		Public Property ArticleCategoryListID() As Integer
			Get	
				Return _articleCategoryListID
			End Get
			Set(ByVal Value As Integer)
				_articleCategoryListID = Value
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

		Public Property ArticleCategoryID() As Integer
			Get	
				Return _articleCategoryID
			End Get
			Set(ByVal Value As Integer)
				_articleCategoryID = Value
			End Set
		End Property

#End Region

#Region "ArticleCategoryList Data Access"
  
        Public Shared Function AddThis(ByVal ArticleID As Integer, ByVal ArticleCategoryID As Integer) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategoryListAdd", String.Empty, ArticleID, ArticleCategoryID), Integer)
        End Function


        Public Shared Function AddThis(ByRef ErrorMessage As String, ByVal ArticleID As Integer, ByVal ArticleCategoryID As Integer) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategoryListAdd", ErrorMessage, ArticleID, ArticleCategoryID), Integer)
        End Function
        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategoryListAdd", ErrorMessage, MyClass.ArticleID, MyClass.ArticleCategoryID), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal ArticleCategoryList As ArticleCategoryListInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryListDelete", ArticleCategoryList.ArticleCategoryListID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleID As Integer, ByVal ArticleCategoryID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryListDeleteByArticleCategory", ArticleID, ArticleCategoryID)
        End Sub
        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryListDelete", MyClass.ArticleCategoryListID)
        End Sub

        Public Shared Sub UpdateThis(ByVal ArticleCategoryList As ArticleCategoryListInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryListUpdate", articleCategoryList.ArticleCategoryListID, articleCategoryList.ArticleID, articleCategoryList.ArticleCategoryID)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryListUpdate", MyClass.ArticleCategoryListID, MyClass.ArticleID, MyClass.ArticleCategoryID)
        End Sub

        Public Shared Function GetThis(ByVal ArticleCategoryListID As Integer) As ArticleCategoryListInfo
            Return AbstractController.GetObject(GetType(ArticleCategoryListInfo), "ArticleCategoryListGet", String.Empty, ArticleCategoryListID.ToString())
        End Function

        Public Shared Function GetArticleCategoryListList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryListInfo), "ArticleCategoryListGetAll", String.Empty)
        End Function
 

#End Region
	End Class
	
End Namespace
