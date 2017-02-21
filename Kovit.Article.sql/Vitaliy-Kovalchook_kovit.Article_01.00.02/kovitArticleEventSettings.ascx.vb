 
Imports DotNetNuke
Imports System.Web.UI
Imports DotNetNuke.Entities.Modules
Imports Kovit.kovitArticle.Data

Namespace Kovit.Modules.kovitArticle

    ''' -----------------------------------------------------------------------------
    ''' <summary>
    ''' The Settings class manages Module Settings
    ''' </summary>
    ''' <remarks>
    ''' </remarks>
    ''' <history>
    ''' </history>
    ''' -----------------------------------------------------------------------------
    Partial Class EventSettings
        Inherits Entities.Modules.ModuleSettingsBase

#Region "Base Method Implementations"

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' LoadSettings loads the settings from the Database and displays them
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub LoadSettings()
            Dim ErrorMessage As String = String.Empty
            Try
                If (Page.IsPostBack = False) Then
                    ' FILL Aviable Target Tabs

                    ddTargetTab.DataSource() = ArticleCategoryInfo.GetTargetTabList(ErrorMessage, PortalId)
                    ddTargetTab.DataBind()
                    If Not String.IsNullOrEmpty(TabModuleSettings("TargetTab")) Then
                        ddTargetTab.SelectedValue = TabModuleSettings("TargetTab")
                    End If
                End If
            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
                lblError.Text = exc.Message
                lblError.Visible = True
            End Try
        End Sub

        ''' -----------------------------------------------------------------------------
        ''' <summary>
        ''' UpdateSettings saves the modified settings to the Database
        ''' </summary>
        ''' <remarks>
        ''' </remarks>
        ''' <history>
        ''' </history>
        ''' -----------------------------------------------------------------------------
        Public Overrides Sub UpdateSettings()
            Dim ErrorMessage As String = String.Empty
            Try
                Dim objModules As New Entities.Modules.ModuleController


                objModules.UpdateTabModuleSetting(TabModuleId, "TargetTab", ddTargetTab.SelectedValue)

                ' refresh cache

                ModuleController.SynchronizeModule(Me.ModuleId)
            Catch exc As Exception           'Module failed to load
                ProcessModuleLoadException(Me, exc)
                lblError.Text = exc.Message
                lblError.Visible = True
            End Try
            If Not String.IsNullOrEmpty(ErrorMessage) Then
                lblError.Text = ErrorMessage
                lblError.Visible = True
            End If
        End Sub

#End Region

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

            
            
        End Sub
    End Class

End Namespace

