Imports System.Data.SqlClient

Module Base_MDS

    Public loConexion As New SqlClient.SqlConnection
    Public gcCadena_Conexion As String = ""

    Public Function ABol(ByVal lcValor As String) As Boolean
        Dim llValor As Boolean

        Try
            llValor = CBool(lcValor)
        Catch ex As Exception
            llValor = False
        End Try

        Return llValor
    End Function

    Public Function ABol(ByVal loValor As Object) As Boolean
        Dim llValor As Boolean

        Try
            llValor = CBool(loValor)
        Catch ex As Exception
            llValor = False
        End Try

        Return llValor
    End Function

    Public Function ADate(ByVal lcValor As String) As DateTime
        Dim ldValor As DateTime

        Try
            ldValor = CDate(lcValor)
        Catch ex As Exception
            ldValor = #1/1/1900#
        End Try

        Return ldValor
    End Function

    Public Function ADate(ByVal loValor As Object) As DateTime
        Dim ldValor As DateTime

        Try
            ldValor = CDate(loValor)
        Catch ex As Exception
            ldValor = #1/1/1900#
        End Try

        Return ldValor
    End Function

    Public Function ADec(ByVal lcValor As String) As Decimal
        Dim lnValor As Decimal

        Try
            lnValor = CDec(lcValor)
        Catch ex As Exception
            lnValor = 0
        End Try

        Return lnValor
    End Function

    Public Function ADec(ByVal loValor As Object) As Decimal
        Dim lnValor As Decimal

        Try
            lnValor = CDec(loValor)
        Catch ex As Exception
            lnValor = 0
        End Try

        Return lnValor
    End Function

    Public Sub Agrega_Parametro( _
        ByRef loComando As SqlCommand, _
        ByVal lcParametro As String, _
        ByVal lcTipo As String, _
        ByVal lcValor As String, _
        ByVal lnLargo As Integer)

        Dim loTipo As SqlDbType

        Select Case lcTipo
            Case "I"
                loTipo = SqlDbType.Int
            Case "D"
                loTipo = SqlDbType.DateTime
            Case "N"
                loTipo = SqlDbType.Decimal
            Case "C"
                loTipo = SqlDbType.Char
            Case "L"
                loTipo = SqlDbType.Bit
            Case "M"
                loTipo = SqlDbType.Text
            Case "U"
                loTipo = SqlDbType.UniqueIdentifier
            Case "V"
                loTipo = SqlDbType.VarChar
            Case "G"
                loTipo = SqlDbType.Image
            Case Else
                loTipo = SqlDbType.Variant
        End Select

        Dim loParametro As New SqlParameter(lcParametro, loTipo)

        If lnLargo <> 0 Then
            loParametro.Size = lnLargo
        End If

        If lcTipo = "U" Then
            loParametro.Value = New Guid()
        Else
            If String.IsNullOrEmpty(lcValor) Then
                lcValor = ""
            End If

            loParametro.Value = lcValor
        End If

        loComando.Parameters.Add(loParametro)
    End Sub

    Public Function AInt(ByVal lcValor As String) As Integer
        Dim lnValor As Integer

        Try
            lnValor = CInt(lcValor)
        Catch ex As Exception
            lnValor = 0
        End Try

        Return lnValor
    End Function

    Public Function AInt(ByVal loValor As Object) As Integer
        Dim lnValor As Integer

        Try
            lnValor = CInt(loValor)
        Catch ex As Exception
            lnValor = 0
        End Try

        Return lnValor
    End Function

    Public Function Archivo_Unico( _
        ByVal lcDirectorio As String, _
        ByVal lcExtension As String)

        Dim lcArchivo As String = ""

        For lnContador = 0 To 1000
            lcArchivo = lcDirectorio + "\" + Math.Floor(10000 * (Rnd() * Rnd())).ToString + "." + lcExtension

            If Not IO.File.Exists(lcArchivo) Then
                Exit For
            End If
        Next

        Return lcArchivo
    End Function

    Public Sub Carga_Lector(ByRef Tabla As DataTable, ByRef Lector As SqlDataReader)
        Dim loRenglon As DataRow
        Dim lcCampo As String = ""
        Dim lcTipo_Sistema As String = ""
        Dim lcTipo As String = ""

        While Lector.Read()
            If Tabla.Columns.Count = 0 Then

                For intCounter = 0 To Lector.FieldCount - 1
                    lcTipo_Sistema = Lector.GetFieldType(intCounter).ToString
                    lcCampo = Lector.GetName(intCounter)

                    Select Case lcTipo_Sistema
                        Case "System.String"
                            lcTipo = "C"
                        Case "System.Int32"
                            lcTipo = "I"
                        Case "System.DateTime"
                            lcTipo = "D"
                        Case "System.Boolean"
                            lcTipo = "L"
                        Case "System.Decimal"
                            lcTipo = "N"
                        Case "System.Byte"
                            lcTipo = "G"
                    End Select

                    Crea_Campo(Tabla, lcCampo, lcTipo)
                Next
            End If

            loRenglon = Tabla.NewRow()

            For intCounter = 0 To Lector.FieldCount - 1
                loRenglon(intCounter) = Lector.GetValue(intCounter)
            Next

            Tabla.Rows.Add(loRenglon)
        End While

        Lector.NextResult()
    End Sub

    Public Sub Carga_Parametros_Conexion()
        'Dim lcCadena,
        '    lcConsulta,
        '    lcContrasena As String
        'Dim loConexion As New OleDb.OleDbConnection
        'Dim loComando As OleDb.OleDbCommand 'Odbc.OdbcCommand
        'Dim Datos As New DataTable
        'Dim loReader As OleDb.OleDbDataReader 'Odbc.OdbcDataReader


        'lcCadena = "Provider=vfpoledb;" +
        '           "Data Source=C:\Cie\;" +
        '           "Collating Sequence=machine;"

        'lcConsulta = "SELECT * FROM Arranque"

        'loConexion.ConnectionString = lcCadena
        'loConexion.Open()
        'loComando = loConexion.CreateCommand()
        'loComando.CommandText = lcConsulta

        'loReader = loComando.ExecuteReader()
        'Datos.Load(loReader)
        'loReader.Close()
        'loConexion.Close()

        'lcContrasena = "O4TQ9IX6RC2U" 'DesEncripta(Valor(Datos, "contrasena").Trim)

        'gcCadena_Conexion = "Server=" + Valor(Datos, "server_SQL").Trim + ";" +
        '                    "UID= " + Valor(Datos, "usuario").Trim + ";" +
        '                    "PWD=" + lcContrasena + ";" + _
        '                    "Database=" + Valor(Datos, "base_datos").Trim + ";"

        Dim lcServidor As String = "97.105.4.107,49184"
        '"INDELEK.ELECTROSYSTEMSNET.COM,49184"
        '"MAYOREOCARSS.DDNS.NET,49184"
        'lcServidor = "97.105.4.107,49184"

        gcCadena_Conexion = "Server=" + lcServidor + ";" +
                            "UID=mds_sistema;" +
                            "PWD=O4TQ9IX6RC2U;" + _
                            "Database=ERP_CIE;"

    End Sub

    Public Sub Carga_Tabla( _
     ByRef loComando As SqlCommand, _
     ByRef Tabla As DataTable)

        Dim loReader As SqlDataReader

        loReader = loComando.ExecuteReader()

        Tabla.Clear()
        Tabla.Load(loReader)
        loReader.Close()
        loConexion.Close()
    End Sub

    Public Sub Carga_Tabla( _
        ByRef loComando As SqlCommand, _
        ByRef Tabla As DataTable,
        ByVal llCerrar As Boolean)

        Carga_Tabla(loComando, Tabla)
        Cierra_Conexion()
    End Sub

    Public Sub Cierra_Conexion()
        loConexion.Close()
    End Sub

    Private Sub Conecta_Cadena()
        'loConexion.ConnectionString = ConfigurationManager.AppSettings("ConectaBD").ToString

        If gcCadena_Conexion.Trim.Length = 0 Then
            Carga_Parametros_Conexion()
        End If

        loConexion.ConnectionString = gcCadena_Conexion
    End Sub

    Public Sub Crea_Campo( _
        ByRef Tabla As DataTable, _
        ByVal lcCampo As String, _
        ByVal lcTipo As String)

        Dim lcTipo_Sistema As String

        lcTipo_Sistema = "System.String"

        Select Case lcTipo
            Case "C"
                lcTipo_Sistema = "System.String"
            Case "I"
                lcTipo_Sistema = "System.Int32"
            Case "D"
                lcTipo_Sistema = "System.DateTime"
            Case "L"
                lcTipo_Sistema = "System.Boolean"
            Case "N"
                lcTipo_Sistema = "System.Decimal"
            Case "G"
                lcTipo_Sistema = "System.Byte"
        End Select

        Tabla.Columns.Add(lcCampo, System.Type.GetType(lcTipo_Sistema))

    End Sub

    Public Function Crea_SP(ByVal lcComando As String) As SqlCommand
        Dim loComando As New SqlCommand(lcComando)

        Try
            loConexion.Close()
        Catch ex As Exception

        End Try

        Conecta_Cadena()
        loConexion.Open()
        
        loComando.CommandType = CommandType.StoredProcedure
        loComando.Connection = loConexion
        loComando.CommandTimeout = 120


        Return loComando
    End Function

    Sub Ejecuta_SQL(ByRef loComando As SqlCommand)
        Try
            loComando.ExecuteNonQuery()
        Catch ex As Exception

        End Try

    End Sub

    Public Function Valor(ByVal Tabla As DataTable, ByVal lcCampo As String) As String
        Dim lcResultado As String

        Try
            lcResultado = Tabla.Rows(0).Item(lcCampo).ToString
        Catch ex As Exception
            lcResultado = ""
        End Try

        Return lcResultado
    End Function

    Public Function Valor( _
        ByVal Tabla As DataTable, _
        ByVal lcCampo As String, _
        ByVal lnRenglon As Integer) As String

        Dim lcResultado As String

        Try
            lcResultado = Tabla.Rows.Item(lnRenglon).Item(lcCampo).ToString()
        Catch ex As Exception
            lcResultado = ""
        End Try

        Return lcResultado
    End Function

End Module
