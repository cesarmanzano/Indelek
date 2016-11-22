Imports System.Data.SqlClient

Public Class Prueba
    Inherits System.Web.UI.Page

    Sub Bind_Datos()

        Me.Lista_Articulos.DataSource = DirectCast(Session("oLista_Articulos"), DataTable)
        Me.Filtros_Marca.DataSource = DirectCast(Session("oLista_Filtros_Marca"), DataTable)
        Me.Filtros_Precios.DataSource = DirectCast(Session("oLista_Filtros_Precio"), DataTable)
        Me.total_art.Text = "Total artículos: " + DirectCast(Session("oTotal_Articulos"), Integer).ToString()

        Me.Lista_Articulos.DataBind()
        Me.Filtros_Marca.DataBind()
        Me.Filtros_Precios.DataBind()
    End Sub

    Sub Consulta_SQL()
        Dim lcClave,
           lcNombre,
           lcMarca,
           lcPrecio,
           lcLSF,
           lcOpcion As String
        Dim lnCuantos As Integer

        lcLSF = Request.QueryString("cLSF")
        lcClave = Request.QueryString("cTexto")
        lcNombre = Request.QueryString("cTexto")
        lcMarca = Request.QueryString("cMarca")
        lcPrecio = Request.QueryString("cPrecio")
        lnCuantos = AInt(Request.QueryString("lnCuantos"))


        If Not String.IsNullOrEmpty(lcNombre) Or
            Not String.IsNullOrEmpty(lcLSF) Then
            Dim lnTotal_art As Integer
            Dim loComando As SqlCommand
            Dim loLector As SqlDataReader
            Dim Articulos As New DataTable
            Dim Marcas As New DataTable
            Dim Precios As New DataTable

            If lnCuantos = 3 Then
                lcOpcion = "familia"
            ElseIf lnCuantos = 2 Then
                lcOpcion = "sublinea"
            Else
                lcOpcion = "linea"
            End If

            loComando = Crea_SP("Trae_Articulos_Web")
            Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "cOpcion", "V", lcOpcion, 50)
            Agrega_Parametro(loComando, "cClave", "V", lcClave, 50)
            Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 50)
            Agrega_Parametro(loComando, "cLSF", "V", lcLSF, 50)
            Agrega_Parametro(loComando, "cMarca", "V", lcMarca, 50)
            Agrega_Parametro(loComando, "cPrecio", "V", lcPrecio, 50)

            loLector = loComando.ExecuteReader()

            Carga_Lector(Articulos, loLector)
            Carga_Lector(Marcas, loLector)
            Carga_Lector(Precios, loLector)

            loLector.Close()
            loConexion.Close()

            lnTotal_art = Conteo_Articulos(Marcas)

            Session("oLista_Articulos") = Articulos
            Session("oLista_Filtros_Marca") = Marcas
            Session("oLista_Filtros_Precio") = Precios
            Session("oTotal_Articulos") = lnTotal_art
        End If

    End Sub

    Private Function Conteo_Articulos(marcas As DataTable) As Integer
        Dim conteo As Integer = 0
        For Each marca As DataRow In marcas.Rows
            conteo = conteo + marca.Item(1)
        Next

        Return conteo
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim loTabla_Articulos As DataTable
        Dim llFiltro_Marca As Boolean = False
        Dim llFiltro_Precio As Boolean = False

        If Not Me.IsPostBack Then
            loTabla_Articulos = DirectCast(Session("oLista_Articulos"), DataTable)

            If loTabla_Articulos Is Nothing Then
                Me.Consulta_SQL()
            Else
                If loTabla_Articulos.Rows.Count = 0 Then
                    Me.Consulta_SQL()
                Else
                    llFiltro_Marca = ABol(Request.QueryString("llMarca"))
                    llFiltro_Precio = ABol(Request.QueryString("llPrecio"))

                    If llFiltro_Marca Or llFiltro_Precio Then
                        Me.Consulta_SQL()
                    End If
                End If
            End If
            Me.Bind_Datos()
        End If
    End Sub

End Class