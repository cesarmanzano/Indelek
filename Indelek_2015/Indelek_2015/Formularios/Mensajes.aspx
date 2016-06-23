<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Formularios/Pagina_Maestra.Master" CodeBehind="Mensajes.aspx.vb" Inherits="Indelek_2015.RegistroAgregado" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="Registro_Exitoso">
    <asp:Label 
        runat="server" 
        ID="lblMensaje" 
        Width="700px"
        Font-Size="X-Large"
        ForeColor="DarkGreen"></asp:Label>
        <br />

    <asp:Label 
        runat="server" 
        ID="Label1" 
        Width="700px"
        Font-Size="Medium"
        ForeColor="DarkGreen"></asp:Label>
    <asp:Button 
        runat="server"
        Text="Aceptar"
        CssClass="Boton"
        ID="cmdAceptar"
        />
</div>
</asp:Content>
