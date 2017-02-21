
Imports System.IO
Imports Microsoft.VisualBasic
Imports System.Collections.Generic
Imports System.Xml
Imports System.Xml.Xsl

Imports System.Web.UI.HtmlControls


Namespace Kovit
    Public Class Core

        Public Shared Function GetDate() As DateTime
            Return Today() + " " + TimeOfDay()
        End Function

        Public Shared Function FormatDate(ByVal inputDate As DateTime, ByVal Pattern As String) As String
            Return inputDate.ToString(Pattern, CultureInfo.InvariantCulture)
        End Function

        Public Shared Function XMLTransform(ByVal xmlDoc As XmlDocument, ByVal PathToXsl As String, Optional ByVal params As XsltArgumentList = Nothing) As XmlDocument
            Dim TransformedXMLdoc As New XmlDocument
            Dim xslDoc As New XmlDocument
            Try
                xslDoc.Load(PathToXsl)
                Dim xslt As New System.Xml.Xsl.XslCompiledTransform
                xslt.Load(xslDoc, Nothing, Nothing)
                Dim ms As New MemoryStream()
                If (params Is Nothing) Then
                    xslt.Transform(xmlDoc, Nothing, ms)
                Else
                    xslt.Transform(xmlDoc, params, ms)
                End If
                ms.Position = 0
                Dim sr As New StreamReader(ms, Encoding.UTF8)
                TransformedXMLdoc.InnerXml = sr.ReadToEnd()
                Return TransformedXMLdoc
            Catch fnfex As System.IO.FileNotFoundException
                TransformedXMLdoc = New XmlDocument()
                If IsAdministrator() Then
                    TransformedXMLdoc.InnerXml = "<p class=""error"">File " & PathToXsl & " Not Found</p>"
                Else
                    TransformedXMLdoc.InnerXml = "<p class=""error"">XSLT File Not Found</p>"
                End If

                Return TransformedXMLdoc
            Catch xmlex As System.Xml.XmlException
                TransformedXMLdoc = New XmlDocument()
                If IsAdministrator() Then
                    TransformedXMLdoc.InnerXml = "<p class=""error"">XSLT Transformation failed: " & xmlex.Message & "</p>"
                Else
                    TransformedXMLdoc.InnerXml = "<p class=""error"">XSLT Transformation failed</p>"
                End If

                Return TransformedXMLdoc
            End Try
        End Function

        Public Shared Sub ProcessSEO(ByVal page As Page, ByVal title As String, ByVal description As String, ByVal keywords As String)
            page.Title = title
            For Each obj As Object In Page.Header.Controls
                If obj.[GetType]() Is GetType(HtmlMeta) Then
                    Dim meta As HtmlMeta = DirectCast(obj, HtmlMeta)
                    If meta.Name.ToLower() = "description" Then
                        meta.Content = description & meta.Content
                    End If
                    If meta.Name.ToLower() = "keywords" Then
                        meta.Content = keywords & meta.Content
                    End If
                End If
            Next
            'Add Base URL's tag
            Dim baseTag As HtmlControl = New HtmlGenericControl("base")
            baseTag.Attributes("href") = String.Format("{0}://{1}{2}", page.Request.Url.Scheme, page.Request.Url.Authority, page.Request.ApplicationPath.TrimEnd("/") + "/")
            page.Header.Controls.Add(baseTag)
        End Sub

        Public Shared Sub RegisterJavaScript(ByVal page As Page, ByVal scriptName As String, ByVal path As String)

            If page.Header IsNot Nothing Then
                ' check if header already has such link 
                Dim scriptSrc As String = ("./" & path) + scriptName & ".js"
                For Each control As Control In page.Header.Controls
                    If TypeOf control Is HtmlGenericControl Then
                        If DirectCast(control, HtmlGenericControl).Attributes("src") = scriptSrc Then
                            Exit Sub
                        End If
                    End If
                Next
                Dim javaScriptLink As New HtmlGenericControl("script")
                javaScriptLink.Attributes("type") = "text/javascript"
                javaScriptLink.Attributes("src") = (path) + scriptName & ".js"
                'fPlayer.js"; 
                page.Header.Controls.Add(javaScriptLink)
            End If
        End Sub
        Public Shared Sub RegisterCSS(ByVal page As Page, ByVal cssName As String, ByVal path As String)

            If page.Header IsNot Nothing Then
                ' check if header already has such link 
                Dim cssSrc As String = path + cssName & ".css"
                For Each control As Control In page.Header.Controls
                    If TypeOf control Is HtmlLink Then
                        If DirectCast(control, HtmlLink).Href = cssSrc Then
                            Exit Sub
                        End If
                    End If
                Next
                Dim cssLink As New HtmlLink()
                cssLink.Attributes.Add("rel", "stylesheet")
                cssLink.Attributes.Add("type", "text/css")
                cssLink.Href = cssSrc
                page.Header.Controls.Add(cssLink)
            End If
        End Sub


        Public Sub RegisterRssFeed(ByVal contextPage As Page, ByVal rssUrl As String, ByVal rssTitle As String)
            If rssUrl IsNot Nothing AndAlso rssTitle IsNot Nothing Then
                Dim lc As New LiteralControl()
                Dim sb As New StringBuilder()
                sb.Append("<link rel=""alternate"" type=""application/rss+xml"" href=""")
                sb.Append(rssUrl.ToString())
                sb.Append(""" title=""")
                sb.Append(rssTitle.ToString())
                sb.Append(""">")
                lc.Text = sb.ToString()

                Dim tp As DotNetNuke.Framework.CDefault = DirectCast(contextPage, DotNetNuke.Framework.CDefault)
                If tp IsNot Nothing Then
                    tp.Header.Controls.Add(lc)
                End If
            End If
        End Sub
        'Dim root As System.Xml.XmlNode = XmlTireItemDoc.DocumentElement
        'Create a new node.
        'Dim elem As System.Xml.XmlElement = XmlTireItemDoc.CreateElement("PortalPath")
        'elem.InnerText = PortalSettings.HomeDirectory
        'Add the node to the document.
        'root.AppendChild(elem)
#Region "DNN Framework Realted"
        Public Shared Function IsAdministrator() As Boolean

            Dim objUserInfo As UserInfo = UserController.GetCurrentUserInfo
            Dim isAdmin As Boolean

            isAdmin = objUserInfo.IsSuperUser

            If Not isAdmin Then
                Dim roleController As DotNetNuke.Security.Roles.RoleController = New DotNetNuke.Security.Roles.RoleController
                Dim roles(), role As String

                roles = roleController.GetRolesByUser(objUserInfo.UserID, objUserInfo.PortalID)
                For Each role In roles
                    If (role = "Administrators") Then
                        isAdmin = True
                    End If
                Next
            End If
            Return isAdmin
        End Function
        Public Shared Function GetUserName() As String
            If DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo.Username = Nothing Then
                Return DotNetNuke.Entities.Users.UserController.GetCurrentUserInfo.Username
            Else
                Return "Anonymous user"
            End If
        End Function
        Public Shared Sub AddLog(ByVal LogTitle As String, ByVal LogMsg As String)
            Dim objEventLog As New DotNetNuke.Services.Log.EventLog.EventLogController
            objEventLog.AddLog(LogTitle, LogMsg, DotNetNuke.Entities.Portals.PortalController.GetCurrentPortalSettings(), -1, DotNetNuke.Services.Log.EventLog.EventLogController.EventLogType.ADMIN_ALERT)
        End Sub
#End Region
#Region "Files Realted"
        Public Shared Function GetFileContents(ByVal FileName As String) As String
            Dim sr As IO.StreamReader = Nothing
            Dim FileContents As String = Nothing

            Try
                Dim fs As New IO.FileStream(FileName, IO.FileMode.Open, IO.FileAccess.Read)
                sr = New IO.StreamReader(fs)
                FileContents = sr.ReadToEnd()
            Finally
                If sr IsNot Nothing Then
                    sr.Close()
                End If
            End Try

            Return FileContents
        End Function
        Public Shared Function GetMaxRequestLength() As Integer
            ' presume that the section is not defined in the web.config
            Dim result As Integer = 4096

            Dim section As Web.Configuration.HttpRuntimeSection = TryCast(ConfigurationManager.GetSection("system.web/httpRuntime"), Web.Configuration.HttpRuntimeSection)
            If section IsNot Nothing Then
                result = section.MaxRequestLength
            End If

            Return result
        End Function
        Public Shared Function SaveFromStream(ByVal Path As String, ByVal fileStream As Stream) As String
            Try
                Dim sysFile As New FileStream(Path, FileMode.OpenOrCreate)
                Dim buffer As Byte() = New Byte(4096 * 1024 - 1) {}
                '4Mb
                Dim bytesRead As Integer = fileStream.Read(buffer, 0, buffer.Length)
                While bytesRead > 0
                    sysFile.Write(buffer, 0, bytesRead)
                    bytesRead = fileStream.Read(buffer, 0, buffer.Length)
                End While
            Catch ex As Exception
                Return ex.Message
            End Try
            Return String.Empty
        End Function
        Public Shared Function GetSafeFileName(ByRef inFileName As String, Optional ByVal ReplaceStr As String = "-") As String

            For Each lDisallowed As Char In System.IO.Path.GetInvalidFileNameChars()
                inFileName = inFileName.Replace(lDisallowed.ToString(), ReplaceStr)
            Next
            'For Each lDisallowed As Char In System.IO.Path.GetInvalidPathChars()
            '    inFileName = inFileName.Replace(lDisallowed.ToString(), ReplaceStr)
            'Next
            Dim lastdot As Integer = inFileName.LastIndexOf(".")

            If lastdot > 45 Then
                inFileName = inFileName.Substring(0, 45) + "." + inFileName.Substring(lastdot + 1)
            End If
            Return inFileName
        End Function
#End Region
#Region "Image Thumbnail Generation"

        Public Shared Function getThumbnailImage(ByVal filename As String, ByVal szMax As Size) As Bitmap
            Using fs As New FileStream(filename, FileMode.Open)
                Using img As System.Drawing.Image = System.Drawing.Image.FromStream(fs, True, False)
                    Dim sz As Size = adaptProportionalSize(szMax, img.Size)
                    Return DirectCast(img.GetThumbnailImage(sz.Width, sz.Height, Nothing, IntPtr.Zero), Bitmap)
                End Using
            End Using
        End Function

        Public Shared Function adaptProportionalSize(ByVal szMax As Size, ByVal szReal As Size) As Size
            Dim nWidth As Integer
            Dim nHeight As Integer
            Dim sMaxRatio As Double
            Dim sRealRatio As Double

            If szMax.Width < 1 OrElse szMax.Height < 1 OrElse szReal.Width < 1 OrElse szReal.Height < 1 Then
                Return Size.Empty
            End If

            sMaxRatio = CDbl(szMax.Width) / CDbl(szMax.Height)
            sRealRatio = CDbl(szReal.Width) / CDbl(szReal.Height)

            If sMaxRatio < sRealRatio Then
                nWidth = Math.Min(szMax.Width, szReal.Width)
                nHeight = CInt(Math.Round(nWidth / sRealRatio))
            Else
                nHeight = Math.Min(szMax.Height, szReal.Height)
                nWidth = CInt(Math.Round(nHeight * sRealRatio))
            End If

            Return New Size(nWidth, nHeight)
        End Function
        Public Shared Function SaveFile(ByVal control As FileUpload, ByVal savePath As String, ByVal fileName As String, ByRef savedName As String) As String
            ' Create a temporary file name to use for checking duplicates. 
 
            Dim FileNameWithoutExtention As String = String.Empty
            Dim extention As String = String.Empty
            Dim SavedFileName As String = String.Empty
            ' Create the path and file name to check for duplicates. 
            Dim lastdot As Integer = fileName.LastIndexOf(".")
            If lastdot > 0 Then
                extention = fileName.Substring(lastdot)
                FileNameWithoutExtention = fileName.Substring(0, lastdot)
            End If
            Dim pathToCheck As String = savePath + FileNameWithoutExtention + extention

            ' Check to see if a file already exists with the 
            ' same name as the file to upload. 
            If File.Exists(pathToCheck) Then
                Dim counter As Integer = 2
                While File.Exists(pathToCheck)
                    ' if a file with this name already exists, 
                    ' prefix the filename with a number. 
                    SavedFileName = FileNameWithoutExtention & "-" & counter.ToString() & extention
                    pathToCheck = savePath + SavedFileName
                    counter += 1
                End While
            Else
                ' Notify the user that the file was saved successfully. 
                ' SavedFileName = pathToCheck; 
                SavedFileName = FileNameWithoutExtention + extention
            End If
            ' Call the SaveAs method to save the uploaded 
            ' file to the specified directory. 
            Try
                control.SaveAs(savePath + SavedFileName)
                savedName = SavedFileName
                Return Nothing
            Catch exHttp As System.Web.HttpException
                savedName = String.Empty
                Return exHttp.Message
            Catch exNoAccess As UnauthorizedAccessException
                savedName = String.Empty
                Return exNoAccess.Message


            End Try
        End Function

        Public Shared Function SaveFile(ByVal image As System.Drawing.Image, ByVal savePath As String, ByVal fileName As String, ByVal extention As String) As String
            ' Create a temporary file name to use for checking duplicates. 

            Dim SavedFileName As String = String.Empty
            ' Create the path and file name to check for duplicates. 
            Dim pathToCheck As String = savePath + fileName + extention

            ' Check to see if a file already exists with the 
            ' same name as the file to upload. 
            If File.Exists(pathToCheck) Then
                Dim counter As Integer = 2
                While File.Exists(pathToCheck)
                    ' if a file with this name already exists, 
                    ' prefix the filename with a number. 
                    SavedFileName = (fileName & "-") + counter + extention
                    pathToCheck = savePath + SavedFileName
                    counter += 1

                End While
            Else
                ' Notify the user that the file was saved successfully. 
                ' SavedFileName = pathToCheck; 
                SavedFileName = fileName + extention
            End If
            ' Call the SaveAs method to save the uploaded 
            ' file to the specified directory. 

            image.Save(savePath + SavedFileName, System.Drawing.Imaging.ImageFormat.Jpeg)



            Return SavedFileName
        End Function

#End Region
#Region "Binary Serializers"
        Public Shared Function SerializeBinary(ByVal request As Object) As System.IO.MemoryStream
            Dim serializer As New System.Runtime.Serialization.Formatters.Binary.BinaryFormatter()
            Dim memStream As New System.IO.MemoryStream()
            serializer.Serialize(memStream, request)
            Return memStream
        End Function

        Public Shared Function DeSerializeBinary(ByVal memStream As System.IO.MemoryStream) As Object
            memStream.Position = 0
            Dim deserializer As New System.Runtime.Serialization.Formatters.Binary.BinaryFormatter()
            Dim newobj As Object = deserializer.Deserialize(memStream)
            memStream.Close()
            Return newobj
        End Function
#End Region



        Public Const regexpWhitespace As String = "\s{2,}" 'Whitespace 
        Public Const regexpRemoveTag As String = "<[^>]*>|&#160;" 'X/HTML Tags

        Public Shared Function HTML2Text(ByRef HTML As String) As String
            Dim result As String
            ' Removes tags from passed HTML
            result = Regex.Replace(System.Web.HttpUtility.HtmlDecode(HTML), regexpRemoveTag, "")
            result = Regex.Replace(result, regexpWhitespace, " ")
            Return result
        End Function


        Public Shared Function Translitarate(ByRef Text As String)
            Text = Text.Replace("а", "a")
            Text = Text.Replace("б", "b")
            Text = Text.Replace("в", "v")
            Text = Text.Replace("г", "g")
            Text = Text.Replace("ґ", "g")
            Text = Text.Replace("д", "d")
            Text = Text.Replace("е", "e")
            Text = Text.Replace("є", "ie")
            Text = Text.Replace("ё", "yo")
            Text = Text.Replace("ж", "zh")
            Text = Text.Replace("з", "z")
            Text = Text.Replace("і", "i")
            Text = Text.Replace("ї", "i")
            Text = Text.Replace("и", "i")
            Text = Text.Replace("й", "i")
            Text = Text.Replace("к", "k")
            Text = Text.Replace("л", "l")
            Text = Text.Replace("м", "m")
            Text = Text.Replace("н", "n")
            Text = Text.Replace("о", "o")
            Text = Text.Replace("п", "p")
            Text = Text.Replace("р", "r")
            Text = Text.Replace("с", "s")
            Text = Text.Replace("т", "t")
            Text = Text.Replace("у", "u")
            Text = Text.Replace("ф", "f")
            Text = Text.Replace("х", "kh")
            Text = Text.Replace("ц", "ts")
            Text = Text.Replace("ч", "ch")
            Text = Text.Replace("ш", "sh")
            Text = Text.Replace("щ", "shch")
            Text = Text.Replace("ъ", "")
            Text = Text.Replace("ы", "y")
            Text = Text.Replace("ь", "")
            Text = Text.Replace("э", "e")
            Text = Text.Replace("ю", "yu")
            Text = Text.Replace("я", "уа")
            Text = Text.Replace("А", "A")
            Text = Text.Replace("Б", "B")
            Text = Text.Replace("В", "V")
            Text = Text.Replace("Г", "G")
            Text = Text.Replace("Д", "D")
            Text = Text.Replace("Е", "E")
            Text = Text.Replace("Є", "IE")
            Text = Text.Replace("Ё", "YO")
            Text = Text.Replace("Ж", "ZH")
            Text = Text.Replace("З", "Z")
            Text = Text.Replace("И", "I")
            Text = Text.Replace("І", "I")
            Text = Text.Replace("Ї", "I")
            Text = Text.Replace("Й", "I")
            Text = Text.Replace("К", "K")
            Text = Text.Replace("Л", "L")
            Text = Text.Replace("М", "M")
            Text = Text.Replace("Н", "N")
            Text = Text.Replace("О", "O")
            Text = Text.Replace("П", "P")
            Text = Text.Replace("Р", "R")
            Text = Text.Replace("С", "S")
            Text = Text.Replace("Т", "T")
            Text = Text.Replace("У", "U")
            Text = Text.Replace("Ф", "F")
            Text = Text.Replace("Х", "KH")
            Text = Text.Replace("Ц", "TS")
            Text = Text.Replace("Ч", "CH")
            Text = Text.Replace("Ш", "SH")
            Text = Text.Replace("Щ", "SHCH")
            Text = Text.Replace("Ъ", "")
            Text = Text.Replace("Ы", "Y")
            Text = Text.Replace("Ь", "")
            Text = Text.Replace("Э", "E")
            Text = Text.Replace("Ю", "YU")
            Text = Text.Replace("Я", "YA")
            Return Text
        End Function
        Function CapText(ByVal m As Match) As String 'Captialize First Char
            ' Get the matched string.
            Dim x As String = m.ToString()
            ' If the first char is lower case...
            If Char.IsLower(x.Chars(0)) Then
                ' Capitalize it.
                Return Char.ToUpper(x.Chars(0)) & x.Substring(1, x.Length - 1)
            End If
            Return x
        End Function

    End Class
End Namespace
