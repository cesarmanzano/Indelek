<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Consultas_Usuario.aspx.vb" Inherits="Indelek_2015.Consultas_Usuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<div>        
    <table class="Opciones_Usuario">
        <tr>
            <td>
                <label>Seguimiento de Pedidos</label><br />
                <asp:ImageButton 
                    ID="imgSeguimiento_Pedidos" 
                    name="imgSeguimiento_Pedidos" 
                    runat="server" 
                    class="Imagenes_Consulta"
                    ImageUrl="~/Imagenes/pedidos.png"/>
            </td>
            <td>
                <label>Estado de Cuenta</label><br />
                <asp:ImageButton 
                    ID="imgEstado_Cuenta" 
                    name="imgEstado_Cuenta" 
                    runat="server" 
                    class="Imagenes_Consulta"
                    ImageUrl="~/Imagenes/EstadoCuenta.png"
                    OnClick="imgEstado_Cuenta_Click"/>
            </td>
        </tr>
        <tr>
            <td>
                <label>Carrito de Compras</label><br />
                <asp:ImageButton 
                    ID="imgLista_Deseos" 
                    name="imgLista_Deseos" 
                    runat="server" 
                    class="Imagenes_Consulta"
                    ImageUrl="~/Imagenes/lista.png"
                    />
            </td>
            <td>
                <label>Facturaci&oacuten</label><br />
                <asp:ImageButton ID="Image4" runat="server" class="Imagenes_Consulta"
                    ImageUrl="~/Imagenes/factura.png"/>
            </td>
        </tr>
    </table>
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
