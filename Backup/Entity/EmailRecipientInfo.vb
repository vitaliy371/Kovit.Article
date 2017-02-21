Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The EmailRecipientInfo Class the business object representing a single
    '''		EmailRecipient object, as used by the eMail module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	06.04.2010 17:52:35	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class EmailRecipientInfo

#Region " Private fields "

        Private _emailRecipientID As Integer
        Private _recipientName As String
        Private _recipientEmail As String
        Private _active As Boolean
        Private _controlKey As String
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _recipientName = ""
            _recipientEmail = ""
            _active = (1)
            _controlKey = ""
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal recipientName As String, ByVal recipientEmail As String, ByVal active As Boolean, ByVal controlKey As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _recipientName = recipientName
            _recipientEmail = recipientEmail
            _active = active
            _controlKey = controlKey
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property EmailRecipientID() As Integer
            Get
                Return _emailRecipientID
            End Get
            Set(ByVal Value As Integer)
                _emailRecipientID = Value
            End Set
        End Property

        Public Property RecipientName() As String
            Get
                Return _recipientName
            End Get
            Set(ByVal Value As String)
                _recipientName = Value
            End Set
        End Property

        Public Property RecipientEmail() As String
            Get
                Return _recipientEmail
            End Get
            Set(ByVal Value As String)
                _recipientEmail = Value
            End Set
        End Property

        Public Property Active() As Boolean
            Get
                Return _active
            End Get
            Set(ByVal Value As Boolean)
                _active = Value
            End Set
        End Property

        Public Property ControlKey() As String
            Get
                Return _controlKey
            End Get
            Set(ByVal Value As String)
                _controlKey = Value
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

#Region "EmailRecipient Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailRecipientAdd", String.Empty, MyClass.RecipientName, MyClass.RecipientEmail, MyClass.Active, MyClass.ControlKey, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailRecipientAdd", ErrorMessage, MyClass.RecipientName, MyClass.RecipientEmail, MyClass.Active, MyClass.ControlKey, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("EmailRecipientDelete", String.Empty, MyClass.EmailRecipientID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal EmailRecipientID As Integer)
            DataProvider.Instance().ExecuteNonQuery("EmailRecipientDelete", String.Empty, EmailRecipientID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("EmailRecipientUpdate", ErrorMessage, MyClass.EmailRecipientID, MyClass.RecipientName, MyClass.RecipientEmail, MyClass.Active, MyClass.ControlKey, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal EmailRecipientID As Integer) As EmailRecipientInfo
            Return AbstractController.GetObject(GetType(EmailRecipientInfo), "EmailRecipientGet", String.Empty, EmailRecipientID.ToString())
        End Function

        Public Shared Function GetEmailRecipientList() As ArrayList
            Return AbstractController.GetObjectList(GetType(EmailRecipientInfo), "EmailRecipientGetAll", String.Empty)
        End Function

        Public Shared Sub GetEmailRecipientList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "EmailRecipientGetAll", String.Empty)
        End Sub

        Public Shared Sub GetEmailRecipientSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "EmailRecipientSearch", String.Empty, spParameters)
        End Sub

        Public Shared Function CheckThis(ByVal RecipientName As String, ByVal RecipientEmail As String, ByVal ControlKey As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailRecipientCheck", String.Empty, RecipientName, RecipientEmail, ControlKey), Integer)
        End Function


#End Region
    End Class

End Namespace
