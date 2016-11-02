<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Login.aspx.vb" Inherits="Indelek_2015.Login1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">   
    <style type="text/css">
body {background:url(../imasmenu/fondo.png); margin:0px auto;}



</style>

<link href="../Estilos/my.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="../Estilos/animate.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/Estilos/font-awesome.min.css"><script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.js"></script>
<script type="text/javascript" src="../Scripts/modernizr.js"></script>
<script src="../Scripts/foundation.min.js"></script>         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<main>
    <section class="area_inicio">
        <h3>Inicio de Sesion</h3>
        <table id="Login">
            <tr>
                <td class="espacio2">Cliente</td>
                <td class="espacio">
                    <asp:TextBox                                
                        required="required"
                        ID="txtUsuario"
                        placeholder="Número de Cliente"            
                    
                        autocomplete="on"
                        runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="espacio2">Contraseña</td>
                <td class="espacio">
                    <asp:textbox                    
                        ID="txtContrasena" 
                        required="required"
                        type="Password"
                        placeholder="Contraseña"
                        runat="server"></asp:textbox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td class="espacio">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                        ID="cmdIniciar"                      
                        runat="server"
                        OnClientClick="Valida_Usuario"
                        CssClass="agregar2"
                        Text="Iniciar"/>
                </td>                
            </tr>            
            <tr>
                <td >
                </td>
                <td class="espacio">
                    <br />
                    <a href="Recuperar_Contrasena.aspx">¿Olvido su Contraseña?</a><br />
                    <a href="Registro.aspx">Registrarse</a>
                </td>
            </tr>            
        </table>
    </section>
</main>  
<div class="Mensaje_Error" id="mensajeError">
    <asp:Label ID="lblError" runat="server" Visible="false"></asp:Label>
</div>
  
    <script src="../Scripts/Funciones.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-2.0.3.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery-2.0.3.js" type="text/javascript"></script>
    
<script type="text/javascript">
    
    var txtUsuario = $("#txtUsuario");
    var txtContrasena = $("#txtContrasena");

    if (txtUsuario.addEventListener) {  // all browsers except IE before version 9
        txtUsuario.addEventListener("onkeypress", function () { Valida_Enter_Local() }, false);
        txtUsuario.addEventListener("onkeypress", function () { Valida_Enter_Local() }, false);
    }
    else {
        if (txtUsuario.attachEvent) {   // IE before version 9
            txtUsuario.attachEvent("onkeypress", function () { Valida_Enter_Local() });
            txtUsuario.attachEvent("onkeypress", function () { Valida_Enter_Local() });
        }
    }

    if (txtContrasena.addEventListener) {  // all browsers except IE before version 9
        txtContrasena.addEventListener("onkeypress", function () { Valida_Enter_Local() }, false);
        txtContrasena.addEventListener("onkeypress", function () { Valida_Enter_Local() }, false);
    }
    else {
        if (txtContrasena.attachEvent) {   // IE before version 9
            txtContrasena.attachEvent("onkeypress", function () { Valida_Enter_Local() });
            txtContrasena.attachEvent("onkeypress", function () { Valida_Enter_Local() });
        }
    }

    function Valida_Enter_Local() {        
        var key = window.event.keyCode;

        if (key == 13)
            document.getElementById("cmdIniciar").click();
    }
</script>

</asp:Content>
