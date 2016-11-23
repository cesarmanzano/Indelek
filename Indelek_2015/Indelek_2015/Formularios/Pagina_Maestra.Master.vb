Imports System.Data.SqlClient
Imports System.Threading
Imports System.IO
Imports System.Xml

Public Class Pagina_Maestra
    Inherits System.Web.UI.MasterPage

    Sub Buscar_Articulos()
        If Not String.IsNullOrEmpty(Me.txtBuscar.Text.Trim) Then
            Session("oLista_Articulos") = Nothing
            Response.Redirect("Prueba.ASPX?cTexto=" + Me.txtBuscar.Text.Trim)
        End If
    End Sub

    Sub Carga_Carrito()
        Dim loComando As SqlCommand
        Dim lnPedido As Integer = Session("nPedido")
        Dim Datos As New DataTable

        loComando = Crea_SP("Consulta_Carrito_Web")
        Agrega_Parametro(loComando, "nPedido", "I", lnPedido, 0)
        Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)

        Carga_Tabla(loComando, Datos)

        Me.Texto_Carrito.Text = Datos.Rows.Count.ToString '& " " & Format(Valor(Datos, "importe"), "C2")

    End Sub

    Sub Carga_Default()
        Dim loComando As SqlCommand
        Dim Datos,
            loTabla_Articulos,
            loFiltros_Marca,
            loFiltros_Precios As New DataTable
        Dim lcNombre As String


        If Session("cNombre_Cliente") <> Nothing Then
            lcNombre = Session("cNombre_Cliente").ToString.Trim() + " Salir"
            Me.link_Iniciar_Sesion.Visible = False
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

        txtBuscar.Attributes.Add("onkeypress", "Valida_Enter('cmdBuscar')")

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

    Private Sub Carga_Logotipo()
        Me.Logo.ImageUrl = Me.Lee_Parametros("Logotipo")
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

    Function Lee_Parametros(ByVal lcParametro As String) As String
        Dim lcCadena As String = ""
        Dim lcArchivo_Preferencias As String = "Parametros_XML"

        If File.Exists(lcArchivo_Preferencias) Then
            Dim document As XmlReader = New XmlTextReader(lcArchivo_Preferencias)

            While (document.Read())
                Dim type = document.NodeType

                If (type = XmlNodeType.Element) Then
                    If (document.Name = lcParametro) Then
                        lcCadena = document.ReadInnerXml.ToString()

                        Exit While
                    End If
                End If
            End While

            document.Close()
        Else
            lcCadena = "Logotipo.Jpg"
        End If

        Return lcCadena
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Carga_Logotipo()
        Me.Carga_Default()

        If Not Me.IsPostBack Then
            Me.Carga_Carrito()
            If Not IsNothing(Session("nCliente")) Then
                Me.link_Cerrar_Sesion.Visible = True
            End If
        End If
    End Sub

    Protected Sub txtBuscar_TextChanged(sender As Object, e As EventArgs) Handles txtBuscar.TextChanged
        Buscar_Articulos()
    End Sub

End Class