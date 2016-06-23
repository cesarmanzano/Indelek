Imports System.Data.SqlClient

Public Class Principal
    Inherits System.Web.UI.Page
    Dim URLS As New DataTable
    Dim Datos As New DataTable

    Sub Carga_Default()
        Dim loComando As SqlCommand
        Dim Datos,
            loTabla_Articulos,
            loFiltros_Marca,
            loFiltros_Precios As New DataTable
        Dim lcNombre As String


        If Session("cNombre_Cliente") <> Nothing Then
            lcNombre = Session("cNombre_Cliente").ToString.Trim() + " Salir"
        Else
            lcNombre = ""
        End If

        If loTabla_Articulos Is Nothing Then
            Session("oLista_Articulos") = loTabla_Articulos
        End If

        If loFiltros_Marca Is Nothing Then
            Session("oLista_Filtros_Precio") = loFiltros_Marca
        End If

        If loFiltros_Precios Is Nothing Then
            Session("oLista_Filtros_Marca") = loFiltros_Precios
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

    'Sub Bind_Datos()
    '    Me.txtD1.DataBind()
    'End Sub

    'Sub Crea_Cursores()
    '    Crea_Campo(Descripciones, "nombre_descripcion", "C")
    'End Sub

    'Sub Pinta_Descripcion()
    '    Dim loComando As SqlCommand
    '    Dim lnDescripcion As Integer
    '    Dim loReader As SqlDataReader

    '    lnDescripcion = 1
    '    loComando = Crea_SP("Trae_URL_Sitio")

    '    loReader = loComando.ExecuteReader()

    '    Carga_Lector(Descripciones, loReader)

    '    Dim lcDescripciones As String = ""

    '    lcDescripciones = lcDescripciones + Valor(Descripciones, "nombre_descripcion").Trim

    '    Me.txtD1.Text = lcDescripciones

    'End Sub

    Sub Crea_Cursores()
        Crea_Campo(URLS, "url", "C")
        Crea_Campo(Datos, "nombre_descripcion", "C")
    End Sub


    Sub Pinta_Descripciones()
        Dim loComando As SqlCommand

        loComando = Crea_SP("Indelek.dbo.Trae_Descripciones_Sitio")
        Carga_Tabla(loComando, Datos)

        Me.Label1.Text = Valor(Datos, "nombre_descripcion", 0).Trim
        Me.Label3.Text = Valor(Datos, "nombre_descripcion", 1).Trim
        Me.Label4.Text = Valor(Datos, "nombre_descripcion", 2).Trim
        Me.Label5.Text = Valor(Datos, "nombre_descripcion", 3).Trim
        Me.Label6.Text = Valor(Datos, "nombre_descripcion", 4).Trim
        Me.Label7.Text = Valor(Datos, "nombre_descripcion", 5).Trim

    End Sub
    Sub Pinta_URLs()
        Dim loComando As SqlCommand
        
        loComando = Crea_SP("Indelek.dbo.Trae_URL_Sitio")
        Carga_Tabla(loComando, URLS)

        Me.Image1.Attributes("AlternateText") = Valor(URLS, "url", 0).Trim
        Me.Image2.Attributes("AlternateText") = Valor(URLS, "url", 1).Trim
        Me.Image3.Attributes("AlternateText") = Valor(URLS, "url", 2).Trim
        Me.Image4.Attributes("AlternateText") = Valor(URLS, "url", 3).Trim
        Me.Image5.Attributes("AlternateText") = Valor(URLS, "url", 4).Trim
        Me.Image6.Attributes("AlternateText") = Valor(URLS, "url", 5).Trim
        Me.Image7.Attributes("AlternateText") = Valor(URLS, "url", 6).Trim
        Me.Image8.Attributes("AlternateText") = Valor(URLS, "url", 7).Trim
        Me.Image9.Attributes("AlternateText") = Valor(URLS, "url", 8).Trim
        Me.Image10.Attributes("AlternateText") = Valor(URLS, "url", 9).Trim
        Me.Image11.Attributes("AlternateText") = Valor(URLS, "url", 10).Trim
        Me.Image12.Attributes("AlternateText") = Valor(URLS, "url", 11).Trim
        Me.Image13.Attributes("AlternateText") = Valor(URLS, "url", 12).Trim
        Me.Image14.Attributes("AlternateText") = Valor(URLS, "url", 13).Trim
        Me.Image15.Attributes("AlternateText") = Valor(URLS, "url", 14).Trim
        Me.Image16.Attributes("AlternateText") = Valor(URLS, "url", 15).Trim
        Me.Image17.Attributes("AlternateText") = Valor(URLS, "url", 16).Trim
        Me.Image18.Attributes("AlternateText") = Valor(URLS, "url", 17).Trim
        Me.Image19.Attributes("AlternateText") = Valor(URLS, "url", 18).Trim
        Me.Image20.Attributes("AlternateText") = Valor(URLS, "url", 19).Trim
        Me.Image21.Attributes("AlternateText") = Valor(URLS, "url", 20).Trim
        Me.Image22.Attributes("AlternateText") = Valor(URLS, "url", 21).Trim
        Me.Image23.Attributes("AlternateText") = Valor(URLS, "url", 22).Trim
        Me.Image24.Attributes("AlternateText") = Valor(URLS, "url", 13).Trim
        Me.Image25.Attributes("AlternateText") = Valor(URLS, "url", 24).Trim
        Me.Image26.Attributes("AlternateText") = Valor(URLS, "url", 25).Trim
        Me.Image27.Attributes("AlternateText") = Valor(URLS, "url", 26).Trim
        Me.Image28.Attributes("AlternateText") = Valor(URLS, "url", 27).Trim
        Me.Image29.Attributes("AlternateText") = Valor(URLS, "url", 28).Trim
        Me.Image30.Attributes("AlternateText") = Valor(URLS, "url", 29).Trim
        Me.Image31.Attributes("AlternateText") = Valor(URLS, "url", 30).Trim
      
    End Sub

    Private Sub Carga_Menu()

        Dim loDatos As New DataSet
        Dim lcArchivo As String = HttpContext.Current.Session("lcRaiz") + "Imagenes/Menu_XML.xml"

        loDatos = Consulta_Menu()

        For Each loRow As DataRow In loDatos.Tables("Lineas_Articulos").Rows

            Dim loLinea As MenuItem =
                New MenuItem(
                    StrConv(loRow.Item("nombre_linea").ToString.Trim, VbStrConv.ProperCase),
                    loRow.Item("linea")
                )

            Menu_Dinamico.Items.Add(loLinea)

            For Each loSubRow As DataRow In loRow.GetChildRows("Sublineas_Articulos")

                Dim loHijo_SubLinea As MenuItem =
                    New MenuItem(
                        StrConv(loSubRow.Item("nombre_sublinea").ToString.Trim, VbStrConv.ProperCase),
                        loSubRow.Item("sublinea")
                    )

                loLinea.ChildItems.Add(loHijo_SubLinea)

                For Each loFamilias As DataRow In loSubRow.GetChildRows("Familias_Articulos")

                    Dim loHijo_Familia As MenuItem =
                        New MenuItem(
                            StrConv(loFamilias.Item("nombre_familia").ToString.Trim, VbStrConv.ProperCase),
                            loFamilias.Item("familia")
                        )

                    loHijo_SubLinea.ChildItems.Add(loHijo_Familia)
                Next

            Next

        Next
    End Sub

    Private Function Consulta_Menu() As DataSet
        Dim loDatos As New DataSet

        Carga_Parametros_Conexion()

        Dim loConexion As New SqlConnection(gcCadena_Conexion)
        Dim loLineas As New SqlDataAdapter("Consulta_Lineas_Web", loConexion)
        Dim loSubLineas As New SqlDataAdapter("Consulta_SubLineas_Web", loConexion)
        Dim loFamilias As New SqlDataAdapter("Consulta_Familias_Web", loConexion)

        loLineas.Fill(loDatos, "Lineas_Articulos")

        loSubLineas.Fill(loDatos, "SubLineas_Articulos")
        loFamilias.Fill(loDatos, "Familias_Articulos")

        loDatos.Relations.Add("Familias_Articulos",
                loDatos.Tables("Sublineas_Articulos").Columns("sublinea"),
                loDatos.Tables("Familias_Articulos").Columns("sublinea"))

        loDatos.Relations.Add("SubLineas_Articulos",
                loDatos.Tables("Lineas_Articulos").Columns("linea"),
                loDatos.Tables("Sublineas_Articulos").Columns("linea"))
       
        Return loDatos
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.Carga_Menu()
            Me.Crea_Cursores()
            Me.Pinta_URLs()
        End If
    End Sub

    Protected Sub Menu_Dinamico_MenuItemClick(sender As Object, e As MenuEventArgs) Handles Menu_Dinamico.MenuItemClick
        Dim lcArray() As String = Split(e.Item.ValuePath.ToString(), "/")
        Dim lcURL As String = "Prueba.aspx?cLSF=" + e.Item.Value.ToString() + "&lnCuantos=" + lcArray.Length.ToString

        Session("oLista_Articulos") = Nothing

        Response.Redirect(lcURL)
        'If Not Me.IsPostBack Then
        ' Me.Carga_URLs()
        'End If
        '  Me.Crea_Cursores()
        ' Me.Pinta_Descripcion()

        '  Me.Bind_Datos()
    End Sub
End Class