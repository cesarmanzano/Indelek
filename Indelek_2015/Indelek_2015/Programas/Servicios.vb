Imports System.Data.SqlClient

Module Servicios
    Function Archivos_Binarios() As DataTable
        Dim Archivos As New DataTable
        Dim loComando As SqlCommand

        loComando = Crea_SP("Consulta_Documentos_NET")

        Carga_Tabla(loComando, Archivos)

        Return Archivos
    End Function

    Function Consulta_Archivo(ByVal lnDocumento As Integer) As DataTable
        Dim Archivo As New DataTable
        Dim loComando As SqlCommand

        loComando = Crea_SP("Consulta_Documento_NET")
        Agrega_Parametro(loComando, "nDocumento", "I", lnDocumento, 0)

        Carga_Tabla(loComando, Archivo)

        Return Archivo
    End Function
End Module
