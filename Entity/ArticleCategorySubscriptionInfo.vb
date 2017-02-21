Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The ArticleCategorySubscriptionInfo Class the business object representing a single
    '''		ArticleCategorySubscription object, as used by the Data module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	25.03.2010 14:14:54	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class ArticleCategorySubscriptionInfo

#Region " Private fields "

        Private _articleCategorySubscriptionID As Integer
        Private _articleCategoryID As Integer
        Private _emailRecipientID As Integer
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleCategoryID = 0
            _emailRecipientID = 0
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal articleCategoryID As Integer, ByVal emailRecipientID As Integer, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _articleCategoryID = articleCategoryID
            _emailRecipientID = emailRecipientID
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleCategorySubscriptionID() As Integer
            Get
                Return _articleCategorySubscriptionID
            End Get
            Set(ByVal Value As Integer)
                _articleCategorySubscriptionID = Value
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

        Public Property EmailRecipientID() As Integer
            Get
                Return _emailRecipientID
            End Get
            Set(ByVal Value As Integer)
                _emailRecipientID = Value
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

#Region "ArticleCategorySubscription Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategorySubscriptionAdd", String.Empty, MyClass.ArticleCategoryID, MyClass.EmailRecipientID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategorySubscriptionAdd", ErrorMessage, MyClass.ArticleCategoryID, MyClass.EmailRecipientID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleCategorySubscriptionDelete", String.Empty, MyClass.ArticleCategorySubscriptionID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleCategorySubscriptionID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategorySubscriptionDelete", String.Empty, ArticleCategorySubscriptionID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategorySubscriptionUpdate", ErrorMessage, MyClass.ArticleCategorySubscriptionID, MyClass.ArticleCategoryID, MyClass.EmailRecipientID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal ArticleCategorySubscriptionID As Integer) As ArticleCategorySubscriptionInfo
            Return AbstractController.GetObject(GetType(ArticleCategorySubscriptionInfo), "ArticleCategorySubscriptionGet", String.Empty, ArticleCategorySubscriptionID.ToString())
        End Function

        Public Shared Function GetArticleCategorySubscriptionList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategorySubscriptionInfo), "ArticleCategorySubscriptionGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleCategorySubscriptionList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleCategorySubscriptionGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleCategorySubscriptionSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleCategorySubscriptionSearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleCategorySubscriptionListByArticleCategory(ByVal ArticleCategoryID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategorySubscriptionInfo), "ArticleCategorySubscriptionGetAllByArticleCategory", String.Empty, ArticleCategoryID)
        End Function

        Public Shared Sub GetArticleCategorySubscriptionListByArticleCategory(ByRef ds As DataSet, ByVal ArticleCategoryID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategorySubscriptionGetAllByArticleCategory", String.Empty, ArticleCategoryID)
        End Sub

        Public Shared Function GetArticleCategorySubscriptionListByemailRecipient(ByVal emailRecipientID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleCategorySubscriptionInfo), "ArticleCategorySubscriptionGetAllByemailRecipient", String.Empty, emailRecipientID)
        End Function

        Public Shared Sub GetArticleCategorySubscriptionListByemailRecipient(ByRef ds As DataSet, ByVal emailRecipientID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleCategorySubscriptionGetAllByemailRecipient", String.Empty, emailRecipientID)
        End Sub



        ' HAND MADE ------------------------------------------------------------------------------------

        Public Shared Function GetArticleCategorySubscribers(ByVal ArticleCategoryID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(EmailRecipientInfo), "ArticleCategorySubscriptionGetAllByArticleCategory", String.Empty, ArticleCategoryID.ToString())
        End Function

        Public Function CheckThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleCategorySubscriptionCheck", ErrorMessage, MyClass.ArticleCategoryID, MyClass.EmailRecipientID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Shared Sub UnSubscribe(ByVal ArticleCategoryID As Integer, ByVal ControlKey As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleCategorySubscriptionUnSubscribe", String.Empty, ArticleCategoryID.ToString(), ControlKey)
        End Sub

#End Region
    End Class

End Namespace
