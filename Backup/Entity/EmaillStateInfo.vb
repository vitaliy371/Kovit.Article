Imports System
Imports Kovit.Article.Data

Namespace Entity

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The EmaillStateInfo Class the business object representing a single
    '''		EmaillState object, as used by the eMail module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	23.03.2010 11:40:44	Code file automatically generated from dnn by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    <Serializable()> _
    Public Class EmaillStateInfo

#Region " Private fields "

        Private _emaillStateID As Integer
        Private _emaillStateName As String
        Private _createdByUserID As Integer
        Private _createdOnDate As DateTime
        Private _lastModifiedByUserID As Integer
        Private _lastModifiedOnDate As DateTime

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _emaillStateName = ""
            _createdByUserID = 0
            _createdOnDate = Today() & " " & TimeOfDay()
            _lastModifiedByUserID = 0
            _lastModifiedOnDate = Today() & " " & TimeOfDay()


        End Sub

        Public Sub New(ByVal emaillStateName As String, ByVal createdByUserID As Integer, ByVal createdOnDate As DateTime, ByVal lastModifiedByUserID As Integer, ByVal lastModifiedOnDate As DateTime)
            _emaillStateName = emaillStateName
            _createdByUserID = createdByUserID
            _createdOnDate = createdOnDate
            _lastModifiedByUserID = lastModifiedByUserID
            _lastModifiedOnDate = lastModifiedOnDate
        End Sub

#End Region

#Region " Properties "

        Public Property EmaillStateID() As Integer
            Get
                Return _emaillStateID
            End Get
            Set(ByVal Value As Integer)
                _emaillStateID = Value
            End Set
        End Property

        Public Property EmaillStateName() As String
            Get
                Return _emaillStateName
            End Get
            Set(ByVal Value As String)
                _emaillStateName = Value
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

#Region "EmaillState Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmaillStateAdd", String.Empty, MyClass.EmaillStateName, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("EmaillStateAdd", ErrorMessage, MyClass.EmaillStateName, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("EmaillStateDelete", String.Empty, MyClass.EmaillStateID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal EmaillStateID As Integer)
            DataProvider.Instance().ExecuteNonQuery("EmaillStateDelete", String.Empty, EmaillStateID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("EmaillStateUpdate", ErrorMessage, MyClass.EmaillStateID, MyClass.EmaillStateName, MyClass.CreatedByUserID, MyClass.CreatedOnDate, MyClass.LastModifiedByUserID, MyClass.LastModifiedOnDate)
        End Sub

        Public Shared Function GetThis(ByVal EmaillStateID As Integer) As EmaillStateInfo
            Return AbstractController.GetObject(GetType(EmaillStateInfo), "EmaillStateGet", String.Empty, EmaillStateID.ToString())
        End Function

        Public Shared Function GetEmaillStateList() As ArrayList
            Return AbstractController.GetObjectList(GetType(EmaillStateInfo), "EmaillStateGetAll", String.Empty)
        End Function


#End Region
    End Class

End Namespace
