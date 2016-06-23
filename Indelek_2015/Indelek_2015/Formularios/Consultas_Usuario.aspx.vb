Public Class Consultas_Usuario
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            If AInt(Session("nCliente")) = 0 Then
                Session("lcRegresar") = Request.Path
                Response.Redirect("Login.aspx")
            Else
                Page.ClientScript.RegisterStartupScript(
                    Me.GetType(),
                    "",
                    "Cambiar_Session('', 'activo');", True)
            End If
        End If
    End Sub

    Protected Sub imgSeguimiento_Pedidos_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgSeguimiento_Pedidos.Click        
        If AInt(Session("nCliente")) <> 0 Then
            Response.Redirect("Seguimiento_Pedidos.aspx")
        End If
    End Sub

    Protected Sub imgLista_Deseos_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgLista_Deseos.Click
        If AInt(Session("nCliente")) <> 0 Then
            Response.Redirect("Carrito_Compras.aspx")
        End If
    End Sub

    Protected Sub imgEstado_Cuenta_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs) Handles imgEstado_Cuenta.Click
        If AInt(Session("nCliente")) <> 0 Then
            Response.Redirect("Estado_Cuenta.aspx")
        End If
    End Sub

    Protected Sub Image4_Click(sender As Object, e As ImageClickEventArgs) Handles Image4.Click
        If AInt(Session("nCliente")) <> 0 Then
            Response.Redirect("Facturacion.aspx")
        End If
    End Sub
End Class