<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Comentarios.aspx.vb" Inherits="Indelek_2015.Comentarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br /><br />
<div style="text-align:left">    
    <div style="text-shadow: 1px 1px 1px DarkGray;">
        <h2>
            Comentarios
        </h2>
        <hr />
    </div>
    <br />
    <table>
        <tr>
            <td style="color:black"><b>Nombre</b></td>
            <td><asp:TextBox runat="server" ID="txtNombre" required="required" CssClass="txtTexto" Columns="40"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="color:black"><b>Empresa o Raz&oacuten Social</b></td>
            <td><asp:TextBox ID="txtEmpresa" runat="server" CssClass="txtTexto" Columns="40"></asp:TextBox></td>            
        </tr>
        <tr>
            <td style="color:black"><b>Telefono</b></td>
            <td><asp:TextBox ID="txtTelefono" runat="server" required="required" type="tel" Columns="40" CssClass="txtTexto"></asp:TextBox></td>            
        </tr>
        <tr>
            <td style="color:black"><b>Correo Electr&oacutenico</b></td>
            <td><asp:TextBox ID="txtCorreo" runat="server" Columns="40" required="required" type="email" CssClass="txtTexto"></asp:TextBox></td>
        </tr>
        <tr>
            <td style="color:black"><b>Comentarios</b></td>
            <td><asp:TextBox 
                ID="txtComentarios" 
                runat="server" 
                required="required"
                TextMode="MultiLine" 
                Columns="40" 
                CssClass="txtTexto"
                Height="100px"
                Rows="5" ></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button 
                    runat="server" 
                    CssClass="agregar2"
                    ID="cmdComentarios"
                    Text="Envíar"/>
            </td>
        </tr>
    </table>    
</div>

    <script src="../Scripts/Funciones.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-2.0.3.js" type="text/javascript"></script>

</asp:Content>
