Imports System 
Imports Kovit.Article.Data


Namespace Entity

	''' -----------------------------------------------------------------------------
	''' <summary>
	'''		The ArticleAtributeInfo Class the business object representing a single
	'''		ArticleAtribute object, as used by the Entity module.
	''' </summary>
	''' <remarks></remarks>
	''' <history>
	'''		[MyGeneration]	16.07.2012 6:05:38	Code file automatically generated from 1gb_kovit_dnn by MyGeneration v1.3.0.3
	''' </history>
	''' -----------------------------------------------------------------------------
    Public Class ArticleLocationInfo

#Region " Private fields "

        Private _articleLocationID As Integer
        Private _articleID As Integer
        Private _title As String
        Private _longitude As String
        Private _latitude As String
        Private _sortOrder As Integer
        Private _mapProvider As String
        Private _address As String
        Private _size As String
        Private _zoomLevel As String
        Private _mapType As String

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleID = 0
            _title = ""
            _longitude = "0"
            _latitude = "0"
            _sortOrder = (65535)
            _mapProvider = ""
            _address = ""
            _size = ""
            _zoomLevel = ""
            _mapType = ""


        End Sub

        Public Sub New(ByVal articleID As Integer, ByVal title As String, ByVal longitude As String, ByVal latitude As String, ByVal sortOrder As Integer, ByVal mapProvider As String, ByVal address As String, ByVal size As String, ByVal zoomLevel As String, ByVal mapType As String)
            _articleID = articleID
            _title = title
            _longitude = longitude
            _latitude = latitude
            _sortOrder = sortOrder
            _mapProvider = mapProvider
            _address = address
            _size = size
            _zoomLevel = zoomLevel
            _mapType = mapType
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleLocationID() As Integer
            Get
                Return _articleLocationID
            End Get
            Set(ByVal Value As Integer)
                _articleLocationID = Value
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

        Public Property Title() As String
            Get
                Return _title
            End Get
            Set(ByVal Value As String)
                _title = Value
            End Set
        End Property

        Public Property Longitude() As String
            Get
                Return _longitude
            End Get
            Set(ByVal Value As String)
                _longitude = Value
            End Set
        End Property

        Public Property Latitude() As String
            Get
                Return _latitude
            End Get
            Set(ByVal Value As String)
                _latitude = Value
            End Set
        End Property

        Public Property SortOrder() As Integer
            Get
                Return _sortOrder
            End Get
            Set(ByVal Value As Integer)
                _sortOrder = Value
            End Set
        End Property

        Public Property MapProvider() As String
            Get
                Return _mapProvider
            End Get
            Set(ByVal Value As String)
                _mapProvider = Value
            End Set
        End Property

        Public Property Address() As String
            Get
                Return _address
            End Get
            Set(ByVal Value As String)
                _address = Value
            End Set
        End Property

        Public Property Size() As String
            Get
                Return _size
            End Get
            Set(ByVal Value As String)
                _size = Value
            End Set
        End Property

        Public Property ZoomLevel() As String
            Get
                Return _zoomLevel
            End Get
            Set(ByVal Value As String)
                _zoomLevel = Value
            End Set
        End Property

        Public Property MapType() As String
            Get
                Return _mapType
            End Get
            Set(ByVal Value As String)
                _mapType = Value
            End Set
        End Property

#End Region

#Region "ArticleLocation Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleLocationAdd", String.Empty, MyClass.ArticleID, MyClass.Title, MyClass.Longitude, MyClass.Latitude, MyClass.SortOrder, MyClass.MapProvider, MyClass.Address, MyClass.Size, MyClass.ZoomLevel, MyClass.MapType), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleLocationAdd", ErrorMessage, MyClass.ArticleID, MyClass.Title, MyClass.Longitude, MyClass.Latitude, MyClass.SortOrder, MyClass.MapProvider, MyClass.Address, MyClass.Size, MyClass.ZoomLevel, MyClass.MapType), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleLocationDelete", String.Empty, MyClass.ArticleLocationID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleLocationID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleLocationDelete", String.Empty, ArticleLocationID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleLocationUpdate", ErrorMessage, MyClass.ArticleLocationID, MyClass.ArticleID, MyClass.Title, MyClass.Longitude, MyClass.Latitude, MyClass.SortOrder, MyClass.MapProvider, MyClass.Address, MyClass.Size, MyClass.ZoomLevel, MyClass.MapType)
        End Sub

        Public Shared Function GetThis(ByVal ArticleLocationID As Integer) As ArticleLocationInfo
            Return AbstractController.GetObject(GetType(ArticleLocationInfo), "ArticleLocationGet", String.Empty, ArticleLocationID.ToString())
        End Function

        Public Shared Function GetArticleLocationList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleLocationInfo), "ArticleLocationGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleLocationList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleLocationGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleLocationSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleLocationSearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleLocationListByArticle(ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleLocationInfo), "ArticleLocationGetAllByArticle", String.Empty, ArticleID)
        End Function

        Public Shared Sub GetArticleLocationListByArticle(ByRef ds As DataSet, ByVal ArticleID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleLocationGetAllByArticle", String.Empty, ArticleID)
        End Sub

#End Region

        Public Shared Function GetMapCode(ByVal Title As String, ByVal Longitude As String, ByVal Latitude As String, ByVal MapProvider As String, ByVal Address As String, ByVal Size As String, ByVal ZoomLevel As String, ByVal MapType As String) As String





            Dim Result As String = String.Empty
            Dim widthStr, queryStr, longlatStr, addressStr, zoomStr, maptypeStr As String

            Select Case MapProvider
                Case "googlemap"
                    Select Case Size
                        Case "425px"
                            widthStr = " width=""425"" height=""350"" "
                        Case "100%"
                            widthStr = " width=""100%"" height=""350"" "
                    End Select

                    If Not (String.IsNullOrEmpty(Title)) Then
                        queryStr = "q=" & System.Web.HttpUtility.UrlEncode(Title) & "&amp;"
                    Else
                        queryStr = "q=" & Longitude & "," & Latitude & "&amp;"
                    End If
                    If Not (String.IsNullOrEmpty(Longitude) And String.IsNullOrEmpty(Latitude)) Then
                        longlatStr = "ll=" & Longitude & "," & Latitude & "&amp;"
                    End If
                    If Not (String.IsNullOrEmpty(Address)) Then
                        addressStr = "g=" & System.Web.HttpUtility.UrlEncode(Address) & "&amp;"
                    End If

                    Select Case ZoomLevel
                        Case "Country"
                            zoomStr = "z=5&amp;"
                        Case "Region"
                            zoomStr = "z=7&amp;"
                        Case "City"
                            zoomStr = "z=12&amp;"
                        Case "Street"
                            zoomStr = "z=15&amp;"
                        Case Else
                            zoomStr = "z=11&amp;"
                    End Select
                    Select Case MapType
                        Case "Map"
                            maptypeStr = "t=m&amp;"
                        Case "Sat"
                            maptypeStr = "t=k&amp;"
                        Case "Hyb"
                            maptypeStr = "t=h&amp;"
                        Case Else
                            maptypeStr = "t=m&amp;"
                    End Select

                    Result = String.Format("<iframe class=""embedmap"" {0} frameborder=""0"" scrolling=""no"" marginheight=""0"" marginwidth=""0"" src=""https://maps.google.com/maps?{1}{2}{3}{4}{5}ie=UTF8&amp;output=embed""></iframe>", _
                    widthStr, queryStr, longlatStr, addressStr, zoomStr, maptypeStr)
                Case "yandexmap"

                Case Else
                    Result = "Invalid provider"
            End Select


            Return Result

        End Function



    End Class

End Namespace
