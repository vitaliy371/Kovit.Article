Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleRatingInfo Class the business object representing a single
    '''		ArticleRating object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	11.11.2009 22:12:56	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleRatingInfo

#Region " Private fields "

        Private _articleRatingID As Integer
        Private _articleID As Integer
        Private _rating As Integer
        Private _ipAddress As String
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleID = 0
            _rating = (0)
            _ipAddress = "0.0.0.0"
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal articleID As Integer, ByVal rating As Integer, ByVal ipAddress As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime)
            _articleID = articleID
            _rating = rating
            _ipAddress = ipAddress
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleRatingID() As Integer
            Get
                Return _articleRatingID
            End Get
            Set(ByVal Value As Integer)
                _articleRatingID = Value
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

        Public Property Rating() As Integer
            Get
                Return _rating
            End Get
            Set(ByVal Value As Integer)
                _rating = Value
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

#Region "ArticleRating Data Access"

        Public Shared Function AddThis(ByVal ArticleRating As ArticleRatingInfo) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleRatingAdd", String.Empty, ArticleRating.ArticleID, ArticleRating.Rating, ArticleRating.IpAddress, ArticleRating.CreatedByUserID, ArticleRating.CreatedOnDate), Integer)
        End Function

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleRatingAdd", String.Empty, MyClass.ArticleID, MyClass.Rating, MyClass.IpAddress, MyClass.CreatedByUserID, MyClass.CreatedOnDate), Integer)
        End Function

        Public Shared Sub DeleteThis(ByVal ArticleRating As ArticleRatingInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleRatingDelete", String.Empty, ArticleRating.ArticleID.ToString())
        End Sub

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleRatingDelete", String.Empty, MyClass.ArticleID)
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleRatingDelete", String.Empty, ArticleID)
        End Sub


        Public Shared Sub UpdateThis(ByVal ArticleRating As ArticleRatingInfo)
            DataProvider.Instance().ExecuteNonQuery("ArticleRatingUpdate", String.Empty, ArticleRating.ArticleRatingID, ArticleRating.ArticleID, ArticleRating.Rating, ArticleRating.IpAddress, ArticleRating.CreatedByUserID, ArticleRating.CreatedOnDate)
        End Sub

        Public Sub UpdateThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleRatingUpdate", String.Empty, MyClass.ArticleRatingID, MyClass.ArticleID, MyClass.Rating, MyClass.IpAddress, MyClass.CreatedByUserID, MyClass.CreatedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal ArticleRatingID As Integer) As ArticleRatingInfo
            Return AbstractController.GetObject(GetType(ArticleRatingInfo), "ArticleRatingGet", String.Empty, ArticleRatingID.ToString())
        End Function

        Public Shared Function GetArticleRatingList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleRatingInfo), "ArticleRatingGetAll", String.Empty)
        End Function

        Public Shared Function GetArticleRating(ByVal ArticleID As Integer) As ArticleRatingInfo
            Return AbstractController.GetObject(GetType(ArticleRatingInfo), "ArticleRatingGetTotalByArticle", String.Empty, ArticleID.ToString())
        End Function



#End Region
    End Class

End Namespace
