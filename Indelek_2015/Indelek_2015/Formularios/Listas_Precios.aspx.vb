Imports System.Data.SqlClient
Imports Microsoft.Reporting.WebForms

Public Class Listas_Precios
    Inherits System.Web.UI.Page

    Dim loComando As SqlCommand
    Dim loLineas,
        loMarcas, Datos As New DataTable

    Sub Carga_Combos()        

        loComando = Crea_SP("Combo_Lineas")
        Carga_Tabla(loComando, loLineas)

        Me.cboLineas.DataSource = loLineas
        Me.cboLineas.DataTextField = StrConv("nombre_linea", VbStrConv.ProperCase)
        Me.cboLineas.DataValueField = "linea"
        Me.cboLineas.SelectedIndex = 0

        Me.cboLineas.DataBind()


        loComando = Crea_SP("Combo_Marcas")
        Carga_Tabla(loComando, loMarcas)

        Me.cboMarcas.DataSource = loMarcas
        Me.cboMarcas.DataTextField = StrConv("nombre_marca", VbStrConv.ProperCase)
        Me.cboMarcas.DataValueField = "marca"
        Me.cboMarcas.SelectedIndex = 0

        Me.cboMarcas.DataBind()

    End Sub

    Sub Consulta_Lista()
        Dim loComando As SqlCommand
        Dim lnCliente As Integer
        Dim lcFolio, lcOpcion As String

        lcOpcion = "Toda"
        lcFolio = ""

        If Me.rbLinea.Checked Then
            lcOpcion = "Línea de Artículos"
            lcFolio = Me.cboLineas.SelectedValue
        ElseIf Me.rbMarca.Checked Then
            lcOpcion = "Marca"
            lcFolio = Me.cboMarcas.SelectedValue
        End If

        lnCliente = AInt(Session("nCliente"))

        loComando = Crea_SP("Rep_Lista_Precios_Web")
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
        Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
        Agrega_Parametro(loComando, "cFolio", "C", lcFolio, 7)
        Agrega_Parametro(loComando, "cOpcion", "C", lcOpcion, 20)
        Carga_Tabla(loComando, Datos)

        Me.loReporte.LocalReport.ReportPath = "Reportes/Rep_Lista_Precios.rdlc"

        Dim rds As ReportDataSource = New ReportDataSource()

        rds.Name = "DataSet"
        rds.Value = Datos

        Dim loParametros As New ReportParameter("lcImagen", Session("lcRaiz").ToString + "Imagenes/logotipo.jpg", True)
        loReporte.LocalReport.EnableExternalImages = True
        loReporte.LocalReport.SetParameters(loParametros)

        loReporte.LocalReport.DataSources.Add(rds)
        loReporte.LocalReport.Refresh()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If AInt(Session("nCliente")) <> 0 Then
            If Not Me.IsPostBack Then
                Me.Carga_Combos()
            End If
        Else
            Session("lcRegresar") = Request.Path
            Response.Redirect("Login.aspx")
        End If
    End Sub

    Protected Sub cmdConsultar_Click(sender As Object, e As EventArgs) Handles cmdConsultar.Click
        Me.Consulta_Lista()
    End Sub
End Class