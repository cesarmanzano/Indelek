Imports System.Data.SqlClient

Public Class Muestra_Articulo
    Inherits System.Web.UI.Page

    Private Sub Carga_Articulos()
        Dim lcOpcion,
            lcFolio As String
        Dim lnCuantos As Integer

        lcFolio = Request.QueryString("lcFolio")
        lnCuantos = AInt(Request.QueryString("lnCuantos"))

        If lnCuantos = 3 Then
            lcOpcion = "familia"
        ElseIf lnCuantos = 2 Then
            lcOpcion = "sublinea"
        Else
            lcOpcion = "linea"
        End If

        Dim loComando As SqlCommand
        Dim Articulos As New DataTable

        loComando = Crea_SP("Consulta_Articulos_Web")
        Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
        Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
        Agrega_Parametro(loComando, "cOpcion", "C", lcOpcion, 20)
        Agrega_Parametro(loComando, "cFolio", "C", lcFolio, 7)

        Carga_Tabla(loComando, Articulos)

        Me.Lista_Articulos.DataSource = Articulos
        Me.Lista_Articulos.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.Carga_Articulos()            
        End If

        'Session("lcRegresar") = Request.Path + "?lcFolio=" + lcFolio + "&lnCuantos=" + lnCuantos.ToString
    End Sub

    Protected Sub Lista_Articulos_PagePropertiesChanging(sender As Object, e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs) Handles Lista_Articulos.PagePropertiesChanging
        Dim loPaginas As DataPager = Lista_Articulos.FindControl("PaginasDatos")

        If (Lista_Articulos.Items.Count <> loPaginas.TotalRowCount) Then
            loPaginas.SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
            Lista_Articulos.DataBind()
        End If
    End Sub

    Protected Sub Lista_Articulos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Lista_Articulos.SelectedIndexChanged

    End Sub
End Class