Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleCategoryInfo Class the business object representing a single
    '''		ArticleCategory object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	13.11.2009 4:44:53	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleCategoryInfo

#Region " Private fields "

        Private _articleCategoryID As Integer
        Private _parentCategoryID As Integer
        Private _tabID As Integer
        Private _languageID As Integer
        Private _portalID As Integer
        Private _title As String
        Private _description As String
        Private _keyWord As String
        Private _articleCategoryURL As String
        Private _sortOrder As Integer
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime
        Private _roleID As Integer
        Private _cssClass As String
        Private _iconImage As String
        Private _htmlDescription As String

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _parentCategoryID = 0
            _tabID = (41)
            _languageID = 0
            _portalID = 0
            _title = ""
            _description = ""
            _keyWord = ""
            _articleCategoryURL = ""
            _sortOrder = (65535)
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()
            _roleID = 0
            _cssClass = ""
            _iconImage = "\"
            _htmlDescription = ""


        End Sub

        Public Sub New(ByVal parentCategoryID As Integer, ByVal tabID As Integer, ByVal languageID As Integer, ByVal portalID As Integer, ByVal title As String, ByVal description As String, ByVal keyWord As String, ByVal articleCategoryURL As String, ByVal sortOrder As Integer, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime, ByVal roleID As Integer, ByVal cssClass As String, ByVal iconImage As String, ByVal htmlDescription As String)
            _parentCategoryID = parentCategoryID
            _tabID = tabID
            _languageID = languageID
            _portalID = portalID
            _title = title
            _description = description
            _keyWord = keyWord
            _articleCategoryURL = articleCategoryURL
            _sortOrder = sortOrder
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
            _roleID = roleID
            _cssClass = cssClass
            _iconImage = iconImage
            _htmlDescription = htmlDescription
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleCategoryID() As Integer
            Get
                Return _articleCategoryID
            End Get
            Set(ByVal Value As Integer)
                _articleCategoryID = Value
            End Set
        End Property

        Public Property ParentCategoryID() As Integer
            Get
                Return _parentCategoryID
            End Get
            Set(ByVal Value As Integer)
                _parentCategoryID = Value
            End Set
        End Property

        Public Property TabID() As Integer
            Get
                Return _tabID
            End Get
            Set(ByVal Value As Integer)
                _tabID = Value
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

        Public Property ArticleCategoryURL() As String
            Get
                Return _articleCategoryURL
            End Get
            Set(ByVal Value As String)
                _articleCategoryURL = Value
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

        Public Property RoleID() As Integer
            Get
                Return _roleID
            End Get
            Set(ByVal Value As Integer)
                _roleID = Value
            End Set
        End Property

        Public Property CssClass() As String
            Get
                Return _cssClass
            End Get
            Set(ByVal Value As String)
                _cssClass = Value
            End Set
        End Property

        Public Property IconImage() As String
            Get
                Return _iconImage
            End Get
            Set(ByVal Value As String)
                _iconImage = Value
            End Set
        End Property

        Public Property HtmlDescription() As String
            Get
                Return _htmlDescription
            End Get
            Set(ByVal Value As String)
                _htmlDescription = Value
            End Set
        End Property

#End Region

#Region "ArticleCategory Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategoryAdd", String.Empty, MyClass.ParentCategoryID, MyClass.TabID, MyClass.LanguageID, MyClass.PortalID, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleCategoryURL, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.RoleID, MyClass.CssClass, MyClass.IconImage, MyClass.HtmlDescription), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategoryAdd", ErrorMessage, MyClass.ParentCategoryID, MyClass.TabID, MyClass.LanguageID, MyClass.PortalID, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleCategoryURL, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.RoleID, MyClass.CssClass, MyClass.IconImage, MyClass.HtmlDescription), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryDelete", String.Empty, MyClass.ArticleCategoryID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleCategoryID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryDelete", String.Empty, ArticleCategoryID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryUpdate", ErrorMessage, MyClass.ArticleCategoryID, MyClass.ParentCategoryID, MyClass.TabID, MyClass.LanguageID, MyClass.PortalID, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleCategoryURL, MyClass.SortOrder, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.RoleID, MyClass.CssClass, MyClass.IconImage, MyClass.HtmlDescription)
        End Sub

        Public Shared Function GetThis(ByVal ArticleCategoryID As Integer) As ArticleCategoryInfo
            Return AbstractController.GetObject(GetType(ArticleCategoryInfo), "ArticleCategoryGet", String.Empty, ArticleCategoryID.ToString())
        End Function

        Public Shared Function GetArticleCategoryList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleCategoryList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleCategorySearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleCategorySearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleCategoryListByParentCategory(ByVal ParentCategoryID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByParentCategory", String.Empty, ParentCategoryID)
        End Function

        Public Shared Sub GetArticleCategoryListByParentCategory(ByRef ds As DataSet, ByVal ParentCategoryID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAllByParentCategory", String.Empty, ParentCategoryID)
        End Sub

        Public Shared Function GetArticleCategoryListByTab(ByVal TabID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByTab", String.Empty, TabID)
        End Function

        Public Shared Sub GetArticleCategoryListByTab(ByRef ds As DataSet, ByVal TabID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAllByTab", String.Empty, TabID)
        End Sub

 

        Public Shared Function GetArticleCategoryListByLanguage(ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByLanguage", String.Empty, LanguageID)
        End Function

        Public Shared Sub GetArticleCategoryListByLanguage(ByRef ds As DataSet, ByVal LanguageID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAllByLanguage", String.Empty, LanguageID)
        End Sub

        Public Shared Function GetArticleCategoryListByPortal(ByVal PortalID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByPortal", String.Empty, PortalID)
        End Function

        Public Shared Sub GetArticleCategoryListByPortal(ByRef ds As DataSet, ByVal PortalID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAllByPortal", String.Empty, PortalID)
        End Sub

        Public Shared Function GetArticleCategoryListByRole(ByVal RoleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByRole", String.Empty, RoleID)
        End Function

        Public Shared Sub GetArticleCategoryListByRole(ByRef ds As DataSet, ByVal RoleID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetAllByRole", String.Empty, RoleID)
        End Sub

        ' HANDMADE  ---------------------------------------------------------

        Public Shared Function GetArticleCategoryListByTab(ByVal TabID As Integer, ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByTab", String.Empty, TabID, LanguageID)
        End Function


        Public Shared Function GetArticleCategoryAssignedList(ByRef ErrorMessage As String, ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllAssigned", String.Empty, ArticleID)
        End Function


        Public Shared Function GetArticleCategoryAvailableList(ByRef ErrorMessage As String, ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllAvailable", String.Empty, ArticleID)
        End Function


        Public Shared Function GetArticleCategoryList(ByRef ErrorMessage As String, ByVal PortalID As Integer, ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByPortalLanguage", String.Empty, PortalID, LanguageID)
        End Function


        Public Shared Function GetArticleCategoryListByParent(ByRef ErrorMessage As String, ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal RootCategoryID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByParent", String.Empty, PortalID, LanguageID, RootCategoryID)
        End Function


        Public Shared Function GetArticleCategoryListByParentWithChild(ByRef ErrorMessage As String, ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal RootCategoryID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryGetAllByParentWithChild", String.Empty, PortalID, LanguageID, RootCategoryID)
        End Function


        Public Shared Function GetTargetTabList(ByRef ErrorMessage As String, ByVal PortalID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(DotNetNuke.Entities.Tabs.TabInfo), "ArticleCategoryGetTargetTabs", ErrorMessage, PortalID)
        End Function

        Public Shared Sub GetTargetTabList(ByRef ds As DataSet, ByRef ErrorMessage As String, ByVal PortalID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategoryGetTargetTabs", ErrorMessage, PortalID)
        End Sub


        Public Shared Function GetUpdtedFrom(ByRef ErrorMessage As String, ByVal fromDate As DateTime) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategoryInfo), "ArticleCategoryUpdtedFrom", String.Empty, fromDate)
        End Function

        Public Shared Sub CreateRootCategory()
            DataProvider.Instance().ExecuteNonQuery("ArticleCategoryCreateROOT", String.Empty)
        End Sub



#End Region
    End Class

End Namespace
