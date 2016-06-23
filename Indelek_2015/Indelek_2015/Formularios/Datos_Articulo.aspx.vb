Imports System.Data.SqlClient
Imports System.IO

Public Class Datos_Articulo
    Inherits System.Web.UI.Page

    Dim Articulo As New DataTable
    Dim Existencias As New DataTable

    Sub Baja_Archivo(ByVal lcArchivo As String)

        lcArchivo = "~/Archivos_PDF/" + lcArchivo

        Response.ContentType = "application/pdf"
        Response.AppendHeader("Content-Disposition", "attachment; filename=MyFile.pdf")
        Response.TransmitFile(Server.MapPath(lcArchivo))
        Response.End()
    End Sub

    Sub Bind_Datos()
        Me.ListView1.DataSource = DirectCast(Session("oDatos_Articulo"), DataTable)
        Me.ListView1.DataBind()
    End Sub

    Sub Crea_Cursores()
        Crea_Campo(Articulo, "articulo", "C")
        Crea_Campo(Articulo, "nombre_articulo", "C")
        Crea_Campo(Articulo, "descripcion_extendida", "C")
        Crea_Campo(Articulo, "estado_ventas", "C")
        Crea_Campo(Articulo, "clave_anterior", "C")
        Crea_Campo(Articulo, "precio", "N")
        Crea_Campo(Articulo, "carpeta_raiz", "C")
        Crea_Campo(Articulo, "foto", "C")
        Crea_Campo(Articulo, "tiene_archivos", "L")


        Crea_Campo(Existencias, "nombre_sucursal", "C")
        Crea_Campo(Existencias, "disponible", "N")
    End Sub


    Sub Descarga_Archivo()
        Try
            Dim filename As String = "myFile.txt"

            'set the http content type to "APPLICATION/OCTET-STREAM
            Response.ContentType = "APPLICATION/OCTET-STREAM"

            'initialize the http content-disposition header to
            'indicate a file attachment with the default filename
            '"myFile.txt"
            Dim disHeader As String = "Attachment; Filename=\""" + filename + " \ """

            Response.AppendHeader("Content-Disposition", disHeader)


            'transfer the file byte-by-byte to the response object
            Dim fileToDownload As System.IO.FileInfo = New System.IO.FileInfo("C:\\downloadJSP\\DownloadConv\\myFile.txt")

            Response.Flush()

            Response.WriteFile(fileToDownload.FullName)


        Catch e As System.Exception
            'file IO errors
            'SupportClass.WriteStackTrace(e, Console.Error)
        End Try


    End Sub

    Sub Pinta_Articulo()

        Dim loComando As SqlCommand
        Dim lnCliente As Integer
        Dim lcArticulo As String = Request.QueryString("lcArticulo")
        Dim lcFoto As String
        Dim llArchivos As Boolean = False
        Dim loReader As SqlDataReader

        lnCliente = AInt(Session("nCliente"))
        loComando = Crea_SP("Informacion_Articulo_Web_Indelek")
        Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
        Agrega_Parametro(loComando, "cArticulo", "C", lcArticulo, 20)

        'Carga_Tabla(loComando, Datos)

        loReader = loComando.ExecuteReader()

        Carga_Lector(Articulo, loReader)
        Carga_Lector(Existencias, loReader)

        loReader.Close()
        loConexion.Close()


        Me.txtArticulo.Text = Valor(Articulo, "articulo")
        Me.txtClave.Text = Valor(Articulo, "clave_anterior")
        Me.txtEstado_Venta.Text = Valor(Articulo, "estado_ventas")
        Me.txtNombre.Text = Valor(Articulo, "nombre_articulo")
        Me.txtDescripcion.Text = Valor(Articulo, "descripcion_extendida")
        Me.txtPrecio.Text = String.Format("{0:c}", ADec(Valor(Articulo, "precio")))



        llArchivos = ABol(Valor(Articulo, "tiene_archivos"))

        lcFoto = "../ImagenesArticulos/" + Valor(Articulo, "foto")

        Me.imgFoto.ImageUrl = lcFoto
        Me.imgFoto.Visible = True

        Dim lcSucursales As String = ""
        Dim lcExistencias As String = ""


        For lnContador = 0 To Existencias.Rows.Count - 1
            lcSucursales = lcSucursales + Valor(Existencias, "nombre_sucursal", lnContador).Trim + vbCrLf
            lcExistencias = lcExistencias + String.Format("{0:0.00}", ADec(Valor(Existencias, "disponible", lnContador))).Trim + vbCrLf
        Next

        Me.txtSucursal.Text = lcSucursales
        Me.txtDisponible.Text = lcExistencias

        Session("oDatos_Articulo") = Articulo
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.Crea_Cursores()
        Me.Pinta_Articulo()
        Me.Bind_Datos()
    End Sub

End Class