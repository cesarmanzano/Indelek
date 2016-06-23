Imports System.Text
Imports System.Net
Imports System.Net.Mail
Imports System.Net.Mime
Imports System.Data.SqlClient

Public Class Envia_Correo

    Public Function Enviar_Correo(ByVal lcMensaje As String, ByVal lcAsunto As String, ByVal lcDestinatario As String) As Boolean
        Dim loComando As SqlCommand
        Dim loMensaje As MailMessage = New MailMessage()
        Dim loCliente As SmtpClient = New SmtpClient()
        Dim Datos As New DataTable

        Dim lcServidor_Correo,
            lcCuenta_Envio,
            lcContrasena As String

        loComando = Crea_SP("Consulta_Parametros_Correo_CFD")
        Carga_Tabla(loComando, Datos)

        lcServidor_Correo = Valor(Datos, "servidor_correo").Trim
        lcCuenta_Envio = Valor(Datos, "usuario_correo").Trim
        lcContrasena = Valor(Datos, "contrasena_correo").Trim

        loMensaje.To.Add(lcDestinatario)
        loMensaje.From = New MailAddress(lcCuenta_Envio, "Alleato Web", Encoding.UTF8)
        loMensaje.Subject = lcAsunto
        loMensaje.SubjectEncoding = Encoding.UTF8
        loMensaje.Body = lcMensaje
        loMensaje.BodyEncoding = Encoding.UTF8
        loMensaje.IsBodyHtml = True


        loCliente.Credentials = New NetworkCredential(lcCuenta_Envio, lcContrasena)
        loCliente.Port = 587
        loCliente.Host = lcServidor_Correo

        'Esto es para que vaya a través de SSL que es obligatorio con GMail
        loCliente.EnableSsl = True

        Try
            loCliente.Send(loMensaje)
            Return True
        Catch ex As SmtpException
            Return False
        End Try
    End Function

End Class
