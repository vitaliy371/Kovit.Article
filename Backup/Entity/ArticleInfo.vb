Imports System
Imports System.Collections.Generic
Imports DotNetNuke
Imports DotNetNuke.Services.Search
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleInfo Class the business object representing a single
    '''		Article object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	25.03.2010 13:00:29	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleInfo
        Implements DotNetNuke.Entities.Modules.ISearchable

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
        Private _allowComments As Boolean
        Private _showGalleryFirst As Boolean

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
            _allowComments = (1)
            _showGalleryFirst = (0)


        End Sub

        Public Sub New(ByVal languageID As Integer, ByVal portalID As Integer, ByVal publicationDate As DateTime, ByVal title As String, ByVal description As String, ByVal keyWord As String, ByVal articleURL As String, ByVal sortOrder As Integer, ByVal isHidden As Boolean, ByVal isFeatured As Boolean, ByVal articleHTML As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime, ByVal allowComments As Boolean, ByVal showGalleryFirst As Boolean)
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
            _allowComments = allowComments
            _showGalleryFirst = showGalleryFirst
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

        Public Property AllowComments() As Boolean
            Get
                Return _allowComments
            End Get
            Set(ByVal Value As Boolean)
                _allowComments = Value
            End Set
        End Property

        Public Property ShowGalleryFirst() As Boolean
            Get
                Return _showGalleryFirst
            End Get
            Set(ByVal Value As Boolean)
                _showGalleryFirst = Value
            End Set
        End Property

#End Region

#Region "Article Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAdd", String.Empty, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.AllowComments, MyClass.ShowGalleryFirst), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleAdd", ErrorMessage, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.AllowComments, MyClass.ShowGalleryFirst), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleDelete", String.Empty, MyClass.ArticleID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleDelete", String.Empty, ArticleID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleUpdate", ErrorMessage, MyClass.ArticleID, MyClass.LanguageID, MyClass.PortalID, MyClass.PublicationDate, MyClass.Title, MyClass.Description, MyClass.KeyWord, MyClass.ArticleURL, MyClass.SortOrder, MyClass.IsHidden, MyClass.IsFeatured, MyClass.ArticleHTML, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate, MyClass.AllowComments, MyClass.ShowGalleryFirst)
        End Sub

        Public Shared Function GetThis(ByVal ArticleID As Integer) As ArticleInfo
            Return AbstractController.GetObject(GetType(ArticleInfo), "ArticleGet", String.Empty, ArticleID.ToString())
        End Function

        Public Shared Function GetArticleList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleInfo), "ArticleGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleSearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleListByLanguage(ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleInfo), "ArticleGetAllByLanguage", String.Empty, LanguageID)
        End Function

        Public Shared Sub GetArticleListByLanguage(ByRef ds As DataSet, ByVal LanguageID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleGetAllByLanguage", String.Empty, LanguageID)
        End Sub

        Public Shared Function GetArticleListByPortal(ByVal PortalID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleInfo), "ArticleGetAllByPortal", String.Empty, PortalID)
        End Function

        Public Shared Sub GetArticleListByPortal(ByRef ds As DataSet, ByVal PortalID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleGetAllByPortal", String.Empty, PortalID)
        End Sub

        Public Shared Sub SearchArticles(ByRef alist As ArrayList, ByRef ErrorMessage As String, ByRef spParameters As Object())
            'ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer
            AbstractController.GetObjectListWithOutput(alist, "ArticleSearch", String.Empty, GetType(ArticleInfo), spParameters)
        End Sub





        Public Shared Sub SearchArticleWithAttributes(ByRef alist As ArrayList, ByRef ErrorMessage As String, ByRef spParameters As Object())
            'ByVal PortalID As Integer, ByVal LanguageID As Integer, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer
            AbstractController.GetObjectListWithOutput(alist, "ArticleAtributeSearch", String.Empty, GetType(ArticleInfo), spParameters)
        End Sub



        Public Shared Function GetArticleTargetTab(ByRef ErrorMessage As String, ByVal ArticleID As Integer) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleGetTargetTab", ErrorMessage, ArticleID), Integer)
        End Function



        Public Shared Sub GetArticleListLatestExcept4Category(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleGetLatestExcept4Category", String.Empty, spParameters)
        End Sub




        Public Shared Function GetImage(ByVal ArticleID As Integer, ByVal PortalID As Integer, ByVal OnlyFirst As Boolean) As String
            Dim al As ArrayList = ArticleAttachmentInfo.GetArticleAttachmentImageList("", PortalID, ArticleID, "raw-image")
            If al.Count > 0 Then
                Dim result As String = String.Empty
                Dim counter As Integer = 1
                For Each fi As DotNetNuke.Services.FileSystem.FileInfo In al

                    If OnlyFirst And counter = 2 Then
                        Exit For
                    Else
                        result &= "<span class=""preview"">"
                        result &= "<img  style=""vertical-align: middle;"" alt="""" src=""Portals/" & PortalID & "/KovitArticle/100x100-" & fi.FileName & """/>"
                        result &= "</span>"
                        If counter = 5 Then Exit For 'top 5 in sql
                        counter += 1
                    End If

                Next

                Return result
            Else
                Return ""
            End If
        End Function

#End Region

        'Searchable interface
        Public Function GetSearchItems(ByVal ModInfo As Entities.Modules.ModuleInfo) _
        As Services.Search.SearchItemInfoCollection Implements Entities.Modules.ISearchable.GetSearchItems
            Dim ErrorMessage As String = String.Empty

           



            Dim tc As New Entities.Tabs.TabController
            Dim objTab As DotNetNuke.Entities.Tabs.TabInfo = tc.GetTab(ModInfo.TabID, ModInfo.PortalID, True)
            Dim SearchItemCollection As New SearchItemInfoCollection

            Dim SortMode As Integer = 1

            Dim lc As New DotNetNuke.Services.Localization.LocaleController()
            Dim EnabledLocales As Dictionary(Of String, Services.Localization.Locale) = lc.GetLocales(ModInfo.PortalID)
            For Each objLocale As KeyValuePair(Of String, Services.Localization.Locale) In EnabledLocales

                Dim mPortalId As Integer
                Dim mLanguageID As Integer

                Integer.TryParse(ModInfo.PortalID, mPortalId)
                Integer.TryParse(TryCast(objLocale.Value, Services.Localization.Locale).LanguageId, mLanguageID)
                If mLanguageID = 0 Then mLanguageID = 1

                Dim alCategory As ArrayList = ArticleCategoryInfo.GetArticleCategoryListByTab(ModInfo.TabID, mLanguageID)
                If Not alCategory Is Nothing AndAlso alCategory.Count > 0 Then
                    Dim objCategory As ArticleCategoryInfo = TryCast(alCategory(0), ArticleCategoryInfo)
                    If Not objCategory Is Nothing AndAlso objCategory.ArticleCategoryID <> 0 Then
                        'Dim URL As String = URLManager.ArticleCategoryLink(Me.Page, TabId, PortalId, objCategory.ArticleCategoryID, objCategory.LanguageID, objCategory.ArticleCategoryURL, 1)
                        'ByVal PortalID As Integer, ByVal LanguageID As Integer,  @CategoryID int, ByVal CurrentPage As Integer, ByVal ItemsPerPage As Integer, ByVal SortMode As Integer, OnlyFeatured, FromDate, ToDate, FreeText, @Total OUTPUT
                        Dim params As Object() = {mPortalId, mLanguageID, objCategory.ArticleCategoryID, 1, 1000, 1, 0, -1, -1, String.Empty, 0}
                        Dim Articles As New ArrayList()
                        ArticleInfo.SearchArticles(Articles, ErrorMessage, params)
                        For Each objArticle As ArticleInfo In Articles
                            Dim SearchItem As SearchItemInfo
                            Dim guid As String = String.Format("{0}={1}", objArticle.ArticleID, objArticle.ArticleURL)
                            Dim Text As String = objArticle.Title & " " & objArticle.Description & " " & Core.HTML2Text(objArticle.ArticleHTML)
                            SearchItem = New SearchItemInfo _
                            (objArticle.Title, _
                            objArticle.Description, _
                            objArticle.CreatedByUserID, _
                            objArticle.CreatedOnDate, ModInfo.ModuleID, _
                            objArticle.ArticleID.ToString(), Text, guid)
                            SearchItemCollection.Add(SearchItem)
                        Next
                    End If
                End If
             
            Next
            Return SearchItemCollection
        End Function
        Public Shared Function ArticleLink(ByRef page As System.Web.UI.Page, ByVal TabID As Integer, ByVal ArticleID As Integer, ByVal LangaugeID As Integer, ByVal ArticleURL As String, ByVal PageNo As Integer) As String
            Return URLManager.ArticleLink(page, TabID, ArticleID, LangaugeID, 1)
        End Function
    End Class

End Namespace
