<%--<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Consulta_Articulos.aspx.vb" Inherits="Indelek_2015.Consulta_Articulos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>    

<div id="Barra_Izquierda_Muestra">
    <article class="Informacion_Muestra">
        <div class="Filtros">
            <div>Marcas</div>
            <asp:ListView ID="Filtros_Marca" runat="server">
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
                                href="Consulta_Articulos.aspx?lcTexto=<%=
                                Request.QueryString("lcTexto")
                                %>&cMarca=<%#DataBinder.Eval(Container.DataItem, StrConv("nombre_marca", vbProperCase).Trim)
                                %>&lcFolio=<%=Request.QueryString("lcFolio")
                                %>&lnCuantos=<%=Request.QueryString("lnCuantos")%>&llMarca=1">

                                <%#DataBinder.Eval(Container.DataItem, StrConv("nombre_marca",vbProperCase))%>&nbsp
                                (<%#DataBinder.Eval(Container.DataItem, "cuantos")%>)
                            </a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <a  class="filtro"
                href="Consulta_Articulos.aspx?lcTexto=<%=
                Request.QueryString("lcTexto")%>&cPrecio=<%=
                Request.QueryString("cPrecio")
                %>&lcFolio=<%=Request.QueryString("lcFolio")
                %>&lnCuantos=<%=Request.QueryString("lnCuantos")%>&llMarca=1">
                Quitar Filtro
            </a>
        </div>
        <br /><br />
        <div class="Filtros">
            <div>Precios</div>
            <asp:ListView ID="Filtros_Precios" runat="server">
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
                               href="Consulta_Articulos.aspx?lcTexto=<%=
                                    Request.QueryString("lcTexto")
                                    %>&lcFolio=<%=Request.QueryString("lcFolio")
                                    %>&lnCuantos=<%=Request.QueryString("lnCuantos")
                                    %>&cPrecio=<%#Eval("precio_inferior", "{0:c}")%> - <%#Eval("precio_superior", "{0:c}")%>&llPrecio=1">
                                
                                <%#Eval("precio_inferior", "{0:c}")%> - <%#Eval("precio_superior", "{0:c}")%>
                            </a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <a  class="filtro"
                href="Consulta_Articulos.aspx?lcTexto=<%=
                Request.QueryString("lcTexto")%>&cMarca=<%=
                Request.QueryString("cMarca")%>
                &lcFolio=<%=Request.QueryString("lcFolio")
                %>&lnCuantos=<%=Request.QueryString("lnCuantos")%>&llPrecio=1">
                Quitar Filtro
            </a>
        </div>
    </article>
</div>

<div id="Centro_Muestra">
    <asp:ListView ID="Lista_Articulos" runat="server">
        <EmptyDataTemplate>
            <table id="Table1" runat="server">
                <tr>
                    <td style="color:Gray; font-size: 1em; text-align:left">
                        La búsqueda de <b><%=Request.QueryString("lcTexto")%></b> no obtuvo ningún resultado.
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
            <div style="background:RGBA(223,223,223,.7); height:1.3em; border-radius: 2px; vertical-align:middle;">
                <label style="color: Blue;">Página</label>
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
            <div style="background:RGBA(223,223,223,.7); height:1.3em; border-radius: 2px; vertical-align:middle;">
                <label style="color: Blue;">Página</label>
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
                    <b class="Clave_Articulo">Código:</b> <%#DataBinder.Eval(Container.DataItem, "articulo")%><br />
                        
                    Disponible <%#Eval("disponible", "{0:0.00}")%><br />
                    Precio <%#Eval("precio", "{0:c}")%><br />
                    <a onclick="Informacion_Articulo('<%# Eval("articulo")%>')" href="javascript:void(0)">Mas...</a>
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
    <div style="text-align:left;">
        <asp:Label 
            runat=server 
            ID="lblContador" 
            Text="" 
            BorderStyle="None"
            ForeColor="Gray"></asp:Label>
    </div>
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>--%>
