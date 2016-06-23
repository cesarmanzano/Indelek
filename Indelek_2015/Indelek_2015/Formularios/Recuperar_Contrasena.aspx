<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Formularios/Pagina_Maestra.Master" CodeBehind="Recuperar_Contrasena.aspx.vb" Inherits="Indelek_2015.Recuperar_Contrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<div id="Tabla_Envio_Correo">
    <table>
        <tr>
            <td>
                <asp:Label
                    runat="server" 
                    ID="lblFactura" 
                    Width="150px"
                    Text="N&uacutemero de Cliente"></asp:Label>
            </td>
            <td>
                <asp:TextBox 
                    runat="server" 
                    ID="txtCliente" 
                    required="required"                    
                    Width="120px"        
                    BorderWidth="0"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label 
                    runat="server" 
                    ID="lblCorreo" 
                    Width="150px"
                    Text="Correo Electr&oacutenico"></asp:Label>
            </td>
            <td>
                <asp:TextBox 
                    BorderWidth="0"
                    ID="txtCorreo" 
                    type="email"
                    required="required"
                    placeholder="ejemplo@dominio.com"
                    runat="server"
                    Width="300px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>

            </td>
            <td>
                <asp:Button 
                    CssClass="Redondeado"
                    ID="cmdEnviar" 
                    runat="server" 
                    Width="120px"
                    Text="Enviar" />
            </td>                
        </tr>
    </table>
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
