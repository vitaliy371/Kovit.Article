Imports System
Imports Kovit.Article.Data

Namespace Entity
    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleCommentInfo Class the business object representing a single
    '''		ArticleComment object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleCommentInfo

#Region " Private fields "

        Private _articleCommentID As Integer
        Private _articleID As Integer
        Private _articleCommentText As String
        Private _email As String
        Private _name As String
        Private _approved As Boolean
        Private _ipAddress As String
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleID = 0
            _articleCommentText = ""
            _email = ""
            _name = ""
            _approved = (0)
            _ipAddress = "0.0.0.0"
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal articleID As Integer, ByVal articleCommentText As String, ByVal email As String, ByVal name As String, ByVal approved As Boolean, ByVal ipAddress As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime)
            _articleID = articleID
            _articleCommentText = articleCommentText
            _email = email
            _name = name
            _approved = approved
            _ipAddress = ipAddress
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleCommentID() As Integer
            Get
                Return _articleCommentID
            End Get
            Set(ByVal Value As Integer)
                _articleCommentID = Value
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

        Public Property ArticleCommentText() As String
            Get
                Return _articleCommentText
            End Get
            Set(ByVal Value As String)
                _articleCommentText = Value
            End Set
        End Property

        Public Property Email() As String
            Get
                Return _email
            End Get
            Set(ByVal Value As String)
                _email = Value
            End Set
        End Property

        Public Property Name() As String
            Get
                Return _name
            End Get
            Set(ByVal Value As String)
                _name = Value
            End Set
        End Property

        Public Property Approved() As Boolean
            Get
                Return _approved
            End Get
            Set(ByVal Value As Boolean)
                _approved = Value
            End Set
        End Property

        Public Property IpAddress() As String
            Get
                Return _ipAddress
            End Get
            Set(ByVal Value As String)
                _ipAddress = Value
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

#End Region

#Region "ArticleComment Data Access"

        Public Shared Function AddThis(ByVal ArticleComment As ArticleCommentInfo) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCommentAdd", String.Empty, ArticleComment.ArticleID, ArticleComment.ArticleCommentText, ArticleComment.Email, ArticleComment.Name, ArticleComment.Approved, ArticleComment.IpAddress, ArticleComment.CreatedByUserID, ArticleComment.CreatedOnDate), Integer)
        End Function

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCommentAdd", String.Empty, MyClass.ArticleID, MyClass.ArticleCommentText, MyClass.Email, MyClass.Name, MyClass.Approved, MyClass.IpAddress, MyClass.CreatedByUserID, MyClass.CreatedOnDate), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal ArticleCommentID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleCommentDelete", String.Empty, ArticleCommentID.ToString())
        End Sub
        Public Shared Sub DeleteThis(ByVal ArticleComment As ArticleCommentInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleCommentDelete", String.Empty, ArticleComment.ArticleCommentID.ToString())
        End Sub
        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCommentDelete", String.Empty, MyClass.ArticleCommentID)
        End Sub

        Public Shared Sub UpdateThis(ByVal ArticleComment As ArticleCommentInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleCommentUpdate", String.Empty, ArticleComment.ArticleCommentID, ArticleComment.ArticleID, ArticleComment.ArticleCommentText, ArticleComment.Email, ArticleComment.Name, ArticleComment.Approved, ArticleComment.IpAddress, ArticleComment.CreatedByUserID, ArticleComment.CreatedOnDate)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCommentUpdate", String.Empty, MyClass.ArticleCommentID, MyClass.ArticleID, MyClass.ArticleCommentText, MyClass.Email, MyClass.Name, MyClass.Approved, MyClass.IpAddress, MyClass.CreatedByUserID, MyClass.CreatedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal ArticleCommentID As Integer) As ArticleCommentInfo
            Return AbstractController.GetObject(GetType(ArticleCommentInfo), "ArticleCommentGet", String.Empty, ArticleCommentID.ToString())
        End Function

        Public Shared Function GetArticleCommentList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCommentInfo), "ArticleCommentGetAll", String.Empty)
        End Function

        Public Shared Function GetArticleCommentListByArticle(ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCommentInfo), "ArticleCommentGetAllByArticle", String.Empty, ArticleID)
        End Function


#End Region
    End Class

End Namespace
