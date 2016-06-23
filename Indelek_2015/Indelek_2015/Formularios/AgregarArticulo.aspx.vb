Public Class AgregarArticulo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim lcArticulo As String
        Dim lnPrecio As Decimal

        lcArticulo = Request.QueryString("lcArticulo").Trim
        lnPrecio = Request.QueryString("lnPrecio").Trim

        If Not Me.IsPostBack Then
            If AInt(Session("nCliente")) <> 0 Then
                Agregar_Articulo_Carrito(
                        AInt(Session("nCliente")),
                        AInt(Session("nPedido")),
                        lcArticulo,
                        ADec(lnPrecio)
                    )

                Response.Redirect(Session("lcRegresar").ToString.Trim)

            Else
                Response.Redirect("Login.aspx?lcArticulo=" + lcArticulo + "&lnPrecio=" + lnPrecio.ToString)
            End If
        Else
            Response.Redirect("Login.aspx?lcArticulo=" + lcArticulo + "&lnPrecio=" + lnPrecio.ToString)
        End If
    End Sub

End Class