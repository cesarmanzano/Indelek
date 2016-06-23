<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Muestra_Articulo.aspx.vb" Inherits="Indelek_2015.Muestra_Articulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">    
</asp:Content>

<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Mapa_Sitio">
        <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
    </div>
    <div id="Barra_Izquierda_Muestra">
        <article class="Informacion_Muestra">
            <section>Filtros.</section>            
            <section class="Lista_Filtros">
                <b>Marca</b>
                <ul>
                    <li><a href="#">HP (9)</a></li>
                    <li><a href="#">Dell (7)</a></li>
                    <li><a href="#">Toshiba (4)</a></li>
                    <li><a href="#">Acer (1)</a></li>
                </ul>
            </section>
            <section class="Lista_Filtros">
                <b>Precio</b>
                <ul>
                    <li><a href="#">Menor a $500</a></li>
                    <li><a href="#">Entre   $501  y $1000</a></li>
                    <li><a href="#">Entre   $1001 y $2000</a></li>
                    <li><a href="#">Mayor a $2001</a></li>
                </ul>
            </section>
        </article>
    </div>
    <div id="Centro_Muestra">
        <asp:ListView ID="Lista_Articulos" runat="server">
            <EmptyDataTemplate>
                <table id="Table1" runat="server">
                    <tr>
                        <td style="color:Gray;">
                            No se Encontraron Registros Disponibles.
                            <hr style="color:LightGray; border-color:Gray;"/>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <div style="background:RGBA(223,223,223,.7); height:1.3em; border-radius: 2px; vertical-align:middle;">
                    <label style="color: Blue;">Página</label>
                    <asp:DataPager  ID="DataPager2"
                                    CssClass="Contador_Paginas"
                                    PageSize="6"
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
                <div style="background:RGBA(223,223,223,.7); height:1.3em; border-radius: 2px; vertical-align:middle;">
                    <label style="color: Blue;">Página</label>
                    <asp:DataPager  ID="DataPager1"
                                    CssClass="Contador_Paginas"
                                    PageSize="6"
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
                <tr>
                    <td>
                        <asp:Image
                            ID="Image1" 
                            runat="server"                         
                            CssClass="Imagen_Muestra"
                            onerror="src='../Imagenes/nodisponible.jpg'"
                            Height="100px"
                            Width="150px"             
                            ImageUrl='<%#"../ImagenesArticulos/" + DataBinder.Eval(Container.DataItem, "foto")%>'/>
                    </td>
                    <td class="Alineacion_Izquierda">
                        <b class="Nombre_Articulo"><%#DataBinder.Eval(Container.DataItem, StrConv("nombre_articulo",vbProperCase))%></b><br />
                        <b class="Clave_Articulo">Modelo:</b> <%#DataBinder.Eval(Container.DataItem, "articulo")%><br />
                        
                        <%--<article class="Area_Descripcion_Extendida">
                            <b><%#DataBinder.Eval(Container.DataItem, "descripcion_extendida")%></b><br />
                        </article>--%>
                        
                        
                        Disponible <%#Eval("disponible", "{0:0.00}")%><br />
                        Precio <%#Eval("precio", "{0:c}")%><br />
                        <a onclick="Datos_Articulo('<%# Eval("articulo")%>')" href="Datos_Articulo.aspx">Mas...</a>
                        <a 
                            class="href_Carrito"
                            onclick="Muestra_Mensaje('Agregando Artículo al Carrito...')"
                            href='AgregarArticulo.aspx?lcArticulo=<%# Eval("articulo") %>&lnPrecio=<%# Eval("precio") %>'>
                            <strong>Agregar al Carrito</strong>
                        </a>
                        <hr />                 
                    </td>
                </tr>
            </ItemTemplate>
            
        </asp:ListView> 
    </div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
