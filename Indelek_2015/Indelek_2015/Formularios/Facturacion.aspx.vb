Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms
Imports System.Web.UI.ScriptManager

Public Class Facturacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Carga_Default()

        If Not Me.IsPostBack Then
            If AInt(Session("nCliente")) = 0 Then

                Session("lcRegresar") = Request.Path
                Response.Redirect("Login.aspx")
            End If
        End If
    End Sub


    Sub Carga_Default()
        Dim loComando As SqlCommand
        Dim Datos As New DataTable
        Dim lcNombre As String


        If Session("cNombre_Cliente") <> Nothing Then
            lcNombre = Session("cNombre_Cliente").ToString.Trim() + " Salir"
        Else
            lcNombre = ""
        End If

     
        loComando = Crea_SP("Carga_Valores_Web")
        Carga_Tabla(loComando, Datos)

        Session("lcRaiz") = Valor(Datos, "directorio_raiz")

        If Session("lcRegresar") = Nothing Then
            Session("lcRegresar") = "Principal.aspx"
        End If

        If AInt(Session("nCliente")) <> 0 Then
            Page.ClientScript.RegisterStartupScript(
                Me.GetType(),
                "",
                "Activar_Sesion('" + lcNombre + "')", True)
        Else
            Page.ClientScript.RegisterStartupScript(
                Me.GetType(),
                "",
                "Activar_Sesion('DesActivar')", True)
        End If


    End Sub

    Sub Consulta_Reporte()
        Dim loComando As SqlCommand

        Dim Datos As New DataTable
        Dim Datos_Generales As New DataTable
        Dim Resultado As New DataTable
        Dim lcNombre = "",
            lcDomicilio,
            lcRFC,
            lcTelefono,
            lcCantidad_Letras,
            lcImagen,
            lcQR As String
        Dim lnCliente,
            lnFactura As Integer


        lnFactura = AInt(Me.txtFactura.Text)

        loComando = Crea_SP("Consulta_Datos_Generales_WEB")
        Agrega_Parametro(loComando, "nFactura", "I", lnFactura, 0)
        Carga_Tabla(loComando, Datos_Generales)

        lcNombre = Valor(Datos_Generales, "nombre")
        lcDomicilio = Valor(Datos_Generales, "domicilio").Trim
        lcRFC = Valor(Datos_Generales, "rfc").ToString.Trim
        lcTelefono = Valor(Datos_Generales, "telefono")
        lcImagen = Session("lcRaiz").ToString + "Imagenes/logotipo.jpg"

        loComando = Nothing

        loComando = Crea_SP("Rep_Factura_ERP")
        Agrega_Parametro(loComando, "nFactura", "I", lnFactura, 0)

        Carga_Tabla(loComando, Resultado)

        If Resultado.Rows.Count <> 0 Then
            lcCantidad_Letras = Numero_Letras(Valor(Resultado, "total", 1).ToString)
            ' lcQR = Genera_QR(AInt(Valor(Resultado, "factura", 1)), AInt(Session("nCliente")), "Factura")

            lnCliente = AInt(Session("nCliente"))

            If lnCliente <> AInt(Valor(Resultado, "cliente")) Then
                Me.lblError.Text =
                    "La Factura " + Valor(Resultado, "factura", 1).ToString +
                    " pertenece a otro Cliente" + vbCrLf +
                    " - Favor de Revisarla"

                Me.lblError.Visible = True
            Else
                Me.loReporte.LocalReport.ReportPath = "Reportes/Rep_Factura.rdlc"

                Dim rds As ReportDataSource = New ReportDataSource()

                rds.Name = "DataSet1"
                rds.Value = Resultado

                lcCantidad_Letras = StrConv(lcCantidad_Letras, vbProperCase)
                lcNombre = StrConv(lcNombre, vbProperCase)

                Dim loParametro_Imagen As New ReportParameter("cImagen", lcImagen.Trim, True)
                Dim loParametro_Nombre As New ReportParameter("cNombre_Cliente", lcNombre.Trim, True)
                Dim loParametro_Domicilio As New ReportParameter("cDomicilio", lcDomicilio.Trim, True)
                Dim loParametro_RFC As New ReportParameter("cRFC", lcRFC.Trim, True)
                Dim loParametro_Telefono As New ReportParameter("cTelefonos", lcTelefono.Trim, True)
                Dim loParametro_Letras As New ReportParameter("cCantidad_Letras", lcCantidad_Letras.Trim, True)
                Dim loParametro_QR As New ReportParameter("cQR", lcQR.Trim, True)

                loReporte.LocalReport.EnableExternalImages = True
                loReporte.LocalReport.SetParameters(loParametro_Imagen)
                loReporte.LocalReport.SetParameters(loParametro_Nombre)
                loReporte.LocalReport.SetParameters(loParametro_Domicilio)
                loReporte.LocalReport.SetParameters(loParametro_RFC)
                loReporte.LocalReport.SetParameters(loParametro_Telefono)
                loReporte.LocalReport.SetParameters(loParametro_Letras)
                loReporte.LocalReport.SetParameters(loParametro_QR)

                loReporte.LocalReport.DataSources.Add(rds)
                loReporte.LocalReport.Refresh()
            End If
        Else
            Me.lblError.Text = "El Número de Factura es Incorrecto"
            Me.lblError.Visible = True
        End If
    End Sub

    Protected Sub cmdFactura_Click(sender As Object, e As EventArgs) Handles cmdFactura.Click
        Me.lblError.Visible = False
        Me.lblError.Text = ""

        Me.Consulta_Reporte()
    End Sub
End Class