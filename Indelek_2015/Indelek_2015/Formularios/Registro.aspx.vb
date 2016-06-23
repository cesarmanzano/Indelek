Imports System.Data.SqlClient
Imports System.Linq

Public Class Registro
    Inherits System.Web.UI.Page

    Dim loComando As SqlCommand
    Dim loPaises,
        loEstados,
        loCiudades,
        loSegmentos As New DataTable

    Dim lcNombre,
        lcNombre_Comercial,
        lcContrasena,
        lcRFC,
        lcCalle,
        lcInterior,
        lcExterior,
        lcCorreo,
        lcColonia,
        lcPostal,
        lcArea,
        lcTelefono,
        lcComentarios As String
    Dim lnCiudad,
        lnSegmento As Integer
    Dim llCelular As Boolean

    Sub Carga_Combo_Estados()
        Me.cboCiudades.Items.Clear()

        loComando = Crea_SP("Combo_Estados")
        Carga_Tabla(loComando, loEstados)

        Me.cboEstados.Items.Clear()

        For lnContador = 0 To loEstados.Rows.Count - 1
            Dim lcNombre,
                lcPais,
                lcEstado As String

            lcPais = Valor(loEstados, "pais", lnContador)

            If lcPais = Me.cboPaises.SelectedValue Then
                lcNombre = StrConv(Valor(loEstados, "nombre_estado", lnContador), VbStrConv.ProperCase)
                lcEstado = Valor(loEstados, "estado", lnContador)

                Dim loItem As ListItem = New ListItem(lcNombre, lcEstado)

                Me.cboEstados.Items.Add(loItem)
            End If
        Next

        Me.cboEstados.SelectedIndex = 0

        Me.Carga_Combo_Ciudades()
    End Sub

    Sub Carga_Combo_Ciudades()
        Me.cboCiudades.Items.Clear()

        loComando = Crea_SP("Combo_Ciudades")
        Agrega_Parametro(loComando, "lAbreviacion", "L", False, 0)

        Carga_Tabla(loComando, loCiudades)

        For lnContador = 0 To loCiudades.Rows.Count - 1
            Dim lcNombre,
                lcEstado As String
            Dim lnCiudad As Integer

            lcEstado = Valor(loCiudades, "estado", lnContador)

            If lcEstado = Me.cboEstados.SelectedValue Then
                lcNombre = StrConv(Valor(loCiudades, "nombre", lnContador), VbStrConv.ProperCase)
                lnCiudad = AInt(Valor(loCiudades, "ciudad", lnContador))

                Dim loItem As ListItem = New ListItem(lcNombre, lnCiudad)

                Me.cboCiudades.Items.Add(loItem)
            End If
        Next

        Me.cboCiudades.Enabled = True
        Me.cboCiudades.SelectedIndex = 0
    End Sub

    Private Sub Consulta_Combos()
        loComando = Crea_SP("Combo_Paises")
        Carga_Tabla(loComando, loPaises)

        loComando = Crea_SP("Combo_Segmentos")
        Carga_Tabla(loComando, loSegmentos)

        Me.cboPaises.DataSource = loPaises
        Me.cboPaises.DataTextField = StrConv("nombre_pais", VbStrConv.ProperCase)
        Me.cboPaises.DataValueField = "pais"
        Me.cboPaises.SelectedIndex = 0

        Me.cboSegmentos.DataSource = loSegmentos
        Me.cboSegmentos.DataTextField = StrConv("nombre_segmento", VbStrConv.ProperCase)
        Me.cboSegmentos.DataValueField = "segmento"
        Me.cboSegmentos.SelectedIndex = 0

        Me.cboTipos_Telefono.Items.Add("Celular")
        Me.cboTipos_Telefono.Items.Add("Oficina")

        Me.cboPaises.DataBind()
        Me.cboSegmentos.DataBind()
    End Sub

    Private Sub Registrar()
        Dim lnCliente_Web As Integer

        lcNombre = Me.txtNombre.Text
        lcNombre_Comercial = Me.txtNombre_Comercial.Text
        lcRFC = Me.txtRFC.Text
        lcCalle = Me.txtCalle.Text
        lcContrasena = Me.txtContrasena.Text

        lcColonia = Me.txtColonia.Text
        lcPostal = Me.txtPostal.Text
        lcArea = Me.txtArea.Text
        lcTelefono = Me.txtTelefono.Text
        lcComentarios = Me.txtComentarios.Text

        lcInterior = Me.txtInterior.Text
        lcExterior = Me.txtExterior.Text
        lcCorreo = Me.txtCorreo.Text

        lnCiudad = Me.cboCiudades.SelectedValue
        lnSegmento = Me.cboSegmentos.SelectedValue

        llCelular = (Me.cboTipos_Telefono.SelectedValue.Trim = "Celular")


        loComando = Crea_SP("Guarda_Cliente_Web")

        Agrega_Parametro(loComando, "nCiudad", "I", lnCiudad, 0)
        Agrega_Parametro(loComando, "nSegmento", "I", lnSegmento, 0)
        Agrega_Parametro(loComando, "cArea", "C", lcArea, 10)
        Agrega_Parametro(loComando, "cInterior", "C", lcInterior, 10)
        Agrega_Parametro(loComando, "cExterior", "C", lcExterior, 10)
        Agrega_Parametro(loComando, "cPostal", "C", lcPostal, 10)
        Agrega_Parametro(loComando, "cRFC", "C", lcRFC, 13)
        Agrega_Parametro(loComando, "cTelefono", "C", lcTelefono, 20)        
        Agrega_Parametro(loComando, "cCalle", "V", lcCalle, 50)
        Agrega_Parametro(loComando, "cColonia", "V", lcColonia, 50)        
        Agrega_Parametro(loComando, "cContrasena", "V", lcContrasena, 50)
        Agrega_Parametro(loComando, "cCorreo", "V", lcCorreo, 80)
        Agrega_Parametro(loComando, "cNombre", "V", lcNombre, 80)
        Agrega_Parametro(loComando, "cNombre_Comercial", "V", lcNombre_Comercial, 80)        
        Agrega_Parametro(loComando, "lCelular", "L", llCelular, 0)
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente_Web, 0)
        Agrega_Parametro(loComando, "cComentarios", "M", lcComentarios, 0)

        loComando.Parameters("nCliente").Direction = ParameterDirection.InputOutput

        loComando.ExecuteNonQuery()

        If Not IsDBNull(loComando.Parameters("nCliente").Value) Then

            lnCliente_Web = AInt(loComando.Parameters("nCliente").Value)

            If Not String.IsNullOrEmpty(lnCliente_Web) Then
                Session("nCliente") = lnCliente_Web
                Session("cMensaje") = "Su Usuario para Iniciar la Sesión es " + lnCliente_Web.ToString

                'Page.ClientScript.RegisterStartupScript(
                '    Me.GetType(),
                '    "",
                '    "Cliente_Agregado()", True)

                Response.Redirect("Mensajes.aspx")

            End If
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.Consulta_Combos()
            Me.Carga_Combo_Estados()
            Me.Carga_Combo_Ciudades()
        End If
    End Sub

    Protected Sub cmdRegistrar_Click(sender As Object, e As EventArgs) Handles cmdRegistrar.Click
        Me.Registrar()
    End Sub

    Protected Sub cboEstados_TextChanged(sender As Object, e As EventArgs) Handles cboEstados.TextChanged
        Me.Carga_Combo_Ciudades()
    End Sub

    Protected Sub cboPaises_TextChanged(sender As Object, e As EventArgs) Handles cboPaises.TextChanged
        Me.Carga_Combo_Estados()
    End Sub

    'Protected Sub cmdAceptar_Click(sender As Object, e As EventArgs) Handles cmdAceptar.Click
    '    Response.Redirect("Principal.aspx")
    'End Sub

    Protected Sub cboCiudades_TextChanged(sender As Object, e As EventArgs) Handles cboCiudades.TextChanged
        ' No hace nada
    End Sub
End Class