Imports System
Imports System.XML
Imports System.Collections
Imports DotNetNuke.Common.Utilities



Namespace Data

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The DataController class provides business layer methods
    '''		for Data objects used by the dnnData module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		 1.07.2010 updated by KoVit
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Public Class AbstractController


        Public Sub New()
            ' default object initialisation	
        End Sub

#Region " Public Methods "

        ''' Deletes a specified Data
        ''' </summary>
        ''' <returns></returns>
        Public Shared Sub ExecuteNonQuery(ByRef spName As String, ByVal ParamArray spParameters() As String)
            Try
                DataProvider.Instance().ExecuteNonQuery(spName, String.Empty, spParameters)
            Catch ex As Exception
                'ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub

        ''' <summary>
        ''' Deletes a specified Data
        ''' </summary>
        ''' <returns></returns>
        Public Shared Sub ExecuteNonQuery(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String)
            Try
                DataProvider.Instance().ExecuteNonQuery(spName, ErrorMessage, spParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub

        ''' <summary>
        ''' Retrieves the details of a specified Object
        ''' </summary>
        ''' <returns>DataInfo object</returns>
        Public Shared Function GetObject(ByRef ObjectType As Type, ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object) As Object
            Try
                Return CBO.FillObject(DataProvider.Instance().GetObjectList(spName, ErrorMessage, spParameters), ObjectType)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function



        ''' <summary>
        ''' Retrieves the details of a specified Object
        ''' </summary>
        ''' <returns>DataInfo object</returns>
        Public Shared Function ExecuteScalar(ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As Integer
            Try
                Return DataProvider.Instance().ExecuteScalar(spName, ErrorMessage, spParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function



        ''' <summary>
        ''' Retrieves a list of ObjectType By ParamArray
        ''' </summary>
        ''' <returns>ArrayList of ObjectType objects</returns>
        Public Shared Function GetObjectList(ByVal ObjectType As Type, ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object) As ArrayList
            Try
                Return CBO.FillCollection(DataProvider.Instance().GetObjectList(spName, ErrorMessage, spParameters), ObjectType)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function

        


        ''' <summary>
        ''' Retrieves a list of ObjectType By ParamArray
        ''' </summary>
        ''' <returns>ArrayList of ObjectType objects</returns>
        Public Shared Function GetXML(ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As XmlDocument
            Try
                Return DataProvider.Instance().GetXML(spName, ErrorMessage, spParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function


        Public Shared Sub GetObjectListWithOutput(ByRef list As ArrayList, ByVal spName As String, ByRef ErrorMessage As String, ByVal ObjectType As Type, ByRef spParameters() As Object)

            GetObjectListWithOutput(True, list, spName, ErrorMessage, ObjectType, spParameters)

        End Sub

        Public Shared Sub GetObjectListWithOutput(ByVal UseCache As Boolean, ByRef list As ArrayList, ByVal spName As String, ByRef ErrorMessage As String, ByVal ObjectType As Type, ByRef spParameters() As Object)
            Try
                DataProvider.Instance().GetObjectList(list, spName, ErrorMessage, ObjectType, spParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub
        ''' <summary>
        ''' Retrieves a DataSet By ParamArray
        ''' </summary>
        ''' <returns>DataSet</returns>
        Public Shared Sub LoadDataSet(ByRef ds As DataSet, ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object)

            LoadDataSet(False, ds, spName, ErrorMessage, spParameters)
             
        End Sub

        Public Shared Sub LoadDataSet(ByVal UseCache As Boolean, ByRef ds As DataSet, ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object)
            Try
                If UseCache Then
                    Dim CacheKey As String = spName
                    For i As Integer = LBound(spParameters) To UBound(spParameters)
                        CacheKey &= "-" & spParameters(i)
                    Next
                    ds = DotNetNuke.Services.Cache.CachingProvider.Instance().GetItem(CacheKey)
                    If ds Is Nothing Then
                        DataProvider.Instance().LoadDataSet(ds, spName, ErrorMessage, spParameters)
                        DotNetNuke.Services.Cache.CachingProvider.Instance().Insert(CacheKey, ds)
                    End If
                Else
                    DataProvider.Instance().LoadDataSet(ds, spName, ErrorMessage, spParameters)
                End If
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub

#End Region


    End Class

End Namespace
