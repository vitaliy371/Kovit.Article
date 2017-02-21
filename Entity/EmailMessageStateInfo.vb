Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The EmailMessageStateInfo Class the business object representing a single
    '''		EmailMessageState object, as used by the eMail module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	23.03.2010 11:40:44	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class EmailMessageStateInfo

#Region " Private fields "

        Private _emailMessageStateID As Integer
        Private _emailMessageID As Integer
        Private _emailRecipientID As Integer
        Private _emaillStateID As Integer
        Private _emailPortalID As Integer
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _emailMessageID = 0
            _emailRecipientID = 0
            _emaillStateID = 0
            _emailPortalID = 0
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal emailMessageID As Integer, ByVal emailRecipientID As Integer, ByVal emaillStateID As Integer, ByVal emailPortalID As Integer, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _emailMessageID = emailMessageID
            _emailRecipientID = emailRecipientID
            _emaillStateID = emaillStateID
            _emailPortalID = emailPortalID
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property EmailMessageStateID() As Integer
            Get
                Return _emailMessageStateID
            End Get
            Set(ByVal Value As Integer)
                _emailMessageStateID = Value
            End Set
        End Property

        Public Property EmailMessageID() As Integer
            Get
                Return _emailMessageID
            End Get
            Set(ByVal Value As Integer)
                _emailMessageID = Value
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

        Public Property EmaillStateID() As Integer
            Get
                Return _emaillStateID
            End Get
            Set(ByVal Value As Integer)
                _emaillStateID = Value
            End Set
        End Property

        Public Property EmailPortalID() As Integer
            Get
                Return _emailPortalID
            End Get
            Set(ByVal Value As Integer)
                _emailPortalID = Value
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

#Region "EmailMessageState Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailMessageStateAdd", String.Empty, MyClass.EmailMessageID, MyClass.EmailRecipientID, MyClass.EmaillStateID, MyClass.EmailPortalID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailMessageStateAdd", ErrorMessage, MyClass.EmailMessageID, MyClass.EmailRecipientID, MyClass.EmaillStateID, MyClass.EmailPortalID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("EmailMessageStateDelete", String.Empty, MyClass.EmailMessageStateID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal EmailMessageStateID As Integer)
            DataProvider.Instance().ExecuteNonQuery("EmailMessageStateDelete", String.Empty, EmailMessageStateID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("EmailMessageStateUpdate", ErrorMessage, MyClass.EmailMessageStateID, MyClass.EmailMessageID, MyClass.EmailRecipientID, MyClass.EmaillStateID, MyClass.EmailPortalID, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal EmailMessageStateID As Integer) As EmailMessageStateInfo
            Return AbstractController.GetObject(GetType(EmailMessageStateInfo), "EmailMessageStateGet", String.Empty, EmailMessageStateID.ToString())
        End Function

        Public Shared Function GetEmailMessageStateList() As ArrayList
            Return AbstractController.GetObjectList(GetType(EmailMessageStateInfo), "EmailMessageStateGetAll", String.Empty)
        End Function
        Public Shared Sub GetEmailMessageStateListByPortal(ByRef ds As DataSet, ByVal params As Object())
            AbstractController.LoadDataSet(ds, "emailMessageStateGetAllByPortal", String.Empty, params)

        End Sub

        Public Shared Sub GetFullMessageByEmailMessageState(ByRef ds As DataSet, ByVal emailMessageStateID As Integer)
            AbstractController.LoadDataSet(ds, "emailMessageStateGetFullMessage", String.Empty, emailMessageStateID)
        End Sub


#End Region
    End Class

End Namespace
