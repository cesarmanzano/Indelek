<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Carrito_Compras.aspx.vb" Inherits="Indelek_2015.Carrito_Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Site_Map_Principal">
    <asp:Menu ID="Menu2" runat="server" DataSourceID="SiteMapDataSource1"></asp:Menu>
    <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
</div>

<div class="Seccion_Carrito_Compras">
    <section>
        <b>
        <asp:Label 
                ID="txtNomre_Cliente" 
                runat="server" 
                Font-Bold="True" 
                Font-Size="Medium"></asp:Label>
        </b>
        <br />
        <asp:Label ID="txtFecha" runat="server" Text=""></asp:Label>            
    </section>
        
    <section >
        <table>
            <tr>
                <td>
                    <b>
                        <asp:Label ID="Label1" runat="server">Tipo de Venta</asp:Label>
                    </b>    
                </td>
                <td>
                    <asp:Button 
                        runat="server" 
                        Text="Terminar el Pedido"
                        Width="150px"
                        CssClass="cmdTerminar"
                        ID="cmdTerminar"/>
                </td>
                <td>
                    <asp:Button 
                        runat="server" 
                        Text="Cancelar el Pedido"
                        Width="150px"
                        CssClass="cmdTerminar"
                        ID="cmdCancelar"/>
                </td>
            </tr>
            <tr>
                <td>
                    <select>
                        <option>Venta de Contado</option>
                        <option>Venta de Crédito</option>
                    </select>
                </td>
                <td>
                    <asp:Button 
                        runat="server" 
                        Text="Actualizar Carrito"
                        CssClass="cmdTerminar"
                        Width="150px"
                        OnClick="cmdActualizar_Click"
                        ID="cmdActualizar"/>
                </td>
            </tr>            
        </table>        
    </section>    

    <br /><br /><br /><br />

    <asp:GridView ID="Tabla_Carrito_Compras"
        runat="server"        
        allowpaging="True"
        BackColor="White" 
        GridLines="Horizontal"        
        autogeneratecolumns="False"
        HeaderStyle-BorderWidth="0px"        
        OnPageIndexChanging="Tabla_Carrito_Compras_PageIndexChanging"
        HeaderStyle-BackColor="#AAFA9E"
        EditRowStyle-BackColor="LightBlue"                
        SelectedRowStyle-BackColor="LightBlue"
        BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
        CellPadding="4" Font-Size="Small">

        <columns>
                <asp:boundfield 
                    datafield="articulo"      
                    readonly="True" 
                    headertext="Artículo" 
                    ItemStyle-CssClass="Item_Tabla_Carrito_Compras">

<ItemStyle CssClass="Item_Tabla_Carrito_Compras" Width="100px"></ItemStyle>
                </asp:boundfield>

                <asp:boundfield 
                    datafield="descripcion"   
                    readonly="true" 
                    headertext="Descripción"
                    ItemStyle-CssClass="Item_Tabla_Carrito_Compras" >

<ItemStyle CssClass="Item_Tabla_Carrito_Compras" Width="600px"></ItemStyle>
                </asp:boundfield>
                <asp:TemplateField>
                    <HeaderTemplate>Cantidad</HeaderTemplate>
                    <ItemTemplate>
                        <asp:TextBox 
                            ID="txtCantidad" 
                            Width="40" 
                            runat="server" 
                            Text='<%# Bind("cantidad") %>'>
                        </asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
              
                <asp:boundfield 
                    datafield="precio"        
                    readonly="true" 
                    headertext="Precio"                    
                    ItemStyle-CssClass="Item_Tabla_Carrito_Compras" 
                    DataFormatString="{0:c}">
<ItemStyle CssClass="Item_Tabla_Carrito_Compras" Width="100px"></ItemStyle>
                </asp:boundfield>

                <asp:TemplateField>
                    <HeaderTemplate>Importe</HeaderTemplate>
                    <ItemTemplate>
                        <%# String.Format("{0:c}", (Convert.ToDouble(Eval("cantidad")) * Convert.ToDouble(Eval("precio"))))%>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <HeaderTemplate>Eliminar</HeaderTemplate>
                    <ItemTemplate>
                        <center>
                        <asp:CheckBox id="chkEliminar" runat="server" />
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>
        </columns>
        <FooterStyle BackColor="White" ForeColor="#333333" />

<HeaderStyle BackColor="#336666" BorderWidth="0px" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />

<SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White"></SelectedRowStyle>
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#487575" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#275353" />        
    </asp:GridView>
    
    <section style="
            width: 400px; 
            border: .05px solid LigthGray; 
            font-size:large; 
            font-weight:bold; 
            float:right;
            text-align:right;
            color: DarkGray;">
    
        <asp:Label 
            runat="server"
            ID="txtTotal"
            style="width:195px;">
            Total: $0.00</asp:label>
    </section>
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>