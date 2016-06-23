Imports System.Data.SqlClient

Public Class Login1
    Inherits System.Web.UI.Page


    Sub Registra_Login()
        Dim lcContrasena,
            lcNombre_Cliente As String
        Dim lnCliente,
            lnPedido As Integer
        Dim llCliente_Web As Boolean = False

        lcContrasena = Me.txtContrasena.Text
        lnPedido = 0
        lnCliente = AInt(Me.txtUsuario.Text)
        lcNombre_Cliente = "Iniciar Sesión"

        Dim loComando As SqlCommand

        If lnCliente <> 0 And Not String.IsNullOrEmpty(lcContrasena) Then
            loComando = Crea_SP("Login_Web")
            Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
            Agrega_Parametro(loComando, "cContrasena", "C", lcContrasena, 20)
            Agrega_Parametro(loComando, "nPedido", "I", lnPedido, 0)
            Agrega_Parametro(loComando, "cNombre_Cliente", "C", lcNombre_Cliente, 50)
            Agrega_Parametro(loComando, "lCliente_Web", "L", llCliente_Web, 0)

            loComando.Parameters("nCliente").Direction = ParameterDirection.InputOutput
            loComando.Parameters("nPedido").Direction = ParameterDirection.InputOutput
            loComando.Parameters("cNombre_Cliente").Direction = ParameterDirection.InputOutput
            loComando.Parameters("lCliente_Web").Direction = ParameterDirection.InputOutput

            loComando.ExecuteNonQuery()

            If Not IsDBNull(loComando.Parameters("nPedido").Value) Then

                lnPedido = AInt(loComando.Parameters("nPedido").Value)
                lnCliente = AInt(loComando.Parameters("nCliente").Value)
                llCliente_Web = ABol(loComando.Parameters("lCliente_Web").Value)

                If Not String.IsNullOrEmpty(lnPedido) Then
                    Session("nCliente") = lnCliente
                    Session("nPedido") = lnPedido
                    Session("lCliente_Web") = llCliente_Web

                    Dim lcOrigen As String = Session("lcRegresar").ToString.Trim
                    Dim lcArticulo,
                        lnPrecio As String

                    lcArticulo = Request.QueryString("lcArticulo")
                    lnPrecio = Request.QueryString("lnPrecio")

                    lcNombre_Cliente = loComando.Parameters("cNombre_Cliente").Value

                    Session("cNombre_Cliente") = StrConv(lcNombre_Cliente, VbStrConv.ProperCase)

                    If String.IsNullOrEmpty(lcOrigen) Then
                        lcOrigen = "Principal.aspx"
                    End If

                    If String.IsNullOrEmpty(lcArticulo) Then
                        Response.Redirect(lcOrigen)
                    Else
                        Response.Redirect("AgregarArticulo.aspx?lcArticulo=" + lcArticulo + "&lnPrecio=" + lnPrecio)
                    End If
                Else
                    'Page.ClientScript.RegisterStartupScript(
                    '    Me.GetType(),
                    '    "",
                    '    "Muestra_Mensaje_Error('Usuario o Contraseña Incorrectos')", True)


                    Me.lblError.Text = "El Número de Cliente " + lnCliente.ToString +
                        " o Contraseña no son Correctos" + vbCrLf +
                        " - Favor de Revisarlos"
                    Me.lblError.Visible = True
                End If
            Else
                Me.lblError.Text = "El Número de Cliente " + lnCliente.ToString +
                    " o Contraseña no son Correctos" + vbCrLf +
                    " - Favor de Revisarlos"
                Me.lblError.Visible = True

                'Page.ClientScript.RegisterStartupScript(Me.GetType(), "error", "Muestra_Error()", True)
            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        txtUsuario.Attributes.Add("onkeypress", "Valida_Enter_Local()")
        txtContrasena.Attributes.Add("onkeypress", "Valida_Enter_Local()")

        'If Not Me.IsPostBack Then
        '    If Session("nCliente") <> 0 Then
        '        Response.Redirect("Consultas_Usuario.aspx")
        '    End If
        'End If
    End Sub

    Protected Sub cmdIniciar_Click(sender As Object, e As EventArgs) Handles cmdIniciar.Click
        Me.Registra_Login()    
    End Sub

End Class