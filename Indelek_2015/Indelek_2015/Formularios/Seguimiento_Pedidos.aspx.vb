Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Web.UI.ScriptManager

Public Class Seguimiento_Pedidos
    Inherits System.Web.UI.Page

    Dim Datos As New DataTable

    Sub Consulta_Pedidos_Cliente()
        Dim loComando As SqlCommand
        Dim lnCliente As Integer
        Dim ldFecha As DateTime
        Dim lcImagen As String

        lnCliente = AInt(Session("nCliente"))
        ldFecha = ADate(Me.txtFecha.Text)

        lcImagen = Session("lcRaiz").ToString + "Imagenes/logotipo.jpg"

        loComando = Crea_SP("Seguimiento_Pedidos_Web")        
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
        Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
        Agrega_Parametro(loComando, "dFecha", "D", ldFecha, 0)
        Carga_Tabla(loComando, Datos)

        Me.loReporte.LocalReport.ReportPath = "Reportes/Seguimiento_Pedidos.rdlc"

        Dim rds As ReportDataSource = New ReportDataSource()

        rds.Name = "DataSet1"
        rds.Value = Datos

        Dim loParametros As New ReportParameter("lcImagen", lcImagen.Trim, True)
        loReporte.LocalReport.EnableExternalImages = True
        loReporte.LocalReport.SetParameters(loParametros)

        loReporte.LocalReport.DataSources.Add(rds)
        loReporte.LocalReport.Refresh()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If AInt(Session("nCliente")) = 0 Then
                Session("lcRegresar") = Request.Path
                Response.Redirect("Login.aspx")
            End If
            Me.txtFecha.Text = (Date.Now.Year - 1).ToString + "-" + (Date.Now.Month).ToString + "-" + Date.Now.Day.ToString
        End If
    End Sub

    Protected Sub cmdConsultar_Click(sender As Object, e As EventArgs) Handles cmdConsultar.Click
        Me.Consulta_Pedidos_Cliente()
    End Sub
End Class