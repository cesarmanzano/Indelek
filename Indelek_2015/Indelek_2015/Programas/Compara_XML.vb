Imports System.Data.SqlClient
Imports System.Xml
Imports System.IO

Module Compara_XML

    Dim lcArchivo As String = HttpContext.Current.Session("lcRaiz") + "Imagenes/Menu_XML.xml"

    Public Sub Actualiza_XML()
        Dim loDatos As New DataSet
        Dim lcInformacion As FileInfo
        Dim lcHoy As DateTime
        lcHoy = DateTime.Now
        lcInformacion = My.Computer.FileSystem.GetFileInfo(lcArchivo)

        If File.Exists(lcArchivo) Then
            If lcInformacion.CreationTime.Hour <> lcHoy.Hour Then
                Genera_Menu_XML()
            End If
        Else
            Genera_Menu_XML()
        End If
    End Sub

    Private Function Consulta_Menu() As DataSet
        Dim loDatos As New DataSet

        Carga_Parametros_Conexion()

        'Try
        Dim loConexion As New SqlConnection(gcCadena_Conexion)
        Dim loLineas As New SqlDataAdapter("Consulta_Lineas_Web", loConexion)
        Dim loSubLineas As New SqlDataAdapter("Consulta_SubLineas_Web", loConexion)
        Dim loFamilias As New SqlDataAdapter("Consulta_Familias_Web", loConexion)

        loLineas.Fill(loDatos, "Lineas_Articulos")

        loSubLineas.Fill(loDatos, "SubLineas_Articulos")
        loFamilias.Fill(loDatos, "Familias_Articulos")

        loDatos.Relations.Add("Familias_Articulos",
                loDatos.Tables("Sublineas_Articulos").Columns("sublinea"),
                loDatos.Tables("Familias_Articulos").Columns("sublinea"))

        loDatos.Relations.Add("SubLineas_Articulos",
                loDatos.Tables("Lineas_Articulos").Columns("linea"),
                loDatos.Tables("Sublineas_Articulos").Columns("linea"))
        'Catch ex As SqlException
        '    Response.Redirect("En Construccion.aspx")
        'End Try
        Return loDatos
    End Function

    Private Sub Genera_Menu_XML()
        Dim loComando As SqlCommand
        Dim loLineas,
            loSubLineas,
            loFamilias As New DataTable

        loComando = Crea_SP("Consulta_Lineas_Web")
        Carga_Tabla(loComando, loLineas)

        loComando = Crea_SP("Consulta_SubLineas_Web")
        Carga_Tabla(loComando, loSubLineas)

        loComando = Crea_SP("Consulta_Familias_Web")
        Carga_Tabla(loComando, loFamilias)

        Dim writer As New XmlTextWriter(lcArchivo, System.Text.Encoding.UTF8)
        writer.WriteStartDocument(True)
        writer.Formatting = Formatting.Indented
        writer.Indentation = 2

        For lnLinea = 1 To loLineas.Rows.Count - 1
            writer.WriteStartElement("nombre_linea", Valor(loLineas, "nombre_liena", lnLinea))
            writer.WriteElementString("linea", Valor(loLineas, "liena", lnLinea))

            Dim linea As Integer = Valor(loLineas, "linea", lnLinea)

            For lnSubLinea = 1 To loSubLineas.Rows.Count - 1
                Dim sublinea As Integer = Valor(loSubLineas, "sublinea", lnSubLinea)

                If linea = AInt(Valor(loSubLineas, "linea", lnSubLinea)) Then
                    writer.WriteStartElement(Valor(loSubLineas, "nombre_subliena", lnSubLinea))
                    writer.WriteElementString("sublinea", Valor(loSubLineas, "subliena", lnSubLinea))
                    writer.WriteEndElement()

                    For lnFamilia = 1 To loFamilias.Rows.Count
                        If sublinea = AInt(Valor(loSubLineas, "sublinea", lnFamilia)) Then
                            writer.WriteStartElement(Valor(loFamilias, "nombre_familia", lnSubLinea))
                            writer.WriteElementString("damilia", Valor(loFamilias, "familia", lnSubLinea))
                            writer.WriteEndElement()

                        End If
                    Next
                    writer.WriteEndElement()
                End If
            Next

            writer.WriteEndElement()
        Next

        writer.WriteEndDocument()
        writer.Close()
    End Sub
End Module
