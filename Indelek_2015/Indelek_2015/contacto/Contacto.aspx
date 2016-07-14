<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Contacto.aspx.cs" Inherits="Contacto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='http://fonts.googleapis.com/css?family=Hind:400,300,600,700' rel='stylesheet' type='text/css'>
     <script src='https://www.google.com/recaptcha/api.js'></script>
     
     <script src="http://code.jquery.com/jquery-1.8.2.min.js" type="text/javascript"></script>

<script src="../scripts/responsiveiframe.js"></script>

<script>
  var ri = responsiveIframe();
  ri.allowResponsiveEmbedding();
</script>

<style type="text/css">
#forma{ max-width:900px; height:auto; margin:0px auto;}
#formanombre, #formatelefono, #formaemail, #formamensaje{max-width:140px; text-align:center; margin:0px auto; font-size: 18px; display:inline-block;vertical-align: top;}

#formaenviar{max-width:350px; text-align:center; margin:0px auto; font-size:24px; display:inline-block;}
/*#formamensaje, #formaenviar{ height:100px;}*/
.g-recaptcha{  width: 310px; display: inline-block; margin:15px;}

#formanombre, #formatelefono, #formaemail, #formamensaje, #formaenviar, input[type="password"], input[type="search"] , input[type="form"], input[type="email"], input[type="tel"], textarea{font-family: 'Hind', sans-serif; color:#ffffff; text-shadow: black 0.1em 0.1em 0.2em;height:100px}

/*Redondear Campos de Texto*/	

input[type="password"], input[type="search"] , input[type="form"], input[type="email"], input[type="tel"], textarea, input[type="text"] {
    border:1px solid #ccc;
    font-size:16px;
	margin:0px 5px 0px 0px;
    padding:5px-webkit-box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	-moz-box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;-o-border-radius:5px;
	border-radius:5px; text-align:center; font-family:Verdana, Geneva, sans-serif;
	width:100%;} 	
	
	 input[type="text"], textarea {
    border:none;
    font-size:16px;
	margin:0px 5px 0px 0px;
    padding:5px-webkit-box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	-moz-box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	box-shadow:1px 1px 2px rgba(0, 0, 0, 0.2) inset;
	-moz-border-radius:5px;
	-webkit-border-radius:5px;-o-border-radius:5px;
	border-radius:5px; text-align:center; font-family:Verdana, Geneva, sans-serif;
	width:100%;
	/*background-image: linear-gradient(to bottom,#00758a,#014457);*/
background-repeat: repeat-x;
height: 32px;
color:#000000;
background-color:#ffffff;
} 

#Button1{ width:100px; height:50px; color:#ffffff; background-color:#fc4349; font-size: 24px; border:none; text-shadow: black 0.1em 0.1em 0.2em; margin:0px;}

#Button1:hover{ background:#D72F34;}

#RequiredFieldValidator1, #RequiredFieldValidator2, #RequiredFieldValidator3, #RegularExpressionValidator16{ font-size:14px;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="forma">
      <div id="formanombre"> Nombre<br /> <asp:TextBox ID="tbNombre" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="tbNombre" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="validar">* Este campo es requerido</asp:RequiredFieldValidator></div>
                    
      <div id="formatelefono">
      Teléfono <br /> <asp:TextBox ID="tbTelefono" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="tbTelefono" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="validar">* Este campo es requerido</asp:RequiredFieldValidator>
                    
      </div>       
      
      <div id="formaemail">
      Email <br /> <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="tbEmail" ErrorMessage="RequiredFieldValidator" 
                    ValidationGroup="validar">* Este campo es requerido</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator16" 
                    runat="server" ControlToValidate="tbEmail" ErrorMessage="Correo Invalido" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="validar"></asp:RegularExpressionValidator>
      </div>       
      
      <div id="formamensaje">
      Mensaje <br /> <asp:TextBox ID="tbMensaje" runat="server" Width="90%" TextMode="MultiLine" ></asp:TextBox>
      </div>
      
      <div id="formaenviar">
      
       <div class="g-recaptcha" data-sitekey="6LfYrSMTAAAAADtMIOhQ1Eoiu1UzdGUASqpN4Gsu">
                </div>
      </div>
    <asp:Button ID="Button1" runat="server" Text="Enviar" OnClick="Button1_Click" ValidationGroup="validar" />
    </div>
    </form>
</body>
</html>
