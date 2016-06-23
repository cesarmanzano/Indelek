<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Formularios/Pagina_Maestra.Master" CodeBehind="Datos_Articulo.aspx.vb" Inherits="Indelek_2015.Datos_Articulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <form id="form2" runat="server">


<div style="font-family: Arial;"> 
    <div style =" margin-left: -820px; margin-top: 50px; margin-bottom: -35px;">    
        <asp:Image
            ID="imgFoto" 
            runat="server"
            Height="215px"
            onerror="src='../Imagenes/nodisponible.jpg'"
            ImageUrl="~/Imagenes/Cargando.gif"
            Width="200px"/>
    </div>   
        &nbsp&nbsp&nbsp
    <section style="width:700px; float:right; margin-top: -186px;  margin-right: 100px; text-align: left;">
        <div style="width:470px; font-family:Arial,Helvetica, Nimbus Sans L, Liberation Sans, FreeSans,sans-serif; line-height: 1.5; font-weight: bold; font-size: 13px;">                
            <asp:Label ID="txtNombre" runat="server"></asp:Label>
        </div>  
        <div style=" width:470px; font-family:Arial,Helvetica, Nimbus Sans L, Liberation Sans, FreeSans,sans-serif; line-height: 1.5; font-size: 13px;" > 
            <asp:Label ID="txtDescripcion" runat="server"></asp:Label>
            
            <div style="width:500px; margin-left: 570px; float: left; margin-top: -40px;" class="letra-articulo">
            </div>
         </div>
            <br />
         <div class="letra-articulo">
            <strong>#Indelek:</strong> 
            <asp:Label ID="txtArticulo" runat="server" Text='<%# Eval("articulo")%>'></asp:Label>
            
             <strong style="margin-left:16px;" ></strong>│ <asp:Label ID="Label1" runat="server"></asp:Label>
            <strong style="margin-left:16px;">#Fabricante:</strong> <asp:Label ID="txtClave" runat="server"></asp:Label> 
            <strong style="margin-left:570px;">Precio</strong><br />
            <asp:Label style="margin-left: 570px; font-size: 35px; line-height: 38px; font-weight: bold; color: #101011;" ID="txtPrecio" runat="server"></asp:Label>
            <strong style="margin-left:570px; font-size: 11px !important;">* Precios sin IVA</strong><br />
         </div>
         <div class="letra-articulo">
             <strong >Esado de Venta:</strong> <asp:Label ID="txtEstado_Venta" runat="server"></asp:Label>
         </div>
            <br />
        <div class="letra-articulo">
            <table>
            <tr>
                <th style="width: 300px;">Sucursal</th>
                <th style="width: 40px;">Cant.</th>	
                <th style="width: 357px;"> 
                    <asp:SqlDataSource ID="Tabla_Articulos" runat="server" ConnectionString="<%$ ConnectionStrings:ERP_CIEConnectionString %>" SelectCommand="Informacion_Articulo_Web_Indelek" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="nCliente" SessionField="nCliente" Type="Int32" />
                            <asp:Parameter DefaultValue="cArticulo" Name="cArticulo" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:ListView ID="ListView1" runat="server" AutoPostback = "Flash">
                        <ItemTemplate>
                            <a  style="width: 111px;"
                                class="href_Carrito"
                                onclick="Muestra_Mensaje('Agregando Artículo al Carrito...')"
                                href ='AgregarArticulo.aspx?lcArticulo=<%# Eval("articulo")%>&lnPrecio=<%# Eval("precio")%>'>
                                <strong>Agregar al Carrito</strong>
                            </a>
                         </ItemTemplate>
                     </asp:ListView>  
                </th>	
                </tr>
            <tr>
                <td>
                    <asp:Label  ID="txtSucursal"  runat="server">&nbsp;</asp:Label>
                </td>
                <td style="width: 10px;">
                    <asp:Label ID="txtDisponible" runat="server"></asp:Label>
                </td>		
            </tr>  
            </table>
       </div>
            <br />
       <hr  style="width: 940px; margin-left: -224px;" />
    </section>  
           <asp:Button Text="Descargar Documentos" runat="server"/> 
    <script type="text/javascript">
        function Cerrar() {
            window.close();
        }
    </script>

    </form>
</asp:Content>