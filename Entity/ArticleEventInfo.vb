Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleEventInfo Class the business object representing a single
    '''		ArticleEvent object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleEventInfo

#Region " Private fields "

        Private _articleEventID As Integer
        Private _articleID As Integer
        Private _title As String
        Private _description As String
        Private _startDate As DateTime
        Private _endDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleID = 0
            _title = ""
            _description = ""
            _startDate = Today() & " " & TimeOfDay()
            _endDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal articleID As Integer, ByVal title As String, ByVal description As String, ByVal startDate As DateTime, ByVal endDate As DateTime)
            _articleID = articleID
            _title = title
            _description = description
            _startDate = startDate
            _endDate = endDate
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleEventID() As Integer
            Get
                Return _articleEventID
            End Get
            Set(ByVal Value As Integer)
                _articleEventID = Value
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

        Public Property StartDate() As DateTime
            Get
                Return _startDate
            End Get
            Set(ByVal Value As DateTime)
                _startDate = Value
            End Set
        End Property

        Public Property EndDate() As DateTime
            Get
                Return _endDate
            End Get
            Set(ByVal Value As DateTime)
                _endDate = Value
            End Set
        End Property

#End Region

#Region "ArticleEvent Data Access"

        Public Shared Function AddThis(ByVal ArticleEvent As ArticleEventInfo) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleEventAdd", String.Empty, ArticleEvent.ArticleID, ArticleEvent.Title, ArticleEvent.Description, ArticleEvent.StartDate, ArticleEvent.EndDate), Integer)
        End Function

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleEventAdd", String.Empty, MyClass.ArticleID, MyClass.Title, MyClass.Description, MyClass.StartDate, MyClass.EndDate), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal ArticleEvent As ArticleEventInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleEventDelete", String.Empty, ArticleEvent.ArticleEventID.ToString())
        End Sub

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleEventDelete", String.Empty, MyClass.ArticleEventID)
        End Sub

        Public Shared Sub UpdateThis(ByVal ArticleEvent As ArticleEventInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleEventUpdate", String.Empty, ArticleEvent.ArticleEventID, ArticleEvent.ArticleID, ArticleEvent.Title, ArticleEvent.Description, ArticleEvent.StartDate, ArticleEvent.EndDate)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleEventUpdate", String.Empty, MyClass.ArticleEventID, MyClass.ArticleID, MyClass.Title, MyClass.Description, MyClass.StartDate, MyClass.EndDate)
        End Sub

        Public Shared Function GetThis(ByVal ArticleEventID As Integer) As ArticleEventInfo
            Return AbstractController.GetObject(GetType(ArticleEventInfo), "ArticleEventGet", String.Empty, ArticleEventID.ToString())
        End Function

        Public Shared Function GetArticleEventList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleEventInfo), "ArticleEventGetAll", String.Empty)
        End Function

        Public Shared Function GetArticleEventList(ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleEventInfo), "ArticleEventGetAllByArticle", String.Empty, ArticleID)
        End Function


        Public Shared Function GetArticleEventListByPortal(ByVal PortalID As Integer, ByVal LanguageID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleEventInfo), "ArticleEventGetAllByPortal", String.Empty, PortalID, LanguageID)
        End Function




#End Region
    End Class

End Namespace
