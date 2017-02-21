Imports System 
Imports Kovit.Article.Data


Namespace Entity

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleAtributeInfo Class the business object representing a single
	'''		ArticleAtribute object, as used by the Entity module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	16.07.2012 6:05:38	Code file automatically generated from 1gb_kovit_dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
	
    Public Class ArticleAtributeInfo

#Region " Private fields "

        Private _articleAtributeID As Integer
        Private _portalID As Integer
        Private _articleAtributeName As String
        Private _sortOrder As Integer
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _useSearch As Boolean
        Private _languageID As Integer

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _portalID = 0
            _articleAtributeName = ""
            _sortOrder = (65535)
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _useSearch = (0)
            _languageID = 0


        End Sub

        Public Sub New(ByVal portalID As Integer, ByVal articleAtributeName As String, ByVal sortOrder As Integer, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal useSearch As Boolean, ByVal languageID As Integer)
            _portalID = portalID
            _articleAtributeName = articleAtributeName
            _sortOrder = sortOrder
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _useSearch = useSearch
            _languageID = languageID
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleAtributeID() As Integer
            Get
                Return _articleAtributeID
            End Get
            Set(ByVal Value As Integer)
                _articleAtributeID = Value
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

        Public Property ArticleAtributeName() As String
            Get
                Return _articleAtributeName
            End Get
            Set(ByVal Value As String)
                _articleAtributeName = Value
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

        Public Property UseSearch() As Boolean
            Get
                Return _useSearch
            End Get
            Set(ByVal Value As Boolean)
                _useSearch = Value
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

#End Region

#Region "ArticleAtribute Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAtributeAdd", String.Empty, MyClass.PortalID, MyClass.ArticleAtributeName, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.UseSearch, MyClass.LanguageID), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAtributeAdd", ErrorMessage, MyClass.PortalID, MyClass.ArticleAtributeName, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.UseSearch, MyClass.LanguageID), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeDelete", String.Empty, MyClass.ArticleAtributeID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleAtributeID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeDelete", String.Empty, ArticleAtributeID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleAtributeUpdate", ErrorMessage, MyClass.ArticleAtributeID, MyClass.PortalID, MyClass.ArticleAtributeName, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.UseSearch, MyClass.LanguageID)
        End Sub

        Public Shared Function GetThis(ByVal ArticleAtributeID As Integer) As ArticleAtributeInfo
            Return AbstractController.GetObject(GetType(ArticleAtributeInfo), "ArticleAtributeGet", String.Empty, ArticleAtributeID.ToString())
        End Function

        Public Shared Function GetArticleAtributeList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAtributeInfo), "ArticleAtributeGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleAtributeList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleAtributeGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleAtributeSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleAtributeSearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleAtributeListByPortal(ByVal PortalID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAtributeInfo), "ArticleAtributeGetAllByPortal", String.Empty, PortalID)
        End Function

        Public Shared Sub GetArticleAtributeListByPortal(ByRef ds As DataSet, ByVal PortalID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleAtributeGetAllByPortal", String.Empty, PortalID)
        End Sub

        Public Shared Function GetArticleAtributeListByLanguage(ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAtributeInfo), "ArticleAtributeGetAllByLanguage", String.Empty, LanguageID)
        End Function

        Public Shared Sub GetArticleAtributeListByLanguage(ByRef ds As DataSet, ByVal LanguageID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleAtributeGetAllByLanguage", String.Empty, LanguageID)
        End Sub

        Public Shared Sub GetArticleAtributeListByPortalLanguage(ByRef ds As DataSet, ByVal PortalID As Integer, ByVal LanguageID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleAtributeGetAllByPortalLanguage", String.Empty, PortalID, LanguageID)
        End Sub

        Public Shared Sub GetArticleAtributeListForSearch(ByRef ds As DataSet, ByVal PortalID As Integer, ByVal LanguageID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleAtributeGetAllForSearch", String.Empty, PortalID, LanguageID)
        End Sub

        Public Shared Function GetArticleAtributeListForSearch(ByVal PortalID As Integer, ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleAtributeInfo), "ArticleAtributeGetAllForSearch", String.Empty, PortalID, LanguageID)
        End Function


#End Region

    End Class
	
End Namespace
