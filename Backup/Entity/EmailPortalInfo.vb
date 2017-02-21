Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The EmailPortalInfo Class the business object representing a single
    '''		EmailPortal object, as used by the eMail module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	23.03.2010 11:40:44	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class EmailPortalInfo

#Region " Private fields "

        Private _emailPortalID As Integer
        Private _portalID As Integer
        Private _smtpServer As String
        Private _smtpUserName As String
        Private _smtpPassword As String
        Private _smtpPort As Integer
        Private _useSSL As Boolean
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _portalID = 0
            _smtpServer = ""
            _smtpUserName = ""
            _smtpPassword = ""
            _smtpPort = (25)
            _useSSL = (0)
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal portalID As Integer, ByVal smtpServer As String, ByVal smtpUserName As String, ByVal smtpPassword As String, ByVal smtpPort As Integer, ByVal useSSL As Boolean, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _portalID = portalID
            _smtpServer = smtpServer
            _smtpUserName = smtpUserName
            _smtpPassword = smtpPassword
            _smtpPort = smtpPort
            _useSSL = useSSL
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property EmailPortalID() As Integer
            Get
                Return _emailPortalID
            End Get
            Set(ByVal Value As Integer)
                _emailPortalID = Value
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

        Public Property SmtpServer() As String
            Get
                Return _smtpServer
            End Get
            Set(ByVal Value As String)
                _smtpServer = Value
            End Set
        End Property

        Public Property SmtpUserName() As String
            Get
                Return _smtpUserName
            End Get
            Set(ByVal Value As String)
                _smtpUserName = Value
            End Set
        End Property

        Public Property SmtpPassword() As String
            Get
                Return _smtpPassword
            End Get
            Set(ByVal Value As String)
                _smtpPassword = Value
            End Set
        End Property

        Public Property SmtpPort() As Integer
            Get
                Return _smtpPort
            End Get
            Set(ByVal Value As Integer)
                _smtpPort = Value
            End Set
        End Property

        Public Property UseSSL() As Boolean
            Get
                Return _useSSL
            End Get
            Set(ByVal Value As Boolean)
                _useSSL = Value
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

#Region "EmailPortal Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailPortalAdd", String.Empty, MyClass.PortalID, MyClass.SmtpServer, MyClass.SmtpUserName, MyClass.SmtpPassword, MyClass.SmtpPort, MyClass.UseSSL, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmailPortalAdd", ErrorMessage, MyClass.PortalID, MyClass.SmtpServer, MyClass.SmtpUserName, MyClass.SmtpPassword, MyClass.SmtpPort, MyClass.UseSSL, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("EmailPortalDelete", String.Empty, MyClass.EmailPortalID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal EmailPortalID As Integer)
            DataProvider.Instance().ExecuteNonQuery("EmailPortalDelete", String.Empty, EmailPortalID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("EmailPortalUpdate", ErrorMessage, MyClass.EmailPortalID, MyClass.PortalID, MyClass.SmtpServer, MyClass.SmtpUserName, MyClass.SmtpPassword, MyClass.SmtpPort, MyClass.UseSSL, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal EmailPortalID As Integer) As EmailPortalInfo
            Return AbstractController.GetObject(GetType(EmailPortalInfo), "EmailPortalGet", String.Empty, EmailPortalID.ToString())
        End Function

        Public Shared Function GetEmailPortalList() As ArrayList
            Return AbstractController.GetObjectList(GetType(EmailPortalInfo), "EmailPortalGetAll", String.Empty)
        End Function


        Public Shared Function GetThisByPortalID(ByVal PortalID As Integer) As EmailPortalInfo
            Return AbstractController.GetObject(GetType(EmailPortalInfo), "EmailPortalGetByPortalID", String.Empty, PortalID.ToString())
        End Function




#End Region
    End Class

End Namespace
