﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Formularios/Pagina_Maestra.Master" CodeBehind="Ridgid.aspx.vb" Inherits="Indelek_2015.Ridgid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
      .menuu
      {

      }
      .slider{

      }
  </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <%--<script type="text/javascript">
        $(document).ready(function () {

            $('.bxslider').bxSlider({
                auto: true,
                autoControls: true,
                slideWidth: 680,
            });

            a = "";
            $('.level1').parent('li.static').prepend('<span class="glyphicon glyphicon-triangle-right icono iconoDerechaLinea"></span>');
            $('.level2').parent('li.static').prepend('<span class="glyphicon glyphicon-triangle-right icono icono-level2 iconoDerechaLinea"></span>');
            //$('.level3').prepend('<span class="glyphicon glyphicon-minus "></span>');

            $('.level1').parent('li.static').addClass('nivel1');
            $('.level2').parent('li.static').addClass('nivel2');
            $('.level3').parent('li.static').addClass('nivel3');

            $('.icono').click(function () {
                var level = $(this).parent('li.static');
                var colapsado = $(this).hasClass('glyphicon-triangle-right');
                $(this).toggleClass('glyphicon-triangle-right');
                $(this).toggleClass('glyphicon-triangle-bottom');
                //

                //

                // funcion para desplegar linea level 3
                if ($(this).hasClass('icono-level2')) {
                    if (!(colapsado)) {
                        $(level).nextUntil('.nivel2', ".nivel3").fadeOut(100);
                    }
                    else {
                        $(level).nextUntil(".nivel2", ".nivel3").fadeIn(100);
                    }

                }
                else {
                    if (!(colapsado)) {
                        $(level).nextUntil('.nivel1').fadeOut(100);
                    }
                    else {
                        console.log("jijij2");
                        $(level).nextUntil('.nivel1', '.nivel2').fadeIn(100);
                        a = $(level);
                        $(level).nextUntil('.nivel1', '.nivel2').find('.icono-level2').removeClass('glyphicon-triangle-bottom');
                        $(level).nextUntil('.nivel1', '.nivel2').find('.icono-level2').addClass('glyphicon-triangle-right');

                    }

                }
            });
            $(".nivel2").hide();
            $(".nivel3").hide();
        });


    </script>--%>

    <section id="contenido">     
        <div>   
            <div class="menuu">
      
     <asp:Menu ID="Menu_Dinamico" runat="server" class="W1-h16"
                
                orientation="Vertical"
                
               > </asp:Menu>  
    </div>                                             
    <%--<asp:Menu ID="Menu_Dinamico"  runat="server" 
                staticdisplaylevels="3"
                staticsubmenuindent="10" 
                orientation="Vertical"
                onmenuitemclick="Menu_Dinamico_MenuItemClick" 
                style=" font-size:      11pt;
	                    font-family:    Tahoma;
                        padding:        5px;
                        margin-left:    3px;
                        margin-top:     15px;
                        text-align:     left;
                        float:          left;
                        position:       relative;
                        z-index:        10;
                        border-style:   none solid solid;
                        border:         1px solid #223B65;        
                        height:         445px; 
                        width:          285px;
                        overflow-x:hidden; 
                        overflow-y:scroll;
                         ">
    </asp:Menu>  --%>
            <div class="slider">
    <ul class="rslides" id="slider1">
        <li><a id="hrefImagen32" href="javascript:void(0)"> <asp:Image ID="Image32" ImageUrl="../imasmenu/m1.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen33" href="javascript:void(0)"> <asp:Image ID="Image33" ImageUrl="../imasmenu/m2.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen34" href="javascript:void(0)"> <asp:Image ID="Image34" ImageUrl="../imasmenu/m3.jpg" runat="server" /></a></li>
        <li><a id="hrefImagen35" href="javascript:void(0)"> <asp:Image ID="Image35" ImageUrl="../imasmenu/m3.jpg" runat="server" /></a></li>
    </ul>
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

    <div style="display:none">
    <table  style=" width:100%; cellspacing:10; cellpadding:10";>
        <tr>
            <td>
                <a id="hrefImagen1" href="javascript:void(0)">
                    <asp:Image
                        ID="Image1"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesRidgid/A1.jpg"
                        ToolTip='~/ImagenesRidgid/A1.jpg' 

                        runat="server" />
                </a>
            </td>
            <td>
                <a id="hrefImagen2" href="javascript:void(0)">
                    <asp:Image
                        ID="Image2"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesRidgid/A2.jpg"
                        ToolTip='~/ImagenesRidgid/A2.jpg' 
                        runat="server" />
                </a>
            </td>
            <td>
                <a id="hrefImagen3" href="javascript:void(0)">
                    <asp:Image
                        ID="Image3"
                        Height="165px"
                        Width="330px"
                        ImageUrl="~/ImagenesRidgid/A3.jpg"
                        ToolTip='~/ImagenesRidgid/A3.jpg'       
                        runat="server" />
                </a>
            </td>
        </tr>
    </table>
    <br />
    
    <table>
        <tr>
            <td>
               <a id="hrefImagen4" href="javascript:void(0)">
                   <asp:Label ID="txtD1" runat="server" Text=""></asp:Label>
                    <asp:Image
                        ID="Image4"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesRidgid/B1.jpg"
                        ToolTip='~/ImagenesRidgid/B1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/B2.jpg"
                                ToolTip='~/ImagenesRidgid/B2.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/B3.jpg"
                                ToolTip='~/ImagenesRidgid/B3.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/B4.jpg"
                                ToolTip='~/ImagenesRidgid/B4.jpg' 
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
                        ImageUrl="~/ImagenesRidgid/C1.jpg"
                        ToolTip='~/ImagenesRidgid/C1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/C2.jpg"
                                ToolTip='~/ImagenesRidgid/C2.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/C3.jpg"
                                ToolTip='~/ImagenesRidgid/C3.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/C4.jpg"
                                ToolTip='~/ImagenesRidgid/C4.jpg' 
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
                        ImageUrl="~/ImagenesRidgid/D1.jpg"
                        ToolTip='~/ImagenesRidgid/D1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/D2.jpg"
                                ToolTip='~/ImagenesRidgid/D2.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/D3.jpg"
                                ToolTip='~/ImagenesRidgid/D3.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/D4.jpg"
                                ToolTip='~/ImagenesRidgid/D4.jpg' 
                                runat="server" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

    <table>
        <tr>
            <td>
                <a id="hrefImagen16" href="javascript:void(0)">
                   
                    <asp:Image
                        ID="Image16"
                        Height="240px"
                        Width="255px"
                        ImageUrl="~/ImagenesRidgid/E1.jpg"
                        ToolTip='~/ImagenesRidgid/E1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/E2.jpg"
                                ToolTip='~/ImagenesRidgid/E2.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/E3.jpg"
                                ToolTip='~/ImagenesRidgid/E3.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/E4.jpg"
                                ToolTip='~/ImagenesRidgid/E4.jpg' 
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
                        ImageUrl="~/ImagenesRidgid/F1.jpg"
                        ToolTip='~/ImagenesRidgid/F1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/F2.jpg"
                                ToolTip='~/ImagenesRidgid/F2.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/F3.jpg"
                                ToolTip='~/ImagenesRidgid/F3.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/F4.jpg"
                                ToolTip='~/ImagenesRidgid/F4.jpg' 
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
                        ImageUrl="~/ImagenesRidgid/G1.jpg"
                        ToolTip='~/ImagenesRidgid/G1.jpg' 
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
                                ImageUrl="~/ImagenesRidgid/G2.jpg"
                                ToolTip='~/ImagenesRidgid/G2.jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen26" href="javascript:void(0)">
                            <asp:Image
                                ID="Image26"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G3.jpg"
                                ToolTip='~/ImagenesRidgid/G3.jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen27" href="javascript:void(0)">
                            <asp:Image
                                ID="Image27"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G4.jpg"
                                ToolTip='~/ImagenesRidgid/G4jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen28" href="javascript:void(0)">
                            <asp:Image
                                ID="Image28"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G4.jpg"
                                ToolTip='~/ImagenesRidgid/G4jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen29" href="javascript:void(0)">
                            <asp:Image
                                ID="Image29"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G4.jpg"
                                ToolTip='~/ImagenesRidgid/G4jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen30" href="javascript:void(0)">
                            <asp:Image
                                ID="Image30"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G4.jpg"
                                ToolTip='~/ImagenesRidgid/G4jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a id="hrefImagen31" href="javascript:void(0)">
                            <asp:Image
                                ID="Image31"
                                Height="80px"
                                Width="70px"
                                ImageUrl="~/ImagenesRidgid/G4.jpg"
                                ToolTip='~/ImagenesRidgid/G4jpg'
                                runat="server" />
                            </a>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        </div>
   



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



