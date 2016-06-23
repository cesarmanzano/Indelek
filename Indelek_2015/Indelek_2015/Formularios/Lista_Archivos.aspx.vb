Imports System
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data

Public Class Lista_Archivos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim Lista_Archivos As New DataTable '= Servicios.Archivos_Binarios()

            Lista_Archivos = Archivos_Binarios()

            Me.grdArchivos.DataSource = Lista_Archivos
            Me.grdArchivos.DataBind()
        End If
    End Sub

End Class