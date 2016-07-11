<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Principal.aspx.vb" Inherits="Indelek_2015.Principal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <style type="text/css">
      .menuu
      {

      }
      .slider{

      }
  </style>
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <nav class="default" > 
        <ul id="nav"> 
        <li><a href="Principal.aspx" title="Productos" >Productos</a>
            <ul class="W1-h16">
                <%--<li>--%>
<asp:Menu ID="Menu_Dinamico" runat="server" class="W1-h16" orientation="Vertical">
                </asp:Menu>
                <%--</li>--%>
            </ul>
            
        </li>
        <li><a href="Facturacion.aspx" title="Facturación">Facturación</a></li>
        <li><a href="Comentarios.aspx" title="Comentarios">Comentarios</a></li>
        <li><a href="#" title="Acerca de">Acerca de</a></li>
        <li><a href="Contacto.aspx" title="Contacto">Contacto</a></li>
        <li><a href="Ridgid.aspx" title="Ridgid">Ridgid</a></li>
        </ul> 
    </nav>
</asp:Content>
    
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Site_Map_Principal" style="background-color: RGB(253,142,146)" >
        <asp:Menu ID="Menu2" runat="server" DataSourceID="SiteMapDataSource1"></asp:Menu>
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
    </div>

  
<%--<div id="Contenedor_Menu_Dinamico" >  --%>    
    <section id="contenido">     
        <div>   
        
            <div class="menuu">                                      
                <%--<asp:Menu ID="Menu_Dinamico" runat="server" class="W1-h16" orientation="Vertical">
                </asp:Menu> --%> 
           </div>
<%--<div>--%>
    <%--<div class="slider">
        <ul class="bxslider"> 
          <li> <a id="hrefImagen28" href="javascript:void(0)"> <asp:Image ID="Image28" ImageUrl="~/ImagenesUsuario/S1.jpg" runat="server" /></a></li>
          <li> <a id="hrefImagen29" href="javascript:void(0)"> <asp:Image ID="Image29" ImageUrl="~/ImagenesUsuario/S2.jpg" runat="server" /></a></li>
          <li> <a id="hrefImagen30" href="javascript:void(0)"> <asp:Image ID="Image30" ImageUrl="~/ImagenesUsuario/S3.jpg" runat="server" /></a></li>
          <li> <a id="hrefImagen31" href="javascript:void(0)"> <asp:Image ID="Image31" ImageUrl="~/ImagenesUsuario/S4.jpg" runat="server" /></a></li>
        </ul>
     </div>--%>
            <div class="slider">
    <ul class="rslides" id="slider1">
        <li><a id="hrefImagen28" href="javascript:void(0)"> <asp:Image ID="Image28" ImageUrl="../imasmenu/m1.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen29" href="javascript:void(0)"> <asp:Image ID="Image29" ImageUrl="../imasmenu/m2.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen30" href="javascript:void(0)"> <asp:Image ID="Image30" ImageUrl="../imasmenu/m3.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen31" href="javascript:void(0)"> <asp:Image ID="Image31" ImageUrl="../imasmenu/m3.jpg" runat="server" /></a></li>
    </ul>
                </div>
            </div>

        <div id="secciones">

    <div id="cuadros" class="iluminacion">
    <div class="txtcuadro">Iluminación</div>
    </div>

    <div id="cuadros" class="soporte">
    <div class="txtcuadro">Soporteria</div>
    </div>

    <div id="cuadros" class="herramienta">
    <div class="txtcuadro">Herramienta</div>
    </div>

    <div id="cuadros" class="cable">
    <div class="txtcuadro">Cable</div>
    </div>

    </div>
    </section>
<br />
    <div id="logotipos">
<ul id="flexiselDemo3">
    <li><img src="../imasmenu/philips.png" width="230" height="47" /></li>
    <li><img src="../imasmenu/rawelt.png" width="215" height="47" /></li>
    <li><img src="../imasmenu/thomas-betts.png" /></li>
    <li><img src="../imasmenu/viakon.png" width="223" height="46" /></li>
    </ul>    
</div>

  

    <table  style=" width:100%; cellspacing:10; cellpadding:10;display:none">
        <tr>
            <td>
                <a id="hrefImagen1" href="javascript:void(0)">
                    <asp:Image
                        ID="Image1"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesUsuario/A1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <a id="hrefImagen2" href="javascript:void(0)">
                    <asp:Image
                        ID="Image2"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesUsuario/A2.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <a id="hrefImagen3" href="javascript:void(0)">
                    <asp:Image
                        ID="Image3"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesUsuario/A3.jpg"
                        runat="server" />
                </a>
            </td>
        </tr>
    </table>
    <br />
    
    <table style="display:none">
        <tr>
            <td>
               <a id="hrefImagen4" href="javascript:void(0)">
                   <asp:Label ID="txtD1" runat="server" Text=""></asp:Label>
                    <asp:Image
                        ID="Image4"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/B1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <table style="margin-left: -4px;">

                    <tr>
                        <td>
                            <a id="hrefImagen5" href="javascript:void(0)">
                            <asp:Image
                                ID="Image5"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/B2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <a id="hrefImagen6" href="javascript:void(0)">
                            <asp:Image
                                ID="Image6"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/B3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen7" href="javascript:void(0)">
                            <asp:Image
                                ID="Image7"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/B4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <a id="hrefImagen8" href="javascript:void(0)" style="text-decoration: none;">
          
                    <asp:Image
                        ID="Image8"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/C1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <table style="margin-left: -4px;">
                    <tr>
                        <td>
                            <a id="hrefImagen9" href="javascript:void(0)">
                            <asp:Image
                                ID="Image9"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/C2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen10" href="javascript:void(0)">
                            <asp:Image
                                ID="Image10"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/C3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen11" href="javascript:void(0)">
                            <asp:Image
                                ID="Image11"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/C4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <a id="hrefImagen12" href="javascript:void(0)">
                
                    <asp:Image
                        ID="Image12"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/D1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <table style="margin-left: -4px;">

                    <tr>
                        <td>
                            <a id="hrefImagen13" href="javascript:void(0)">
                            <asp:Image
                                ID="Image13"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/D2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen14" href="javascript:void(0)">
                            <asp:Image
                                ID="Image14"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/D3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen15" href="javascript:void(0)">
                            <asp:Image
                                ID="Image15"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/D4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table style="display:none">
        <tr>
            <td>
                <a id="hrefImagen16" href="javascript:void(0)">
                   
                    <asp:Image
                        ID="Image16"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/E1.jpg"
                        runat="server" />
                </a>

            </td>
            <td>
                <table style="margin-left: -4px;">

                    <tr>
                        <td>
                            <a id="hrefImagen17" href="javascript:void(0)">
                            <asp:Image
                                ID="Image17"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/E2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <a id="hrefImagen18" href="javascript:void(0)">
                            <asp:Image
                                ID="Image18"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/E3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                             <a id="hrefImagen19" href="javascript:void(0)">
                            <asp:Image
                                ID="Image19"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/E4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <a id="hrefImagen20" href="javascript:void(0)">
                   
                    <asp:Image
                        ID="Image20"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/F1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <table style="margin-left: -4px;">

                    <tr>
                        <td>
                             <a id="hrefImagen21" href="javascript:void(0)">
                            <asp:Image
                                ID="Image21"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/F2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen22" href="javascript:void(0)">
                            <asp:Image
                                ID="Image22"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/F3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen23" href="javascript:void(0)">
                            <asp:Image
                                ID="Image23"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/F4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
            <td>
                <a id="hrefImagen24" href="javascript:void(0)">
                   
                    <asp:Image
                        ID="Image24"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesUsuario/G1.jpg"
                        runat="server" />
                </a>
            </td>
            <td>
                <table style="margin-left: -4px;">

                    <tr>
                        <td>
                            <a id="hrefImagen25" href="javascript:void(0)">
                            <asp:Image
                                ID="Image25"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/G2.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen26" href="javascript:void(0)">
                            <asp:Image
                                ID="Image26"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/G3.jpg"
                                runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen27" href="javascript:void(0)">
                            <asp:Image
                                ID="Image27"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesUsuario/G4.jpg"
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <%--</div>--%>

<%--</div>--%>
    <script>
jQuery(document).ready
	 // DOM ready
	 $(function() {
      // Create the dropdown base
      $("<select />").appendTo("nav");
      // Create default option "Go to..."
      $("<option />", {
         "selected": "selected",
         "value"   : "",
         "text"    : "Seleccionar Sección..."
      }).appendTo("nav select");
       // Populate dropdown with menu items
      $("nav a").each(function() {
       var el = $(this);
       $("<option />", {
           "value"   : el.attr("href"),
           "text"    : el.text()
       }).appendTo("nav select");
      });
	   // To make dropdown actually work
	   // To make more unobtrusive: http://css-tricks.com/4064-unobtrusive-page-changer/
      $("nav select").change(function() {
        window.location = $(this).find("option:selected").val();
      });
	 });
</script>
<script type="text/javascript">

    $("#hrefImagen1").attr("href", $("#ContentPlaceHolder1_Image1").attr("AlternateText"));
    $("#hrefImagen2").attr("href", $("#ContentPlaceHolder1_Image2").attr("AlternateText"));
    $("#hrefImagen3").attr("href", $("#ContentPlaceHolder1_Image3").attr("AlternateText"));
    $("#hrefImagen4").attr("href", $("#ContentPlaceHolder1_Image4").attr("AlternateText"));
    $("#hrefImagen5").attr("href", $("#ContentPlaceHolder1_Image5").attr("AlternateText"));
    $("#hrefImagen6").attr("href", $("#ContentPlaceHolder1_Image6").attr("AlternateText"));
    $("#hrefImagen7").attr("href", $("#ContentPlaceHolder1_Image7").attr("AlternateText"));

    $("#hrefImagen8").attr("href", $("#ContentPlaceHolder1_Image8").attr("AlternateText"));
    $("#hrefImagen9").attr("href", $("#ContentPlaceHolder1_Image9").attr("AlternateText"));
    $("#hrefImagen10").attr("href", $("#ContentPlaceHolder1_Image10").attr("AlternateText"));
    $("#hrefImagen11").attr("href", $("#ContentPlaceHolder1_Image11").attr("AlternateText"));
    $("#hrefImagen12").attr("href", $("#ContentPlaceHolder1_Image12").attr("AlternateText"));
    $("#hrefImagen13").attr("href", $("#ContentPlaceHolder1_Image13").attr("AlternateText"));
    $("#hrefImagen14").attr("href", $("#ContentPlaceHolder1_Image14").attr("AlternateText"));

    $("#hrefImagen15").attr("href", $("#ContentPlaceHolder1_Image15").attr("AlternateText"));
    $("#hrefImagen16").attr("href", $("#ContentPlaceHolder1_Image16").attr("AlternateText"));
    $("#hrefImagen17").attr("href", $("#ContentPlaceHolder1_Image17").attr("AlternateText"));
    $("#hrefImagen18").attr("href", $("#ContentPlaceHolder1_Image18").attr("AlternateText"));
    $("#hrefImagen19").attr("href", $("#ContentPlaceHolder1_Image19").attr("AlternateText"));
    $("#hrefImagen20").attr("href", $("#ContentPlaceHolder1_Image20").attr("AlternateText"));
    $("#hrefImagen21").attr("href", $("#ContentPlaceHolder1_Image21").attr("AlternateText"));
    $("#hrefImagen22").attr("href", $("#ContentPlaceHolder1_Image22").attr("AlternateText"));
    $("#hrefImagen23").attr("href", $("#ContentPlaceHolder1_Image23").attr("AlternateText"));


    $("#hrefImagen24").attr("href", $("#ContentPlaceHolder1_Image24").attr("AlternateText"));
    $("#hrefImagen25").attr("href", $("#ContentPlaceHolder1_Image25").attr("AlternateText"));
    $("#hrefImagen26").attr("href", $("#ContentPlaceHolder1_Image26").attr("AlternateText"));
    $("#hrefImagen27").attr("href", $("#ContentPlaceHolder1_Image27").attr("AlternateText"));
    $("#hrefImagen28").attr("href", $("#ContentPlaceHolder1_Image28").attr("AlternateText"));
    $("#hrefImagen29").attr("href", $("#ContentPlaceHolder1_Image29").attr("AlternateText"));
    $("#hrefImagen30").attr("href", $("#ContentPlaceHolder1_Image30").attr("AlternateText"));
    $("#hrefImagen31").attr("href", $("#ContentPlaceHolder1_Image31").attr("AlternateText"));

</script>

</asp:Content>
