Imports Microsoft.VisualBasic

Imports Kovit.Article.Data

Namespace Email
    Public Class EmailProviderScheduler
        Inherits DotNetNuke.Services.Scheduling.SchedulerClient


        Public Sub New(ByVal objScheduleHistoryItem As _
        DotNetNuke.Services.Scheduling.ScheduleHistoryItem)
            MyBase.New()
            Me.ScheduleHistoryItem = objScheduleHistoryItem
        End Sub


        Public Overrides Sub DoWork()
            Try
                Me.Progressing()
                'run process
                EmailProvider.Instance().Start()
                Me.ScheduleHistoryItem.Succeeded = True
                Me.ScheduleHistoryItem.AddLogNote("Email processing completed at " & DateTime.Now.ToShortDateString() & " " & DateTime.Now.ToShortTimeString())
                Me.Completed()
            Catch ex As Exception
                Me.ScheduleHistoryItem.Succeeded = False
                Me.ScheduleHistoryItem.AddLogNote("Email processing failed at " & DateTime.Now.ToShortDateString() & " " & DateTime.Now.ToShortTimeString() & ex.Message)
                Me.Errored(ex)
                Me.Completed()
            End Try
        End Sub
    End Class
End Namespace