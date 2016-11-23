<%@ Page ValidateRequest="false" Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Prueba.aspx.vb" Inherits="Indelek_2015.Prueba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


<div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>

<div id="Barra_Izquierda_Muestra">
    <article class="Informacion_Muestra">
        <div class="Filtros">
            <div class="filtrostitulo">Marcas</div>
            <asp:ListView ID="Filtros_Marca" runat="server" style="text-align:left">
                <LayoutTemplate>
                    <div style="border-radius: 2px; vertical-align:middle;">                                 
                        <table>
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>      
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <a class="filtro" 
                                href="Prueba.aspx?cTexto=<%=Request.QueryString("cTexto")%>
                                &cMarca=<%#DataBinder.Eval(Container.DataItem, StrConv("nombre_marca", vbProperCase).Trim)%>
                                &lcFolio=<%=Request.QueryString("lcFolio")%>
                                &lnCuantos=<%=Request.QueryString("lnCuantos")%>
                                &llMarca=1">
                                <%#DataBinder.Eval(Container.DataItem, StrConv("nombre_marca",vbProperCase))%>&nbsp
                                (<%#DataBinder.Eval(Container.DataItem, "cuantos")%>)
                            </a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <br />
                            <br />
            <a  class="agregar"
                href="Prueba.aspx?cTexto=<%=
 Request.QueryString("cTexto")%>&cPrecio=<%=
                Request.QueryString("cPrecio")
                %>&lcFolio=<%=Request.QueryString("lcFolio")
                %>&lnCuantos=<%=Request.QueryString("lnCuantos")%>&llMarca=1">
                Quitar Filtro
            </a>
        </div>
        <br /><br />
        <div class="Filtros">
           <div class="filtrostitulo">Precios</div>
            <asp:ListView ID="Filtros_Precios" runat="server" style="text-align:left">
                <LayoutTemplate>
                    <div style="border-radius: 2px; vertical-align:middle;">                                 
                        <table>
                            <tr id="itemPlaceholder" runat="server"></tr>
                        </table>      
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                           
                            <a class="filtro"
                               href="Prueba.aspx?cTexto=<%=                                
 Request.QueryString("cTexto")
                                    %>&lcFolio=<%=Request.QueryString("lcFolio")
                                    %>&lnCuantos=<%=Request.QueryString("lnCuantos")
                                    %>&cPrecio=<%#Eval("precio_inferior", "{0:c}")%> - <%#Eval("precio_superior", "{0:c}")%>&llPrecio=1">
                                
                                <%#Eval("precio_inferior", "{0:c}")%> - <%#Eval("precio_superior", "{0:c}")%>
                            </a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <br />
                            <br />
            <a  class="agregar"
                href="Prueba.aspx?cTexto=<%=
 Request.QueryString("cTexto")%>&cMarca=<%=
                Request.QueryString("cMarca")%>
                &lcFolio=<%=Request.QueryString("lcFolio")
                %>&lnCuantos=<%=Request.QueryString("lnCuantos")%>&llPrecio=1">
                Quitar Filtro
            </a>
        </div>
    </article>
</div>

<%--<div id="Centro_Muestra">--%>
     <section id="productos">
         
         <%--<div class="wrapperproductos">--%>
         <asp:label runat="server" id="total_art" CssClass="articulos"/>
    <asp:ListView ID="Lista_Articulos" runat="server">
       <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td style="color:Gray; font-size: 1em; text-align:left">
                        La búsqueda de <b><%=Request.QueryString("cTexto")%></b> no obtuvo ningún resultado.
                        <br /><br />
                        Sugerencias:
                        <br />
                        <ul>
                            <li>Revise que todas las palabras están escritas correctamente.</li>
                            <li>Intente usar otras palabras.</li>
                            <li>Intente usar palabras más generales.</li>
                        </ul>
                        <hr style="color:LightGray; border-color:LightGray;"/>
                    </td>
                </tr>
            </table>
       </EmptyDataTemplate>
        <LayoutTemplate>
            <div style="background-color: #eee;height: 36px;line-height: 36px;text-align: center;font-size: 16px;padding:10px 0px">             
                <label style="color: black;">Página</label>
                <asp:DataPager  ID="PaginasDatos"
                                CssClass="Contador_Paginas"
                                PageSize="5"
                                QueryStringField="page"                                
                                runat="server"
                                PagedControlID="Lista_Articulos">
                    <Fields>                                         
                        <asp:NumericPagerField
                            CurrentPageLabelCssClass="Pagina_Actual_DataPager"                            
                            ButtonCount="10"/>
                    </Fields>
                </asp:DataPager>
            </div>
            <table>
                <tr id="itemPlaceholder" runat="server"></tr>
            </table>
             <div style="background-color: #eee;height: 36px;line-height: 36px;text-align: center;font-size: 16px;padding:10px 0px">
                 <label style="color: black;">Página</label>
                 <asp:DataPager  ID="DataPager1"
                                CssClass="Contador_Paginas"
                                PageSize="5"
                                QueryStringField="page"
                                runat="server"
                                PagedControlID="Lista_Articulos">
                     <Fields>                                         
                        <asp:NumericPagerField
                            CurrentPageLabelCssClass="Pagina_Actual_DataPager"                              
                            ButtonCount="10"/>
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
            
       <ItemTemplate>
            <div class="wrapperproductos">
                    
                    <div class="fotop">
                    <asp:Image
                        ID="Image1" 
                        runat="server"                         
                        CssClass="Imagen_Muestra"
                        onerror="src='../Imagenes/nodisponible.jpg'"
                        Height="100px"
                        Width="150px"   
                        ToolTip='<%#"~/fotos/" + DataBinder.Eval(Container.DataItem, "foto")%>'         
                        ImageUrl='<%#"~/fotos/" + DataBinder.Eval(Container.DataItem, "foto").ToString.Trim%>'
                        
                        />
                        <%--OnClick="Datos_Articulo('<%# Eval("articulo")%>')"--%>
                    </div>
                
                   <div class="tyd">
                     <h5><a onclick="Datos_Articulo('<%# Eval("articulo")%>')" href="Datos_Articulo.aspx?lcArticulo=<%# Eval("articulo") %>"> <b class="Nombre_Articulo"><%#DataBinder.Eval(Container.DataItem, StrConv("nombre_articulo",vbProperCase))%></b><br /></a></h5>
                    
                    <p class="txtdesc"><b class="Clave_Articulo"># Indelek:</b> <%#DataBinder.Eval(Container.DataItem, "articulo")%> | 
                    <b class="Clave_Articulo"># Fabricante:</b> <%#DataBinder.Eval(Container.DataItem, "clave_anterior")%></p>
                    <br />
                        
                    <p class="txtdesc2">Disponible <%#Eval("disponible", "{0:0.00}")%><br /></p>

                   </div>

                    <div class="pyb">
                    <p class="txtprecio">Precio</p><p class="precio"> <%#Eval("precio", "{0:c}")%></p><br />

                    <a onclick="Datos_Articulo('<%# Eval("articulo")%>')" href="Datos_Articulo.aspx?lcArticulo=<%# Eval("articulo") %>">Mas...</a>
                    <div class="agregar"><a 
                        class="href_Carrito"
                        onclick="Muestra_Mensaje('Agregando Artículo al Carrito...')"
                        href='AgregarArticulo.aspx?lcArticulo=<%# Eval("articulo") %>&lnPrecio=<%# Eval("precio") %>'>
                        <strong>Agregar al Carrito</strong>
                    </a></div>
                      </div>
                    </div>
   </ItemTemplate>
            
   </asp:ListView>
    <div style="text-align:left;">
        <asp:Label 
            runat=server 
            ID="lblContador" 
            Text="" 
            BorderStyle="None"
            ForeColor="Gray"></asp:Label>
    </div>
<%--</div>--%>
             <%--</div>--%>
         </section>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
