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
	
    Public Class ArticleYouTubeInfo

#Region " Private fields "

        Private _articleYouTubeID As Integer
        Private _articleID As Integer
        Private _title As String
        Private _videoID As String
        Private _sortOrder As Integer
        Private _videoProvider As String
        Private _size As String
        Private _preview120 As String
        Private _preview320 As String
        Private _preview640 As String

#End Region

#Region " Constructors "

        Public Sub New()
            ' default object initialization
            Dim UserInfo As DotNetNuke.Entities.Users.UserInfo = DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo
            _articleID = 0
            _title = ""
            _videoID = 0
            _sortOrder = (65535)
            _videoProvider = ""
            _size = ""
            _preview120 = ""
            _preview320 = ""
            _preview640 = ""


        End Sub

        Public Sub New(ByVal articleID As Integer, ByVal title As String, ByVal videoID As String, ByVal sortOrder As Integer, ByVal videoProvider As String, ByVal size As String, ByVal preview120 As String, ByVal preview320 As String, ByVal preview640 As String)
            _articleID = articleID
            _title = title
            _videoID = videoID
            _sortOrder = sortOrder
            _videoProvider = videoProvider
            _size = size
            _preview120 = preview120
            _preview320 = preview320
            _preview640 = preview640
        End Sub

#End Region

#Region " Properties "

        Public Property ArticleYouTubeID() As Integer
            Get
                Return _articleYouTubeID
            End Get
            Set(ByVal Value As Integer)
                _articleYouTubeID = Value
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

        Public Property VideoID() As String
            Get
                Return _videoID
            End Get
            Set(ByVal Value As String)
                _videoID = Value
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

        Public Property VideoProvider() As String
            Get
                Return _videoProvider
            End Get
            Set(ByVal Value As String)
                _videoProvider = Value
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

        Public Property Preview120() As String
            Get
                Return _preview120
            End Get
            Set(ByVal Value As String)
                _preview120 = Value
            End Set
        End Property

        Public Property Preview320() As String
            Get
                Return _preview320
            End Get
            Set(ByVal Value As String)
                _preview320 = Value
            End Set
        End Property

        Public Property Preview640() As String
            Get
                Return _preview640
            End Get
            Set(ByVal Value As String)
                _preview640 = Value
            End Set
        End Property

#End Region

#Region "ArticleYouTube Data Access"

        Public Function AddThis() As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleYouTubeAdd", String.Empty, MyClass.ArticleID, MyClass.Title, MyClass.VideoID, MyClass.SortOrder, MyClass.VideoProvider, MyClass.Size, MyClass.Preview120, MyClass.Preview320, MyClass.Preview640), Integer)
        End Function

        Public Function AddThis(ByRef ErrorMessage As String) As Integer
            Return CType(DataProvider.Instance().ExecuteScalar("ArticleYouTubeAdd", ErrorMessage, MyClass.ArticleID, MyClass.Title, MyClass.VideoID, MyClass.SortOrder, MyClass.VideoProvider, MyClass.Size, MyClass.Preview120, MyClass.Preview320, MyClass.Preview640), Integer)
        End Function

        Public Sub DeleteThis()
            DataProvider.Instance().ExecuteNonQuery("ArticleYouTubeDelete", String.Empty, MyClass.ArticleYouTubeID.ToString())
        End Sub

        Public Shared Sub DeleteThis(ByVal ArticleYouTubeID As Integer)
            DataProvider.Instance().ExecuteNonQuery("ArticleYouTubeDelete", String.Empty, ArticleYouTubeID.ToString())
        End Sub

        Public Sub UpdateThis(ByRef ErrorMessage As String)
            DataProvider.Instance().ExecuteNonQuery("ArticleYouTubeUpdate", ErrorMessage, MyClass.ArticleYouTubeID, MyClass.ArticleID, MyClass.Title, MyClass.VideoID, MyClass.SortOrder, MyClass.VideoProvider, MyClass.Size, MyClass.Preview120, MyClass.Preview320, MyClass.Preview640)
        End Sub

        Public Shared Function GetThis(ByVal ArticleYouTubeID As Integer) As ArticleYouTubeInfo
            Return AbstractController.GetObject(GetType(ArticleYouTubeInfo), "ArticleYouTubeGet", String.Empty, ArticleYouTubeID.ToString())
        End Function

        Public Shared Function GetArticleYouTubeList() As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleYouTubeInfo), "ArticleYouTubeGetAll", String.Empty)
        End Function

        Public Shared Sub GetArticleYouTubeList(ByRef ds As DataSet)
            AbstractController.LoadDataSet(ds, "ArticleYouTubeGetAll", String.Empty)
        End Sub

        Public Shared Sub GetArticleYouTubeSearch(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleYouTubeSearch", String.Empty, spParameters)
        End Sub


        Public Shared Function GetArticleYouTubeListByArticle(ByVal ArticleID As Integer) As ArrayList
            Return AbstractController.GetObjectList(GetType(ArticleYouTubeInfo), "ArticleYouTubeGetAllByArticle", String.Empty, ArticleID)
        End Function

        Public Shared Sub GetArticleYouTubeListByArticle(ByRef ds As DataSet, ByVal ArticleID As Integer)
            AbstractController.LoadDataSet(ds, "ArticleYouTubeGetAllByArticle", String.Empty, ArticleID)
        End Sub

        '=== HAND made ===

        Public Shared Sub GetArticleYouTubeGetLatest(ByRef ds As DataSet, ByRef spParameters As Object())
            AbstractController.LoadDataSet(ds, "ArticleYouTubeLatest", String.Empty, spParameters)
        End Sub

#End Region

        Public Shared Function GetVideoCode(ByVal Title As String, ByVal VideoID As String, ByVal VideoProvider As String, ByVal Size As String) As String


            Dim Result As String = String.Empty
            Dim widthStr As String

            Select Case VideoProvider
                Case "youtube"
                    Select Case Size
                        Case "640px"
                            widthStr = " width=""640"" height=""390"" "
                        Case "480px"
                            widthStr = " width=""480"" height=""360"" "
                        Case "200px"
                            widthStr = " width=""200"" height=""165"" "
                        Case "100%"
                            widthStr = " width=""100%"" "
                    End Select
                    Result = String.Format("<iframe class=""embedvideo"" {0} frameborder=""0"" scrolling=""no"" marginheight=""0"" marginwidth=""0"" src=""http://www.youtube.com/embed/{1}""></iframe>", _
                    widthStr, VideoID)
                Case "vimeo"
                    Select Case Size
                        Case "640px"
                            widthStr = " width=""640"" height=""390"" "
                        Case "480px"
                            widthStr = " width=""480"" height=""360"" "
                        Case "200px"
                            widthStr = " width=""200"" height=""165"" "
                        Case "100%"
                            widthStr = " width=""100%"" "
                    End Select
                    Result = String.Format("<iframe class=""embedvideo"" src=""http://player.vimeo.com/video/{1}""  {0}  frameborder=""0""></iframe>", _
                    widthStr, VideoID)
                Case Else
                    Result = "Invalid provider"
            End Select


            Return Result

        End Function

    End Class

End Namespace
