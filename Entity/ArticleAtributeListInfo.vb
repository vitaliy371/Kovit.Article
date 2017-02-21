Imports System 
Imports Kovit.Article.Data


Namespace Entity

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleAtributeListInfo Class the business object representing a single
	'''		ArticleAtributeList object, as used by the Entity module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	16.07.2012 6:05:38	Code file automatically generated from 1gb_kovit_dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
	
	Public Class ArticleAtributeListInfo 
	
#Region " Private fields "
		
		Private _articleAtributeListID As Integer
		Private _articleAtributeID As Integer
		Private _articleID As Integer
		Private _value As string
		
#End Region
		
#Region " Constructors "
		
		Public Sub New()
			' default object initialization
			Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
			_articleAtributeID = 0
			_articleID = 0
			_value = ""

			
		end sub
	
		Public Sub New(articleAtributeID As Integer, articleID As Integer, value As string)
			_articleAtributeID = articleAtributeID
			_articleID = articleID
			_value = value
		End Sub
		
#End Region

#Region " Properties "

		Public Property ArticleAtributeListID() As Integer
			Get	
				Return _articleAtributeListID
			End Get
			Set(ByVal Value As Integer)
				_articleAtributeListID = Value
			End Set
		End Property

		Public Property ArticleAtributeID() As Integer
			Get	
				Return _articleAtributeID
			End Get
			Set(ByVal Value As Integer)
				_articleAtributeID = Value
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

		Public Property Value() As string
			Get	
				Return _value
			End Get
			Set(ByVal Value As string)
				_value = Value
			End Set
		End Property

#End Region

#Region "ArticleAtributeList Data Access"
 
        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAtributeListAdd",String.Empty, MyClass.ArticleAtributeID, MyClass.ArticleID, MyClass.Value), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAtributeListAdd",ErrorMessage, MyClass.ArticleAtributeID, MyClass.ArticleID, MyClass.Value), Integer)
        End Function
		
		Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeListDelete", String.Empty, MyClass.ArticleAtributeListID.ToString())
        End Sub
		
        Public Shared Sub DeleteThis(ByVal ArticleAtributeListID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeListDelete", String.Empty, ArticleAtributeListID.ToString())
        End Sub 

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeListUpdate",ErrorMessage, MyClass.ArticleAtributeListID, MyClass.ArticleAtributeID, MyClass.ArticleID, MyClass.Value)
        End Sub

        Public Shared Function GetThis(ByVal ArticleAtributeListID As Integer) As ArticleAtributeListInfo
            Return AbstractController.GetObject(GetType(ArticleAtributeListInfo), "ArticleAtributeListGet", String.Empty, ArticleAtributeListID.ToString())
        End Function

        Public Shared Function GetArticleAtributeListList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAtributeListInfo), "ArticleAtributeListGetAll", String.Empty)
        End Function		
		
        Public Shared Sub GetArticleAtributeListList(ByRef ds As DataSet)
			AbstractController.LoadDataSet(ds, "ArticleAtributeListGetAll", String.Empty)            
        End Sub		

        Public Shared Sub GetArticleAtributeListSearch(ByRef ds As DataSet, ByRef spParameters As Object())
			AbstractController.LoadDataSet(ds, "ArticleAtributeListSearch", String.Empty, spParameters)            
        End Sub
			
			
		Public Shared Function GetArticleAtributeListListByArticleAtribute(ArticleAtributeID as Integer) As ArrayList
			Return AbstractController.GetObjectList(GetType(ArticleAtributeListInfo), "ArticleAtributeListGetAllByArticleAtribute", String.Empty, ArticleAtributeID)
		End Function																		
		
		Public Shared Sub GetArticleAtributeListListByArticleAtribute(ByRef ds As DataSet,ArticleAtributeID as Integer)
			AbstractController.LoadDataSet(ds, "ArticleAtributeListGetAllByArticleAtribute", String.Empty, ArticleAtributeID)            
		End Sub																	
			
		Public Shared Function GetArticleAtributeListListByArticle(ArticleID as Integer) As ArrayList
			Return AbstractController.GetObjectList(GetType(ArticleAtributeListInfo), "ArticleAtributeListGetAllByArticle", String.Empty, ArticleID)
		End Function																		
		
		Public Shared Sub GetArticleAtributeListListByArticle(ByRef ds As DataSet,ArticleID as Integer)
			AbstractController.LoadDataSet(ds, "ArticleAtributeListGetAllByArticle", String.Empty, ArticleID)            
		End Sub																

        '-------------------------

        Public Shared Sub GetArticleAtributeListValues(ByRef ds As DataSet, ByVal ArticleAtributeID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleAtributeListGetValues", String.Empty, ArticleAtributeID)
        End Sub

 



#End Region
	End Class
	
End Namespace
