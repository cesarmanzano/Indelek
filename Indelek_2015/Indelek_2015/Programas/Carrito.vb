Imports System.Data.SqlClient

Module Carrito

    Sub Agregar_Articulo_Carrito(
                            ByVal lnCliente As Integer,
                            ByVal lnPedido As Integer,
                            ByVal lcArticulo As String,
                            ByVal lnPrecio As Decimal)

        Dim loComando As SqlCommand
        
        If Not String.IsNullOrEmpty(lcArticulo) Then
            loComando = Crea_SP("Guarda_Detalles_Pedido_Web")
            Agrega_Parametro(loComando, "nCliente", "I", lnCliente, 0)
            Agrega_Parametro(loComando, "cArticulo", "C", lcArticulo, 20)
            Agrega_Parametro(loComando, "nPrecio", "N", lnPrecio, 0)
            Agrega_Parametro(loComando, "lCliente_Web", "L", ABol(HttpContext.Current.Session("lCliente_Web")), 0)
            Agrega_Parametro(loComando, "nPedido", "I", lnPedido, 0)

            loComando.Parameters("nPedido").Direction = ParameterDirection.InputOutput
            loComando.ExecuteNonQuery()
            lnPedido = AInt(loComando.Parameters("nPedido").Value)

            HttpContext.Current.Session("nPedido") = lnPedido
        End If
    End Sub

End Module


