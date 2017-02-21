Imports System
Imports System.XML
Imports System.Collections
Imports DotNetNuke.Common.Utilities



Namespace Kovit.kovitArticle.Data

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    '''		The NewsController class provides business layer methods
    '''		for News objects used by the bfseNews module.
    ''' </summary>
    ''' <remarks></remarks>
    ''' <history>
    '''		[MyGeneration]	23.08.2009 19:14:08	Code file automatically generated from dnn.bfse_News by MyGeneration v1.3.0.3
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Public Class AbstractController


        Public Sub New()
            ' default object initialisation	
        End Sub

#Region " Public Methods "

        ''' Deletes a specified News
        ''' </summary>
        ''' <returns></returns>
        Public Shared Sub ExecuteNonQuery(ByRef spName As String, ByVal ParamArray spParameters() As String)
            DataProvider.Instance().ExecuteNonQuery(spName, String.Empty, spParameters)
        End Sub

        ''' <summary>
        ''' Deletes a specified News
        ''' </summary>
        ''' <returns></returns>
        Public Shared Sub ExecuteNonQuery(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String)
            DataProvider.Instance().ExecuteNonQuery(spName, ErrorMessage, spParameters)
        End Sub

        ''' <summary>
        ''' Retrieves the details of a specified Object
        ''' </summary>
        ''' <returns>NewsInfo object</returns>
        Public Shared Function GetObject(ByRef ObjectType As Type, ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object) As Object
            Return CBO.FillObject(DataProvider.Instance().GetObjectList(spName, ErrorMessage, spParameters), ObjectType)
        End Function



        ''' <summary>
        ''' Retrieves the details of a specified Object
        ''' </summary>
        ''' <returns>NewsInfo object</returns>
        Public Shared Function ExecuteScalar(ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As Integer
            Return DataProvider.Instance().ExecuteScalar(spName, ErrorMessage, spParameters)
        End Function



        ''' <summary>
        ''' Retrieves a list of ObjectType By ParamArray
        ''' </summary>
        ''' <returns>ArrayList of ObjectType objects</returns>
        Public Shared Function GetObjectList(ByVal ObjectType As Type, ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object) As ArrayList
            Return CBO.FillCollection(DataProvider.Instance().GetObjectList(spName, ErrorMessage, spParameters), ObjectType)
        End Function

        Public Shared Sub GetObjectListWithOutput(ByRef list As ArrayList, ByVal spName As String, ByRef ErrorMessage As String, ByVal ObjectType As Type, ByRef spParameters() As Object)
            DataProvider.Instance().GetObjectList(list, spName, ErrorMessage, ObjectType, spParameters)
        End Sub


        ''' <summary>
        ''' Retrieves a list of ObjectType By ParamArray
        ''' </summary>
        ''' <returns>ArrayList of ObjectType objects</returns>
        Public Shared Function GetXML(ByVal spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As XmlDocument
            Return DataProvider.Instance().GetXML(spName, ErrorMessage, spParameters)
        End Function


#End Region


    End Class

End Namespace
