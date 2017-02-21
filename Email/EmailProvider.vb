Imports System
Imports System.Threading
Imports System.Net.Mail
Imports System.Collections
Imports System.Web
Imports System.Text
Imports System.Configuration.Provider
Imports Kovit.Article.Data
Imports Kovit.Article.Entity



Namespace Email
    Public Class EmailProvider
        Inherits ProviderBase


#Region "Shared/Static Methods"

        ' singleton reference to the instantiated object 
        Private Shared objProvider As EmailProvider = Nothing

        ' Lock synchronization object
        Private Shared [syncLock] As New Object()
        Private Shared threadingTimer As Timer
        Private Shared isActive As Boolean = False
        Private Shared mailingList As New ArrayList
        Private Shared CurrentEmailQuery As EmailQueryInfo

        Private Const ProviderType As String = "email"
        Private Const ModuleQualifier As String = "kovit_"
        Friend Delegate Sub AsyncDelegate(ByVal state As Object)
        ' constructor
        Shared Sub New()
            'CreateProvider()
        End Sub

        ' dynamically create provider
        Private Shared Sub CreateProvider()
            'objProvider = CType(Framework.Reflection.CreateObject("data", " Kovit.Email", ""), EmailProvider)
            'MyClass.Name = ""
            'objProvider = CType(Framework.Reflection.CreateObject("email"), EmailProvider)
            'If objProvider Is Nothing Then
            'Throw New System.Exception("Provider Not Found")
            'End If
        End Sub

        ' return the provider
        Public Shared Shadows Function Instance() As EmailProvider
            If objProvider Is Nothing Then
                SyncLock [syncLock]
                    If objProvider Is Nothing Then
                        objProvider = New EmailProvider()
                    End If
                End SyncLock
            End If
            Return objProvider
        End Function

#End Region


#Region "abstract Methods"

        'Add Email to Send Query
        'Public Sub AddToQuery(ByVal PortalID As Integer, ByRef Subject As String, ByRef Message As String, ByVal NameTo As String, ByVal EmailTo As String)
        ' emaillState: 1 - In Query, 2 - Sending, 3 - Sent, 4 - Failured ... 
        'Public Function GetQueryByState(ByVal State As Integer, ByRef ErrorMessage As String) As ArrayList
        '
        'Public Sub Start()
        Public Sub AddToQuery(ByVal PortalID As Integer, ByRef Subject As String, ByRef Message As String, ByVal NameTo As String, ByVal EmailTo As String)

            'Validation
            Dim RecipientID As Integer = EmailRecipientInfo.CheckThis(NameTo, EmailTo, "")
            If RecipientID > 0 Then
                Dim EmailRecipientInfo As EmailRecipientInfo = EmailRecipientInfo.GetThis(RecipientID)

                Dim objMessage As EmailMessageInfo = New EmailMessageInfo(Subject, Message, -1, Date.Today, -1, Date.Today)
                Dim MessageID As Integer = objMessage.AddThis()
                Dim objPortal As EmailPortalInfo = EmailPortalInfo.GetThisByPortalID(PortalID)

                Dim objEmailMessageState As New EmailMessageStateInfo()
                objEmailMessageState.EmailMessageID = MessageID
                objEmailMessageState.EmailRecipientID = RecipientID
                objEmailMessageState.EmaillStateID = 1 'in query
                objEmailMessageState.EmailPortalID = objPortal.EmailPortalID
                objEmailMessageState.AddThis()
            Else
                'EmailTo is invalid
            End If


        End Sub

        Public Function GetQueryByState(ByVal State As Integer, ByRef ErrorMessage As String) As System.Collections.ArrayList
            Return New ArrayList()
        End Function


        Public Sub Start()

            If isActive = False Then

                Try
                    mailingList = EmailQueryInfo.GetEmailQueryInfo()
                    'Dim Portals As ArrayList = emailQueryInfo.GetEmailQueryInfo()
                    isActive = True
                Catch ex As Exception
                    isActive = False
                    DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
                End Try


                For Each ems As EmailQueryInfo In mailingList
                    Try
                        CurrentEmailQuery = ems
                        ems.SetSending()
                        ems.MessageBody = ems.MessageBody.Replace("[UnsubscribeKey]", ems.ControlKey)
                  
                        'Dim mmm As New MailMergeMessage()

                        'mmm.TextTransferEncoding = System.Net.Mime.TransferEncoding.Base64
                        'mmm.BinaryTransferEncoding = System.Net.Mime.TransferEncoding.Base64
                        'mmm.CharacterEncoding = Encoding.UTF8
                        'mmm.CultureInfo = New System.Globalization.CultureInfo("ru-RU")

                        'mmm.Subject = ems.Subject.Replace(ControlChars.Cr, " "c).Replace(ControlChars.Lf, " "c)
                        'mmm.Subject = ParseRFC2047(ems.Subject)
                        'mmm.HtmlText = ems.MessageBody
                        'mmm.PlainText = Core.HTML2Text(ems.MessageBody)

                        'mmm.MailMergeAddresses.Add(New MailMergeAddress(MailAddressType.From, ems.SmtpUserName, ems.SmtpUserName))
                        'mmm.MailMergeAddresses.Add(New MailMergeAddress(MailAddressType.To, ems.RecipientEmail, ems.RecipientName))

                        Dim mm As New MailMessage()
                        mm.BodyEncoding = Encoding.UTF8
                        mm.IsBodyHtml = True
                        mm.SubjectEncoding = Encoding.UTF8
                        mm.Subject = ParseRFC2047(ems.Subject)
                        mm.From = New MailAddress(ems.SmtpUserName, ems.SmtpUserName)
                        mm.To.Add(New MailAddress(ems.RecipientEmail, ems.RecipientName))
                        mm.Body = ems.MessageBody


                        Dim ps As New DotNetNuke.Security.PortalSecurity

                        'Dim mailSender As New MailMergeSender()
                        'mailSender.SmtpHost = ems.SmtpServer
                        'mailSender.SmtpPort = ems.SmtpPort
                        'mailSender.EnableSsl = ems.UseSSL
                        'mailSender.SetSmtpAuthentification(ems.SmtpUserName, ps.Decrypt("SecretKey", ems.SmtpPassword))
                        'mailSender.LocalHostName = "localhost"

                        'AddHandler mailSender.OnAfterSend, AddressOf SetComplete
                        'mailSender.MessageOutput = MessageOutput.SmtpServer
                        'mailSender.Send(mmm)

                        Dim client As New SmtpClient()
                        client.Credentials = New System.Net.NetworkCredential(ems.SmtpUserName, ps.Decrypt("SecretKey", ems.SmtpPassword))
                        client.Port = ems.SmtpPort
                        ''Port 25 (SMTP), 587 (SMTP with SSL) as gmail.
                        client.Host = ems.SmtpServer
                        client.EnableSsl = ems.UseSSL
                        client.DeliveryMethod = SmtpDeliveryMethod.Network
                        client.Send(mm)


                        ems.SetSent()
                        'CurrentEmailQuery.SetSent()


                        CurrentEmailQuery = Nothing
                    Catch ex As System.Net.Mail.SmtpException
                        CurrentEmailQuery.SetFailure()
                        CurrentEmailQuery = Nothing
                        DotNetNuke.Services.Exceptions.Exceptions.LogException(ex)
                        'Catch mex As MailMergeLib.MailMergeMessage.MailMergeMessageException
                        '   CurrentEmailQuery.SetFailure()
                        '  CurrentEmailQuery = Nothing
                        ' DotNetNuke.Services.Exceptions.Exceptions.LogException(mex)
                    End Try
                Next
                isActive = False
            End If
        End Sub

        Public Sub StartTimer()
            If threadingTimer Is Nothing Then
                threadingTimer = New Timer(New TimerCallback(AddressOf CheckData), HttpContext.Current, 0, 20000)
            End If
        End Sub

        Private Shared Sub CheckData(ByVal sender As Object)
            'ToDo check Data

        End Sub


        'Private Shared Sub SetComplete(ByVal osc As Object, ByVal arg As MailSenderAfterSendEventArgs)
        '    'Dim sc As SmtpClient = TryCast(osc, SmtpClient)
        '    'If Not sc Is Nothing Then
        '    If Not arg.Error Is Nothing Then
        '        DotNetNuke.Services.Exceptions.Exceptions.LogException(arg.Error)
        '    Else
        '        CurrentEmailQuery.SetSent()
        '        CurrentEmailQuery = Nothing
        '    End If
        '    'End If
        'End Sub


       


        Public ReadOnly Property ActiveEmailQuery() As EmailQueryInfo
            Get
                ActiveEmailQuery = CurrentEmailQuery
            End Get
        End Property

        'http://www.faqs.org/rfcs/rfc2047.html
        Public Shared Function ParseRFC2047(ByRef subject As String) As String

            Dim encoding As New System.Text.UTF8Encoding
            '$output = '';
            Dim result As String = subject
            result = result.Replace(System.Environment.NewLine, "")
            '$chunk_size = 47; // floor((75 - strlen("=?UTF-8?B??=")) * 0.75);
            Dim chunk_size As Integer = 47
            '$len = strlen($string);
            Dim len As Integer = subject.Length



            'For pos As Integer = 0 To len - 1
            'Dim posChar As Char = subject.Substring(pos, 1)
            'If AscW(posChar) > 128 Then
            'result = result.Replace(posChar, System.Convert.ToBase64String(encoding.GetBytes(posChar)))
            '    End If
            'Next

            'if (preg_match('/[^\x20-\x7E]/', $string)) {         


            'while ($len > 0) {
            ' $chunk = drupal_truncate_bytes($string, $chunk_size);
            '$output .= ' =?UTF-8?B?'. base64_encode($chunk) ."?=\n";
            '$c = strlen($chunk);
            '$string = substr($string, $c);
            '$len -= $c;
            '}
            'return trim($output);
            '}

            Dim strtemplate = "=?UTF-8?B?{0}?= "
            If subject.Length \ 39 = 0 Then
                Return String.Format(strtemplate, ToBase64(subject))
            Else
                If subject.Length > 78 Then
                    result = String.Format(strtemplate, ToBase64(result.Substring(0, 39))) & String.Format(strtemplate, ToBase64(result.Substring(38, 39)))
                Else
                    result = String.Format(strtemplate, ToBase64(result.Substring(0, 39))) & String.Format(strtemplate, ToBase64(result.Substring(39, result.Length - 39)))
                End If
            End If
            Return result
            Return result
        End Function


        Public Shared Function ToBase64(ByVal UTFString As String) As String
            Dim encoding As New System.Text.UTF8Encoding
            Return System.Convert.ToBase64String(encoding.GetBytes(UTFString))
        End Function

        'Dim result As String = String.Empty
        'Dim encoding As New System.Text.UTF8Encoding
        'Dim strtemplate = "=?UTF-8?B?{0}?= "
        '    If subject.Length \ 39 = 0 Then
        '        Return String.Format(strtemplate, System.Convert.ToBase64String(encoding.GetBytes(subject)))
        '    Else
        '        If subject.Length > 78 Then
        '            result &= String.Format(strtemplate, System.Convert.ToBase64String(encoding.GetBytes(subject), 0, 39))
        '            result &= String.Format(strtemplate, System.Convert.ToBase64String(encoding.GetBytes(subject), 39, 39))
        '        Else
        '            result &= String.Format(strtemplate, System.Convert.ToBase64String(encoding.GetBytes(subject), 0, 39))
        '            result &= String.Format(strtemplate, System.Convert.ToBase64String(encoding.GetBytes(subject), 38, subject.Length - 39))
        '        End If
        '    End If
        '    Return result

#End Region
    End Class






End Namespace

