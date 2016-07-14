<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Formularios/Pagina_Maestra.Master" CodeBehind="Datos_Articulo.aspx.vb" Inherits="Indelek_2015.Datos_Articulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<%--<div style="font-family: Arial;"> --%>
    <%--<div style =" margin-left: -820px; margin-top: 50px; margin-bottom: -35px;">    --%>
  
 <%--<section id="productos">--%>
    <div class="wrapperproductos">
        <div class="fotop">
        <asp:Image
            ID="imgFoto" 
            runat="server"
            Height="215px"
            onerror="src='../Imagenes/nodisponible.jpg'"
            ImageUrl="~/Imagenes/Cargando.gif"
            Width="200px"/></div>
    <%--</div>   --%>
        &nbsp&nbsp&nbsp
    <%--<section style="width:700px; float:right; margin-top: -186px;  margin-right: 100px; text-align: left;">--%>
        <%--<div style="width:470px; font-family:Arial,Helvetica, Nimbus Sans L, Liberation Sans, FreeSans,sans-serif; line-height: 1.5; font-weight: bold; font-size: 13px;">--%>                
            <div class="tyd">
                <h5><asp:Label ID="txtNombre" runat="server"></asp:Label></h5>
        <%--</div>--%>  
        <div style=" width:470px; font-family:Arial,Helvetica, Nimbus Sans L, Liberation Sans, FreeSans,sans-serif; line-height: 1.5; font-size: 13px;" > 
            <asp:Label ID="txtDescripcion" runat="server"></asp:Label>
            
            <div style="width:500px; margin-left: 570px; float: left; margin-top: -40px;" class="letra-articulo">
            </div>
         </div>
            <br />
         <%--<div class="letra-articulo">--%>
            <p class="txtdesc">#Indelek: <asp:Label ID="txtArticulo" runat="server" Text='<%# Bind("articulo")%>'></asp:Label>
            │ <asp:Label ID="Label1" runat="server"></asp:Label>
            #Fabricante: <asp:Label ID="txtClave" runat="server"></asp:Label> </p>


                <p class="txtdesc">
                Sucursal: <asp:Label  ID="txtSucursal"  runat="server"></asp:Label>
                Cant.:<asp:Label ID="txtDisponible" runat="server"></asp:Label>

                <asp:ListView ID="ListView1" runat="server">
                    <ItemTemplate>
                        <a  style="width: 111px;"
                            class="href_Carrito"
                            onclick="Muestra_Mensaje('Agregando Artículo al Carrito...')"
                            href ='AgregarArticulo.aspx?lcArticulo=<%# Eval("articulo")%>&lnPrecio=<%# Eval("precio")%>'>
                            <div class="agregar">Agregar al Carrito</div>
                        </a>
                        </ItemTemplate>
                    </asp:ListView> 
                    <%--<table>
            <tr>
                <th style="width: 300px;"></th>
                <th style="width: 40px;"></th>	
                <th style="width: 357px;"> 
                     
                </th>	
                </tr>
            <tr>
                <td>
                    
                </td>
                <td style="width: 10px;">
                    
                </td>		
            </tr>  
            </table>--%>
                </p>
             </div>
        <div class="pyb">
 <p class="txtprecio">
            Precio</p><br />
            <p class="precio"><asp:Label ID="txtPrecio" runat="server"></asp:Label></p>
            <p class="iva">* Precios con IVA</p><br />
         <%--</div>--%>
         <%--<div class="letra-articulo">--%>
             <strong >Esado de Venta:</strong> <asp:Label ID="txtEstado_Venta" runat="server"></asp:Label>
         <%--</div>--%>
            <br />
        <%--<div class="letra-articulo">--%>
            
            </div>
      <%-- </div>--%>
            <br />
       <%--<hr  style="width: 940px; margin-left: -224px;" />--%>
   <%-- </section> --%> 
                </div>
     <%--</section>--%>


    <script type="text/javascript">
        function Cerrar() {
            window.close();
        }
    </script>

</asp:Content>