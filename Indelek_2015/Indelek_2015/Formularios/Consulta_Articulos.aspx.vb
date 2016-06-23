Imports System.Data.SqlClient

Public Class Consulta_Articulos
    Inherits System.Web.UI.Page

    Dim Articulos As New DataTable
    Dim lcFolio As String
    Dim lnCuantos_Articulos As Integer

    Private Sub Carga_Articulos()
        Dim lcOpcion As String
        Dim lcMarca,
            lcPrecio As String
        Dim lnCuantos As Integer

        lnCuantos = AInt(Request.QueryString("lnCuantos"))
        lcMarca = Request.QueryString("cMarca")
        lcPrecio = Request.QueryString("cPrecio")

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
        Agrega_Parametro(loComando, "cMarca", "C", lcMarca, 50)
        Agrega_Parametro(loComando, "cPrecio", "C", lcPrecio, 50)

        Carga_Tabla(loComando, Articulos)

        Session("oLista_Articulos") = Articulos

        Me.Lista_Articulos.DataSource = Articulos
        Me.Lista_Articulos.DataBind()

        If Articulos.Rows.Count > 0 Then
            Me.Carga_Filtros(True)
        End If

        lnCuantos_Articulos = Articulos.Rows.Count
    End Sub

    Private Sub Carga_Filtros(ByVal llLSF As Boolean)
        Dim loComando As SqlCommand
        Dim Tabl_Filtros_Marca As New DataTable
        Dim Tabla_Filtros_Precio As New DataTable

        Dim lcMarca,
            lcPrecio As String

        Dim lcOpcion,
            lcNombre,
            lcClave As String
        Dim lnCuantos As Integer

        lcNombre = Request.QueryString("cTexto")
        lcClave = Request.QueryString("lcClave")
        lnCuantos = AInt(Request.QueryString("lnCuantos"))
        lnCuantos = AInt(Request.QueryString("lnCuantos"))
        lcMarca = Request.QueryString("cMarca")
        lcPrecio = Request.QueryString("cPrecio")

        If llLSF Then
            If lnCuantos = 3 Then
                lcOpcion = "familia"
            ElseIf lnCuantos = 2 Then
                lcOpcion = "sublinea"
            Else
                lcOpcion = "linea"
            End If

            loComando = Crea_SP("Busca_Filtros_Web_LSF")
            Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "cFolio", "V", lcFolio, 7)
            Agrega_Parametro(loComando, "cOpcion", "V", lcOpcion, 50)
            Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
            Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)
            Agrega_Parametro(loComando, "lMarca", "L", True, 0)

            Carga_Tabla(loComando, Tabl_Filtros_Marca)

            loComando = Crea_SP("Busca_Filtros_Web_LSF")
            Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "cFolio", "V", lcFolio, 7)
            Agrega_Parametro(loComando, "cOpcion", "V", lcOpcion, 50)
            Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
            Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)

            Carga_Tabla(loComando, Tabla_Filtros_Precio)
        Else
            loComando = Crea_SP("Busca_Filtros_Web")
            Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 50)
            Agrega_Parametro(loComando, "cClave", "V", lcClave, 50)
            Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
            Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)
            Agrega_Parametro(loComando, "lMarca", "L", True, 0)

            Carga_Tabla(loComando, Tabl_Filtros_Marca)

            loComando = Crea_SP("Consulta_Filtros_Precio")
            Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 50)
            Agrega_Parametro(loComando, "cClave", "V", lcClave, 50)
            Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
            Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)

            Carga_Tabla(loComando, Tabla_Filtros_Precio)
        End If


        Me.Filtros_Marca.DataSource = Tabl_Filtros_Marca
        Me.Filtros_Precios.DataSource = Tabla_Filtros_Precio

        Session("oLista_Filtros_Marca") = Tabl_Filtros_Marca
        Session("oLista_Filtros_Precio") = Tabla_Filtros_Precio

        Me.Filtros_Marca.DataBind()
        Me.Filtros_Precios.DataBind()
    End Sub

    Private Sub Cargar_Lista()
        If Not Me.IsPostBack() Then

            Dim lcClave As String = ""
            Dim lcNombre As String = ""
            Dim lcMarca As String = ""
            Dim lcPrecio As String = ""

            lcClave = Request.QueryString("cTexto")
            lcNombre = Request.QueryString("cTexto")
            lcMarca = Request.QueryString("cMarca")
            lcPrecio = Request.QueryString("cPrecio")


            If Not String.IsNullOrEmpty(lcNombre) Then
                Dim loComando As SqlCommand

                loComando = Crea_SP("Busca_Articulos_Web_Indelek")
                Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
                Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
                Agrega_Parametro(loComando, "cClave", "V", lcClave, 50)
                Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 50)
                Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
                Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)


                Carga_Tabla(loComando, Articulos)

                Session("oLista_Articulos") = Articulos

                Me.Lista_Articulos.DataSource = Articulos
                Me.Lista_Articulos.DataBind()

                If Articulos.Rows.Count > 0 Then
                    Me.Carga_Filtros(False)
                End If

                lnCuantos_Articulos = Articulos.Rows.Count
            End If
        End If
    End Sub

    Private Sub Carga_Pagina()
        Dim lcClave,
            lcNombre,
            lcMarca,
            lcPrecio,
            lnCuantos,
            lnPagina As String
        Dim lnInicial,
            lnFinal As Integer
        Dim lnDiferencia_MiliSegundos As Decimal

        lcFolio = Request.QueryString("lcFolio")
        lcClave = Request.QueryString("cTexto")
        lcNombre = Request.QueryString("cTexto")
        lcMarca = Request.QueryString("cMarca")
        lcPrecio = Request.QueryString("cPrecio")
        lnCuantos = Request.QueryString("lnCuantos")
        lnPagina = Request.QueryString("page")

        If Not String.IsNullOrEmpty(lcFolio) Then
            If (lcFolio.Length < 7) And Not String.IsNullOrEmpty(lcFolio) Then
                lcFolio = Space(7 - lcFolio.Length) + lcFolio
            End If
        End If

        lnInicial = Math.Abs(Environment.TickCount)

        If Not String.IsNullOrEmpty(lcFolio) Then
            Session("lcRegresar") =
                Request.Path +
                "?lcFolio=" + lcFolio +
                "&lcClave=" + lcClave +
                "&lnCuantos=" + lnCuantos +
                "&cMarca=" + lcMarca +
                "&cPrecio=" + lcPrecio +
                "&page=" + lnPagina

            Me.Carga_Articulos()
        Else
            Session("lcRegresar") =
                Request.Path +
                    "?lcClave=" + lcClave +
                    "&cTexto=" + lcNombre +
                    "&cMarca=" + lcMarca +
                    "&cPrecio=" + lcPrecio +
                    "&page=" + lnPagina

            Me.Cargar_Lista()
        End If

        lnFinal = Math.Abs(Environment.TickCount)
        lnDiferencia_MiliSegundos = Math.Abs(lnFinal - lnInicial) / 1000

        If lnCuantos_Articulos <> 0 Then
            Me.lblContador.Text =
                "Aproximadamente " +
                lnCuantos_Articulos.ToString +
                " artículos ( " +
                lnDiferencia_MiliSegundos.ToString +
                " segundos)"
        Else
            Me.lblContador.Text = ""
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim loTabla_Articulos As DataTable
        Dim llFiltro_Marca As Boolean = False
        Dim llFiltro_Precio As Boolean = False

        If Not Me.IsPostBack Then

            loTabla_Articulos = DirectCast(Session("oLista_Articulos"), DataTable)

            If loTabla_Articulos Is Nothing Then
                Me.Carga_Pagina()
            Else
                If loTabla_Articulos.Rows.Count = 0 Then
                    Me.Carga_Pagina()
                Else
                    llFiltro_Marca = ABol(Request.QueryString("llMarca"))
                    llFiltro_Precio = ABol(Request.QueryString("llPrecio"))


                    If llFiltro_Marca Or llFiltro_Precio Then
                        Me.Carga_Pagina()
                    Else
                        Me.Lista_Articulos.DataSource = loTabla_Articulos

                        Me.Filtros_Marca.DataSource = DirectCast(Session("oLista_Filtros_Marca"), DataTable)
                        Me.Filtros_Precios.DataSource = DirectCast(Session("oLista_Filtros_Precio"), DataTable)

                        Me.Lista_Articulos.DataBind()
                        Me.Filtros_Marca.DataBind()
                        Me.Filtros_Precios.DataBind()
                    End If

                End If
            End If
        End If
    End Sub

    Protected Sub Lista_Articulos_PagePropertiesChanging(sender As Object, e As System.Web.UI.WebControls.PagePropertiesChangingEventArgs) Handles Lista_Articulos.PagePropertiesChanging

        Dim loPaginas As DataPager = Lista_Articulos.FindControl("PaginasDatos")

        If (Lista_Articulos.Items.Count <> loPaginas.TotalRowCount) Then
            loPaginas.SetPageProperties(e.StartRowIndex, e.MaximumRows, False)
            Lista_Articulos.DataBind()
        End If

    End Sub


End Class