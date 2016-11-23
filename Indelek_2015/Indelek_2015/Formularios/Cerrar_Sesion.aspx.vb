Public Class Cerrar_Sesion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Clear()
        Session.Abandon()

        Response.Redirect("Principal.aspx")
    End Sub

End Class