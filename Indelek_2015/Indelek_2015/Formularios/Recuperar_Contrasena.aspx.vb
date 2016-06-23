Imports System.Data.SqlClient

Public Class Recuperar_Contrasena
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub cmdEnviar_Click(sender As Object, e As EventArgs) Handles cmdEnviar.Click
        Dim envio_Correo As New Envia_Correo()
        Dim loComando As SqlCommand
        Dim Datos As New DataTable
        Dim lcMensaje,
            lcAsunto,
            lcDestinatario,
            lcContrasena As String
        Dim lnCliente As Integer
        Dim llEnviado As Boolean = False

        lnCliente = AInt(Me.txtCliente.Text)
        lcDestinatario = Me.txtCorreo.Text.Trim

        lcContrasena = ""

        loComando = Crea_SP("Consulta_Correos_Cliente_Web")
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
        Agrega_Parametro(loComando, "cCorreo", "V", lcDestinatario, 50)
        Agrega_Parametro(loComando, "cContrasena", "V", lcContrasena, 50)

        loComando.Parameters("cContrasena").Direction = ParameterDirection.InputOutput

        loComando.ExecuteNonQuery()

        Carga_Tabla(loComando, Datos)

        If Not IsDBNull(loComando.Parameters("cContrasena").Value) Then

            lcContrasena = Valor(Datos, "contrasena") 'loComando.Parameters("cContrasena").Value

            If Not String.IsNullOrEmpty(lcContrasena) Then
                lcAsunto = "Recuperación de Contrasñea"

                lcMensaje =
                    "<div>" +
                    "<h3>Recuperación de Contrasñea</h3><br />" +
                    "</div>" +
                    "<div>" +
                    "<p>Por este medio le hacemos llegar su contraseña para acceder a nuestro sitio Web</p>" +
                    "</div>" +
                    "<div>" +
                    "<hr />" +
                    "Contraseña de Acceso <b>" + lcContrasena + "</b>" +
                    "<hr />" +
                    "</div><br />" +
                    "<h1>Agradecemos su Preferencia</h1>"

                llEnviado = envio_Correo.Enviar_Correo(lcMensaje, lcAsunto, lcDestinatario)

                If llEnviado Then

                    Session("cMensaje") = "Su solicitud se ha procesado correctamente, favor se revisar su correo electrónico"
                    Response.Redirect("Mensajes.aspx")

                    'Page.ClientScript.RegisterStartupScript(
                    '    Me.GetType(),
                    '    "",
                    '    "Muestra_Mensaje('Su solicitud se ha procesado correctamente, favor se revisar su correo electrónico')", True)
                Else
                    Session("cMensaje") = "Se presentó un problema al enviar su solicitud, Verifique sus dato e intentelo nuevamente"
                    Response.Redirect("Mensajes.aspx")

                    'Page.ClientScript.RegisterStartupScript(
                    '    Me.GetType(),
                    '    "",
                    '    "Muestra_Mensaje_Error('Se presentó un problema al enviar su solicitud, Verifique sus dato e intentelo nuevamente')", True)
                End If
            Else

                Session("cMensaje") = "No Tenemos Registrado este Correo Electrónico"
                Response.Redirect("Mensajes.aspx")

                'Page.ClientScript.RegisterStartupScript(
                '    Me.GetType(),
                '    "",
                '    "Muestra_Mensaje_Error('No Tenemos Registrado este Correo Electrónico')", True)
            End If
        Else
            Session("cMensaje") = "No Tenemos Registrado este Correo Electrónico"
            Response.Redirect("Mensajes.aspx")

            'Page.ClientScript.RegisterStartupScript(
            '        Me.GetType(),
            '        "",
            '        "Muestra_Mensaje_Error('No Tenemos Registrado este Correo Electrónico')", True)
        End If
    End Sub
End Class