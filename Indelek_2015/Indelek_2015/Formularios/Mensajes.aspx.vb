Public Class RegistroAgregado
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lcMensaje As String = Session("cMensaje").ToString()

        If Not String.IsNullOrEmpty(lcMensaje) Then
            lblMensaje.Text = lcMensaje
        End If
    End Sub

    Protected Sub cmdAceptar_Click(sender As Object, e As EventArgs) Handles cmdAceptar.Click
        Response.Redirect("Principal.aspx")
    End Sub
End Class