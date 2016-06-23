Imports System.Data.SqlClient

Public Class Carrito_Compras
    Inherits System.Web.UI.Page

    Dim Datos As New DataTable
    Dim lnCliente As Integer

    Private Sub Actualiza_Carrito()
        Dim lnContador As Integer = 0

        Do While (lnContador < Tabla_Carrito_Compras.Rows.Count)
            Dim loRow As GridViewRow = Tabla_Carrito_Compras.Rows(lnContador)
            Dim lnPrecio,
                lnCantidad As Decimal
            Dim llEliminar As Boolean
            Dim txtCantidad As New TextBox
            Dim chkEliminar As New CheckBox

            txtCantidad = CType(
                        Tabla_Carrito_Compras.Rows(lnContador).FindControl("txtCantidad"), 
                        TextBox)

            chkEliminar = CType(
                        Tabla_Carrito_Compras.Rows(lnContador).FindControl("chkEliminar"), 
                        CheckBox)

            llEliminar = chkEliminar.Checked

            lnCantidad = ADec(txtCantidad.Text)
            lnPrecio = ADec(Tabla_Carrito_Compras.Rows(lnContador).Cells(3).Text)

            Tabla_Carrito_Compras.Rows(lnContador).Cells(4).Text = lnPrecio * lnCantidad

            lnContador = lnContador + 1
        Loop
    End Sub

    Private Sub Consulta_Lista()
        Dim loComando As SqlCommand
        Dim lnPedido As Integer = Session("nPedido")
        Dim lnTotal As Decimal = 0

        If lnPedido <> 0 Then
            loComando = Crea_SP("Consulta_Carrito_Web")
            Agrega_Parametro(loComando, "nPedido", "I", lnPedido, 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(Session("lCliente_Web")), 0)

            Carga_Tabla(loComando, Datos)

            Me.txtNomre_Cliente.Text = StrConv(Valor(Datos, "nombre_cliente"), VbStrConv.ProperCase)
            Me.txtFecha.Text = "Fecha del Pedido " + Valor(Datos, "fecha")

            Datos.Columns(3).ReadOnly = False

            For lnContador = 0 To Datos.Rows.Count - 1
                lnTotal = lnTotal + ADec(Valor(Datos, "total", lnContador))
            Next

            Me.txtTotal.Text = "Total : " + String.Format("{0:c}", lnTotal)

            Me.Tabla_Carrito_Compras.DataSource = Datos
            Me.Tabla_Carrito_Compras.DataBind()

            
        Else
            If Datos.Rows.Count = 0 Then
                Me.txtNomre_Cliente.Text = "No hay Artículos en el Carrito de Compra"
                Me.txtFecha.Text = ""
            End If
        End If

    End Sub

    Private Sub Guarda_Carrito()
        Dim loComando As SqlCommand
        Dim lnContador As Integer = 0

        Do While (lnContador < Tabla_Carrito_Compras.Rows.Count)
            Dim lcArticulo As String
            Dim lnPrecio,
                lnCantidad As Decimal
            Dim txtCantidad As New TextBox
            Dim chkEliminar As New CheckBox

            txtCantidad = CType(
                        Tabla_Carrito_Compras.Rows(lnContador).FindControl("txtCantidad"), 
                        TextBox)
            chkEliminar = CType(
                        Tabla_Carrito_Compras.Rows(lnContador).FindControl("chkEliminar"), 
                        CheckBox)

            lcArticulo = Tabla_Carrito_Compras.Rows(lnContador).Cells(0).Text
            lnCantidad = ADec(txtCantidad.Text)
            lnPrecio = ADec(Tabla_Carrito_Compras.Rows(lnContador).Cells(3).Text)

            loComando = Crea_SP("Actualiza_Carrito_Web")
            Agrega_Parametro(loComando, "nPedido", "I", AInt(Session("nPedido")), "0")
            Agrega_Parametro(loComando, "cArticulo", "C", lcArticulo, "20")
            Agrega_Parametro(loComando, "nCantidad", "N", lnCantidad, "0")
            Agrega_Parametro(loComando, "lEliminar", "L", chkEliminar.Checked, "0")

            loComando.ExecuteNonQuery()

            lnContador = lnContador + 1
        Loop
    End Sub

    
    Private Sub CE_Pedido(ByVal lcEstado As String)
        Dim loComando As SqlCommand
        Dim lnPedido As Integer = Session("nPedido")        

        loComando = Crea_SP("CE_Pedido_Web")
        Agrega_Parametro(loComando, "nPedido", "I", lnPedido, 0)
        Agrega_Parametro(loComando, "cEstado", "C", lcEstado, 20)

        loComando.ExecuteNonQuery()


        If Not IsDBNull(loComando.Parameters("nPedido").Value) Then

            lnPedido = AInt(loComando.Parameters("nPedido").Value)

            If Not String.IsNullOrEmpty(lnPedido) Then
                Session("nPedido") = lnPedido
                Session("cMensaje") = "Pedido realizado con el folio  " + lnPedido.ToString

                Response.Redirect("Mensajes.aspx")

            End If
        End If

        Session("nPedido") = 0

        Response.Redirect("Carrito_Compras.aspx")

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If AInt(Session("nCliente")) = 0 Then
                Session("lcRegresar") = Request.Path
                Response.Redirect("Login.aspx")
            Else
                Me.Consulta_Lista()
            End If
        End If
    End Sub

    Protected Sub cmdTerminar_Click(sender As Object, e As EventArgs) Handles cmdTerminar.Click
        CE_Pedido("Terminado")

    End Sub

    Protected Sub cmdActualizar_Click(sender As Object, e As EventArgs) Handles cmdActualizar.Click
        Me.Actualiza_Carrito()
        Me.Guarda_Carrito()
        Me.Consulta_Lista()
    End Sub

    Protected Sub cmdCancelar_Click(sender As Object, e As EventArgs) Handles cmdCancelar.Click
        CE_Pedido("Cancelado")
    End Sub

    Protected Sub Tabla_Carrito_Compras_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Tabla_Carrito_Compras.PageIndexChanging
        Me.Tabla_Carrito_Compras.PageIndex = e.NewPageIndex
        Consulta_Lista()
        Me.Tabla_Carrito_Compras.DataBind()        
    End Sub
End Class