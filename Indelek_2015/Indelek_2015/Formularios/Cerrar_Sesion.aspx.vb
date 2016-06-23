Public Class Cerrar_Sesion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("nCliente") = Nothing
        Session("nPedido") = Nothing
        Session("lcRegresar") = Nothing

        Response.Redirect("Principal.aspx")
    End Sub

End Class