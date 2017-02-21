Imports System
Imports Kovit.kovitArticle.Data

Namespace Kovit.kovitArticle.Data

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleInfo Class the business object representing a single
	'''		Article object, as used by the Data module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
	<Serializable()> _
	Public Class ArticleInfo 
	
#Region " Private fields "
		
		Private _articleID As Integer
		Private _languageID As Integer
		Private _portalID As Integer
		Private _publicationDate As DateTime
		Private _title As String
		Private _description As String
		Private _keyWord As String
		Private _articleURL As String
		Private _sortOrder As Integer
		Private _isHidden As Boolean
		Private _isFeatured As Boolean
		Private _articleHTML As String
		Private _createdByUserID As Integer
		Private _createdOnDate As DateTime
		Private _lastModifiedByUserID As Integer
		Private _lastModifiedOnDate As DateTime




#End Region
		
#Region " Constructors "
		
		Public Sub New()
			' default object initialization
			Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
			_languageID = 0
			_portalID = 0
			_publicationDate = Today() & " " & TimeOfDay()
			_title = ""
			_description = ""
			_keyWord = ""
			_articleURL = ""
			_sortOrder = (65535)
			_isHidden = (0)
			_isFeatured = (0)
			_articleHTML = ""
			_createdByUserID = 0
			_createdOnDate = Today() & " " & TimeOfDay()
			_lastModifiedByUserID = 0
			_lastModifiedOnDate = Today() & " " & TimeOfDay()

			
		end sub
	
		Public Sub New(languageID As Integer, portalID As Integer, publicationDate As DateTime, title As String, description As String, keyWord As String, articleURL As String, sortOrder As Integer, isHidden As Boolean, isFeatured As Boolean, articleHTML As String, createdByUserID As Integer, createdOnDate As DateTime, lastModifiedByUserID As Integer, lastModifiedOnDate As DateTime)
			_languageID = languageID
			_portalID = portalID
			_publicationDate = publicationDate
			_title = title
			_description = description
			_keyWord = keyWord
			_articleURL = articleURL
			_sortOrder = sortOrder
			_isHidden = isHidden
			_isFeatured = isFeatured
			_articleHTML = articleHTML
			_createdByUserID = createdByUserID
			_createdOnDate = createdOnDate
			_lastModifiedByUserID = lastModifiedByUserID
			_lastModifiedOnDate = lastModifiedOnDate
		End Sub
		
#End Region

#Region " Properties "

		Public Property ArticleID() As Integer
			Get	
				Return _articleID
			End Get
			Set(ByVal Value As Integer)
				_articleID = Value
			End Set
		End Property

		Public Property LanguageID() As Integer
			Get	
				Return _languageID
			End Get
			Set(ByVal Value As Integer)
				_languageID = Value
			End Set
		End Property

		Public Property PortalID() As Integer
			Get	
				Return _portalID
			End Get
			Set(ByVal Value As Integer)
				_portalID = Value
			End Set
		End Property

		Public Property PublicationDate() As DateTime
			Get	
				Return _publicationDate
			End Get
			Set(ByVal Value As DateTime)
				_publicationDate = Value
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

		Public Property Description() As String
			Get	
				Return _description
			End Get
			Set(ByVal Value As String)
				_description = Value
			End Set
		End Property

		Public Property KeyWord() As String
			Get	
				Return _keyWord
			End Get
			Set(ByVal Value As String)
				_keyWord = Value
			End Set
		End Property

		Public Property ArticleURL() As String
			Get	
				Return _articleURL
			End Get
			Set(ByVal Value As String)
				_articleURL = Value
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

		Public Property IsHidden() As Boolean
			Get	
				Return _isHidden
			End Get
			Set(ByVal Value As Boolean)
				_isHidden = Value
			End Set
		End Property

		Public Property IsFeatured() As Boolean
			Get	
				Return _isFeatured
			End Get
			Set(ByVal Value As Boolean)
				_isFeatured = Value
			End Set
		End Property

		Public Property ArticleHTML() As String
			Get	
				Return _articleHTML
			End Get
			Set(ByVal Value As String)
				_articleHTML = Value
			End Set
		End Property

		Public Property CreatedByUserID() As Integer
			Get	
				Return _createdByUserID
			End Get
			Set(ByVal Value As Integer)
				_createdByUserID = Value
			End Set
		End Property

		Public Property CreatedOnDate() As DateTime
			Get	
				Return _createdOnDate
			End Get
			Set(ByVal Value As DateTime)
				_createdOnDate = Value
			End Set
		End Property

		Public Property LastModifiedByUserID() As Integer
			Get	
				Return _lastModifiedByUserID
			End Get
			Set(ByVal Value As Integer)
				_lastModifiedByUserID = Value
			End Set
		End Property

		Public Property LastModifiedOnDate() As DateTime
			Get	
				Return _lastModifiedOnDate
			End Get
			Set(ByVal Value As DateTime)
				_lastModifiedOnDate = Value
			End Set
		End Property

#End Region

#Region "Article Data Access"
 


        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAdd", String.Empty, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAdd", ErrorMessage, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal Article As ArticleInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleDelete", String.Empty, Article.ArticleID.ToString())
        End Sub
        Public Shared Sub DeleteThis(ByVal ArticleID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleDelete", String.Empty, ArticleID.ToString())
        End Sub
        Public Sub DeleteThis(Optional ByRef strError As String = "")
            DataProvider.Instance().ExecuteNonQuery("ArticleDelete", strError, MyClass.ArticleID)
        End Sub

        Public Shared Sub UpdateThis(ByVal Article As ArticleInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleUpdate", String.Empty, Article.ArticleID, Article.LanguageID, Article.PortalID, Article.PublicationDate, Article.Title, Article.Description, Article.KeyWord, Article.ArticleURL, Article.SortOrder, Article.IsHidden, Article.IsFeatured, Article.ArticleHTML, Article.CreatedByUserID, Article.CreatedOnDate, Article.LastModifiedByUserID, Article.LastModifiedOnDate)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleUpdate", String.Empty, MyClass.ArticleID, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal ArticleID As Integer) As ArticleInfo
            Return AbstractController.GetObject(GetType(ArticleInfo), "ArticleGet", String.Empty, ArticleID.ToString())
        End Function

        Public Shared Function GetArticleList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleInfo), String.Empty, "ArticleGetAll")
        End Function
        Public Shared Sub SearchArticles(ByRef alist As ArrayList, ByRef ErrorMessage As String, ByRef spParameters As Object())
            'ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer
            AbstractController.GetObjectListWithOutput(alist, "ArticleSearch", String.Empty, GetType(ArticleInfo), spParameters)
        End Sub

#End Region
	End Class
	
End Namespace
