Imports System.Data.SqlClient

Public Class Comentarios
    Inherits System.Web.UI.Page

    Dim lcNombre,
        lcEmpresa,
        lcTelefono,
        lcCorreo,
        lcComentarios As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then

        End If
    End Sub

    Sub Enviar_Comentarios()
        Dim loComando As SqlCommand

        lcNombre = Me.txtNombre.Text
        lcEmpresa = Me.txtEmpresa.Text
        lcTelefono = Me.txtTelefono.Text
        lcCorreo = Me.txtTelefono.Text
        lcComentarios = Me.txtComentarios.Text

        loComando = Crea_SP("Registra_Comentarios_Web")
        Agrega_Parametro(loComando, "nCliente", "I", AInt(Session("nCliente")), 0)
        Agrega_Parametro(loComando, "cTelefono", "V", lcTelefono, 20)
        Agrega_Parametro(loComando, "cCorreo", "V", lcCorreo, 50)
        Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 80)
        Agrega_Parametro(loComando, "cEmpresa", "V", lcEmpresa, 80)        
        Agrega_Parametro(loComando, "cComentarios", "M", lcComentarios, 0)

        loComando.ExecuteNonQuery()

        Page.ClientScript.RegisterStartupScript(
                        Me.GetType(),
                        "",
                        "Muestra_Mensaje('Agradecemos sus Comentarios')", True)

        Me.txtNombre.Text = ""
        Me.txtEmpresa.Text = ""
        Me.txtTelefono.Text = ""
        Me.txtCorreo.Text = ""
        Me.txtComentarios.Text = ""
    End Sub

    Protected Sub cmdComentarios_Click(sender As Object, e As EventArgs) Handles cmdComentarios.Click
        Enviar_Comentarios()
    End Sub
End Class