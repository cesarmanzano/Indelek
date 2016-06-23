<%@ Page  Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Facturacion.aspx.vb" Inherits="Indelek_2015.Facturacion" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="Facturacion">
        <label>N&uacutemero de Factura</label>&nbsp&nbsp

        <asp:TextBox runat="server" ID="txtFactura" required="required"></asp:TextBox>&nbsp&nbsp
        <asp:Button ID="cmdFactura" runat="server" Text="Ver Factura" CssClass="cmdFactura"/>
    </div>
    <div class="Mensaje_Error" id="mensajeError">
        <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
    </div>
    <div>
        <rsweb:ReportViewer
            ID="loReporte" 
            runat="server"
            Height="560px" 
            Width="1007px"
            Font-Names="Verdana" Font-Size="8pt">
        </rsweb:ReportViewer>                          
    </div>
    <br />
    <div>
        <asp:Button ID="cmdPDF" runat="server" Text="Descargar PDF" CssClass="Boton"/>
        <asp:Button ID="cmdXML" runat="server" Text="Descargar XML" CssClass="Boton"/>        
    </div>
    <br />
    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
