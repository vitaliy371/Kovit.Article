Imports System
Imports System.Collections.Generic
Imports Microsoft.ApplicationBlocks.Data
Imports System.Configuration
Imports System.Xml
Imports System.Data
Imports System.Data.SqlClient
Imports DotNetNuke.Common.Utilities

Namespace Data

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' SQL Server implementation of the abstract DataProvider class
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Public Class SqlDataProvider

        Inherits DataProvider

#Region "Private Members"

        Private Const ProviderType As String = "data"
        Private Const ModuleQualifier As String = "kovit_"
        Private _providerConfiguration As DotNetNuke.Framework.Providers.ProviderConfiguration = DotNetNuke.Framework.Providers.ProviderConfiguration.GetProviderConfiguration(ProviderType)
        Private _connectionString As String
        Private _providerPath As String
        Private _objectQualifier As String
        Private _databaseOwner As String

#End Region

#Region "Constructors"

        Public Sub New()

            ' Read the configuration specific information for this provider
            Dim objProvider As DotNetNuke.Framework.Providers.Provider = CType(_providerConfiguration.Providers(_providerConfiguration.DefaultProvider), DotNetNuke.Framework.Providers.Provider)

            ' Read the attributes for this provider
            'Get Connection string from web.config

            If objProvider.Attributes("connectionStringName") <> "" AndAlso _
                            ConfigurationManager.AppSettings(objProvider.Attributes("connectionStringName")) <> "" Then
                _connectionString = ConfigurationManager.AppSettings(objProvider.Attributes("connectionStringName"))
            Else
                _connectionString = objProvider.Attributes("connectionString")
            End If

            _providerPath = objProvider.Attributes("providerPath")

            _objectQualifier = objProvider.Attributes("objectQualifier")
            If _objectQualifier <> "" And _objectQualifier.EndsWith("_") = False Then
                _objectQualifier += "_"
            End If

            _databaseOwner = objProvider.Attributes("databaseOwner")
            If _databaseOwner <> "" And _databaseOwner.EndsWith(".") = False Then
                _databaseOwner += "."
            End If

        End Sub

#End Region

#Region "Properties"

        Public ReadOnly Property ConnectionString() As String
            Get
                Return _connectionString
            End Get
        End Property

        Public ReadOnly Property ProviderPath() As String
            Get
                Return _providerPath
            End Get
        End Property

        Public ReadOnly Property ObjectQualifier() As String
            Get
                Return _objectQualifier
            End Get
        End Property

        Public ReadOnly Property DatabaseOwner() As String
            Get
                Return _databaseOwner
            End Get
        End Property

#End Region

#Region "Private Methods"

        Private Function GetFullyQualifiedName(ByVal name As String) As String
            Return DatabaseOwner & ObjectQualifier & ModuleQualifier & name
        End Function

        Private Function GetNull(ByVal Field As Object) As Object
            Return DotNetNuke.Common.Utilities.Null.GetNull(Field, DBNull.Value)
        End Function


        Private Function AssignSqlParameters(ByVal procedureName As String, ByVal spParameters() As Object) As SqlParameter()

            Try
                Dim cmdParameters As SqlParameter() = SqlHelperParameterCache.GetSpParameterSet(ConnectionString, procedureName)
                For i As Integer = 0 To cmdParameters.Length - 1
                    Dim parameterName As String = cmdParameters(i).ParameterName.Substring(1)
                    'If parameterValues.ContainsKey(parameterName) Then


                    Select Case cmdParameters(i).DbType
                        Case DbType.Date, DbType.DateTime
                            Dim val As Date
                            Date.TryParse(spParameters(i), val)

                            'DateTime.TryParseExact(spParameters(i), "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, val)

                            If val = New Date() Then
                                cmdParameters(i).Value = System.Convert.DBNull
                                'DateTime.TryParseExact(spParameters(i), "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.None, Today)
                            Else
                                cmdParameters(i).Value = val
                            End If


                        Case DbType.Int16, DbType.Int32, DbType.Int64
                            Dim val As Integer
                            Integer.TryParse(spParameters(i), val)
                            cmdParameters(i).Value = val
                        Case DbType.Double
                            Dim val As Double
                            Double.TryParse(spParameters(i), val)
                            cmdParameters(i).Value = val
                        Case DbType.Boolean
                            Dim val As Boolean
                            Boolean.TryParse(spParameters(i), val)
                            cmdParameters(i).Value = val
                        Case DbType.String

                            If Not String.IsNullOrEmpty(spParameters(i).ToString) AndAlso spParameters(i).GetType.Equals(String.Empty.GetType()) Then
                                cmdParameters(i).Value = spParameters(i).ToString
                            Else
                                cmdParameters(i).Value = String.Empty
                            End If
                        Case DbType.Object
                            
                            cmdParameters(i).Value = spParameters(i)
                            cmdParameters(i).TypeName = CheckTypeName(cmdParameters(i).TypeName)


                        Case Else
                            If spParameters(i) = String.Empty Then
                                cmdParameters(i).Value = System.Convert.DBNull
                            Else
                                cmdParameters(i).Value = spParameters(i)
                            End If
                    End Select



                    'End If
                Next
                Return cmdParameters
            Catch OutOfRangeEx As System.IndexOutOfRangeException
                Dim elc As New DotNetNuke.Services.Log.EventLog.EventLogController
                Dim li As New DotNetNuke.Services.Log.EventLog.LogInfo()
                li.AddProperty("Error in SP param count", "Error in param count procedure - " & procedureName)
                Return Nothing

            End Try

        End Function


        Public Function CheckTypeName(ByRef inName As String) As String
            If inName.Contains("dbo.") Then
                Return inName.Substring(inName.IndexOf("dbo."))
            Else
                Return inName
            End If
        End Function

        Private Sub ProcessOutParameters(ByVal cmdParameters() As SqlParameter, ByVal spParameters() As Object)
            If cmdParameters IsNot Nothing Then
                For i As Integer = 0 To cmdParameters.Length - 1
                    Dim parameterName As String = cmdParameters(i).ParameterName.Substring(1)
                    spParameters(i) = cmdParameters(i).Value
                Next
            End If
        End Sub

        Private Shared Function GetParameterName(ByVal parameter As IDataParameter) As String
            Return parameter.ParameterName.Replace("@", "")
        End Function



        Public Overrides Function GetObjectList(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object) As IDataReader
            Try
                Return CType(SqlHelper.ExecuteReader(ConnectionString, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, spParameters), IDataReader)
            Catch ex As Exception
                ErrorMessage += ex.Message
                'Core.AddLog("STORED PROCEDURE ERROR:" & spName & ": ", ex.Message.ToString())
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function


        Public Overrides Sub GetObjectList(ByRef list As ArrayList, ByRef spName As String, ByRef ErrorMessage As String, ByRef ObjectType As Type, ByRef spParameters() As Object)
            Try
                Dim cmdParameters As SqlParameter() = AssignSqlParameters(ObjectQualifier & ModuleQualifier & spName, spParameters)
                list = CBO.FillCollection(SqlHelper.ExecuteReader(ConnectionString, CommandType.StoredProcedure, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, cmdParameters), ObjectType)
                'Method used to return rows and OUTPUT params
                ProcessOutParameters(cmdParameters, spParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)

            End Try
        End Sub
        Public Overrides Function GetXML(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As XmlDocument
            Dim xmlDoc As XmlDocument = New XmlDocument()
            Using connection As New SqlConnection(ConnectionString)
                Try
                    connection.Open()
                    xmlDoc.Load(SqlHelper.ExecuteXmlReader(connection, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, spParameters))
                Catch ex As Exception
                    ErrorMessage += ex.Message
                    DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
                Finally
                    connection.Close()
                End Try
            End Using
            Return xmlDoc
        End Function

        Public Overrides Function ExecuteScalar(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String) As Integer
            Try
                Return CType(SqlHelper.ExecuteScalar(ConnectionString, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, spParameters), Integer)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Function

        Public Overrides Sub ExecuteNonQuery(ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As String)
            Try
                Dim cmdParameters As SqlParameter() = AssignSqlParameters(ObjectQualifier & ModuleQualifier & spName, spParameters)
                SqlHelper.ExecuteNonQuery(ConnectionString, CommandType.StoredProcedure, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, cmdParameters)
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub


        Public Overrides Sub LoadDataSet(ByRef outDataSet As DataSet, ByRef spName As String, ByRef ErrorMessage As String, ByVal ParamArray spParameters() As Object)
            Try
                Using connection As New SqlConnection(ConnectionString)
                    connection.Open()
                    Dim cmdParameters As SqlParameter() = AssignSqlParameters(ObjectQualifier & ModuleQualifier & spName, spParameters)
                    outDataSet = SqlHelper.ExecuteDataset(connection, CommandType.StoredProcedure, DatabaseOwner & ObjectQualifier & ModuleQualifier & spName, cmdParameters)
                    ProcessOutParameters(cmdParameters, spParameters)
                End Using
            Catch ex As Exception
                ErrorMessage += ex.Message
                DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
            End Try
        End Sub

#End Region


    End Class

End Namespace