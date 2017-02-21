Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The EmailMessageInfo Class the business object representing a single
    '''		EmailMessage object, as used by the eMail module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	23.03.2010 11:40:44	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class EmailMessageInfo

#Region " Private fields "

        Private _emailMessageID As Integer
        Private _subject As String
        Private _messageBody As String
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _subject = ""
            _messageBody = ""
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal subject As String, ByVal messageBody As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _subject = subject
            _messageBody = messageBody
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property EmailMessageID() As Integer
            Get
                Return _emailMessageID
            End Get
            Set(ByVal Value As Integer)
                _emailMessageID = Value
            End Set
        End Property

        Public Property Subject() As String
            Get
                Return _subject
            End Get
            Set(ByVal Value As String)
                _subject = Value
            End Set
        End Property

        Public Property MessageBody() As String
            Get
                Return _messageBody
            End Get
            Set(ByVal Value As String)
                _messageBody = Value
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

#Region "EmailMessage Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailMessageAdd", String.Empty, MyClass.Subject, MyClass.MessageBody, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailMessageAdd", ErrorMessage, MyClass.Subject, MyClass.MessageBody, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("EmailMessageDelete", String.Empty, MyClass.EmailMessageID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal EmailMessageID As Integer)
            DataProvider.Instance().ExecuteNonQuery("EmailMessageDelete", String.Empty, EmailMessageID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("EmailMessageUpdate", ErrorMessage, MyClass.EmailMessageID, MyClass.Subject, MyClass.MessageBody, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal EmailMessageID As Integer) As EmailMessageInfo
            Return AbstractController.GetObject(GetType(EmailMessageInfo), "EmailMessageGet", String.Empty, EmailMessageID.ToString())
        End Function

        Public Shared Function GetEmailMessageList() As ArrayList
            Return AbstractController.GetObjectList(GetType(EmailMessageInfo), "EmailMessageGetAll", String.Empty)
        End Function


#End Region
    End Class

End Namespace
