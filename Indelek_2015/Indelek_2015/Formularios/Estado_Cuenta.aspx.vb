Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms

Imports System.Web.UI.ScriptManager

Public Class Estado_Cuenta
    Inherits System.Web.UI.Page

    Dim Datos As New DataTable


    Sub Consulta_Estado_Cuenta()
        Dim loComando As SqlCommand
        Dim lnCliente As Integer
        Dim lcImagen As String
        Dim ldFecha1,
            ldFecha2 As Date


        lcImagen = Session("lcRaiz").ToString + "Imagenes/logotipo.jpg"
        lnCliente = AInt(Session("nCliente"))
        ldFecha1 = ADate(Me.txtFecha.Text)
        ldFecha2 = ADate(Me.txtFecha2.Text)

        loComando = Crea_SP("Estado_Cuenta_WEB")
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
        Agrega_Parametro(loComando, "dFecha1", "D", ldFecha1, 0)
        Agrega_Parametro(loComando, "dFecha2", "D", ldFecha2, 0)
        Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)

        Carga_Tabla(loComando, Datos)

        Me.loReporte.LocalReport.ReportPath = "Reportes/Rep_Estado_Cuenta.rdlc"

        Dim rds As ReportDataSource = New ReportDataSource()

        rds.Name = "DataSet1"
        rds.Value = Datos

        Dim loParametros As New ReportParameter("lcImagen", lcImagen.Trim, True)
        loReporte.LocalReport.EnableExternalImages = True
        loReporte.LocalReport.SetParameters(loParametros)

        loReporte.LocalReport.DataSources.Add(rds)
        loReporte.LocalReport.Refresh()
    End Sub

#Region "Ejemplo para Cargar Datos, Datos1, Datos2 del SQL"
    Sub Ejemplo()
        'Crea_Campo(Datos, "reporte", "I")
        'Crea_Campo(Datos, "cara_confianza", "C")

        'loComando = Crea_SP("Consulta_Reporte_Semanal_2011")

        'Agrega_Parametro(loComando, "nProyecto", "I", lnProyecto, 0)
        'Agrega_Parametro(loComando, "dFecha", "D", Me.ctrlFecha.Value, 0)

        'loReader = loComando.ExecuteReader()

        'Carga_Lector(Datos, loReader)
        'Carga_Lector(Siguientes_Acciones, loReader)
        'Carga_Lector(Metricas, loReader)

        'oConexion.Close()
    End Sub
#End Region


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If AInt(Session("nCliente")) <> 0 Then
            If Not Me.IsPostBack Then
                Me.txtFecha.Text =
                    Date.Now.Year.ToString + "-" + (Date.Now.Month - 2).ToString + "-" + Date.Now.Day.ToString

                Me.txtFecha2.Text =
                    Date.Now.Year.ToString + "-" + Date.Now.Month.ToString + "-" + Date.Now.Day.ToString
            End If
        Else
            Session("lcRegresar") = Request.Path
            Response.Redirect("Login.aspx")
        End If

    End Sub

    Protected Sub cmdEstado_Centa_Click(sender As Object, e As EventArgs) Handles cmdEstado_Centa.Click
        Me.Consulta_Estado_Cuenta()
    End Sub
End Class