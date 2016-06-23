<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Registro.aspx.vb" Inherits="Indelek_2015.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">        
    <div id="Mapa_Sitio">
        <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
    </div>
    <div class="Registro">
        <section>
            <%--Datos de la Tabla Clientes Web--%>
            <article>
                <table>
                    <tr>
                        <td>
                            <label>Nombre</label>
                        </td>
                        <td>
                            <asp:TextBox
                                ID="txtNombre" 
                                required="required"
                                style="width:200px;"
                                CssClass="Redondeado"
                                AutoCompleteType="DisplayName"
                                runat="server" ></asp:TextBox>
                        </td>                
                    </tr>

                    <tr>
                        <td>
                            <label>Nombre Comercial</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txtNombre_Comercial" 
                                required="required"
                                style="width:200px;"
                                CssClass="Redondeado"
                                runat="server"
                                AutoCompleteType="Company"></asp:TextBox>
                        </td>
                    </tr>
            
                    <tr>
                        <td>
                            <label>RFC</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txtRFC" 
                                required="required"
                                style="width:200px;"
                                CssClass="Redondeado"
                                runat="server" 
                                AutoCompleteType="Company"
                                ></asp:TextBox>
                        </td>                
                    </tr>

                    <tr>
                        <td>
                            <label>Segmento</label>
                        </td>
                        <td>
                            <asp:DropDownList 
                                runat="server"
                                ID="cboSegmentos"
                                CssClass="Redondeado"
                                Width="205px">
                            </asp:DropDownList>
                        </td>                
                    </tr>

                    <tr>
                        <td>
                            <label>Correo Electronico</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                runat="server"
                                type="email"
                                required="required" 
                                ID="txtCorreo"
                                width="200px"></asp:TextBox>
                        </td>           
                                    
                   </tr>               
                </table>
            </article>
            
            <article>
                <table>
                    <%--Datos de la Tabla Domicilios--%>
                    <tr>
                    <td>
                        <label>Calle</label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="txtCalle" 
                            style="width:200px;"
                            required="required"
                            CssClass="Redondeado"
                            runat="server"
                            AutoCompleteType="HomeStreetAddress"></asp:TextBox>
                    </td>   
                </tr>

                <tr>
                    <td>
                        <label>No. Exterior</label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="txtExterior"
                            required="required"
                            style="width:200px;"
                            CssClass="Redondeado"
                            runat="server"></asp:TextBox>
                    </td>                
                </tr>

                <tr>
                    <td>
                        <label>No. Interior</label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="txtInterior" 
                            style="width:200px;"
                            CssClass="Redondeado"
                            runat="server"></asp:TextBox>
                    </td>                
                </tr>

                <tr>
                    <td>
                        <label>Colonia</label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="txtColonia"
                            required="required"
                            style="width:200px;"
                            CssClass="Redondeado"
                            runat="server"></asp:TextBox>
                    </td>                
                </tr>

                <tr>
                    <td>
                        <label>C&oacutedigo postal</label>
                    </td>
                    <td>
                        <asp:TextBox 
                            ID="txtPostal"
                            required="required"
                            type="number"
                            style="width:200px;"
                            CssClass="Redondeado"
                            AutoCompleteType="HomeZipCode"
                            runat="server"></asp:TextBox>
                    </td>                
                </tr>

                <tr>
                    <td>
                        <label>Pa&iacutes</label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            runat="server"
                            ID="cboPaises"
                            OnTextChanged="cboPaises_TextChanged"
                            AutoPostBack="true"
                            CssClass="Redondeado"
                            Width="205px">
                        </asp:DropDownList>
                    </td>                
                </tr>

                <tr>
                     <td>
                        <label>Estado</label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            runat="server"
                            ID="cboEstados"
                            OnTextChanged="cboEstados_TextChanged"
                            AutoPostBack="true"
                            CssClass="Redondeado"                      
                            Width="205px">
                        </asp:DropDownList>
                    
                    </td>
                </tr>

                <tr>
                    <td>
                        <label>Ciudad</label>
                    </td>
                    <td>
                        <asp:DropDownList 
                            runat="server"
                            ID="cboCiudades"
                            CssClass="Redondeado"                            
                            Enabled="true"
                            Width="205px">
                        </asp:DropDownList>
                        </td>
                </tr>
                </table>
            </article>
        </section>                
        <section>
            <%--Tabla de Telefonos--%>
          <article>
                <table>                        
                   <tr>
                        <td>
                            <label>Tel&eacutefono</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txtArea" 
                                required="required"
                                type="number"
                                style="width:40px;"
                                CssClass="Redondeado"
                                runat="server"></asp:TextBox>

                            &nbsp &nbsp

                            <asp:TextBox 
                                ID="txtTelefono" 
                                required="required"
                                type="tel"
                                style="width:140px;"
                                CssClass="Redondeado"                        
                                runat="server" 
                                AutoCompleteType="Cellular"></asp:TextBox>
                        </td>
                   </tr>
                   <tr>
                        <td>
                            <label>Tipo</label>
                        </td>
                        <td>
                            <asp:DropDownList 
                                runat="server"
                                ID="cboTipos_Telefono"
                                CssClass="Redondeado"
                                Width="200px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>                        
                        <td>
                            <label>Contraseña</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txtContrasena" 
                                required="required"
                                runat="server"
                                CssClass="Redondeado"
                                TextMode="Password"
                                Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    
                </table>
            </article>

            <br />   
                     
            <article>
                <table>
                    <tr>
                        <td>                            
                            <label>Comentarios</label>
                        </td>
                        <td>
                            <asp:TextBox 
                                ID="txtComentarios" 
                                runat="server"
                                CssClass="Redondeado"
                                Width="200px"
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:Button 
                                ID="cmdRegistrar" 
                                runat="server"
                                CssClass="Boton"                                  
                                Text="Registrar"></asp:Button>      
                        </td>
                    </tr>
                </table>
            </article>
        </section>        
        <%--<div class="Registro_Exitoso">
            <asp:Label 
                runat="server" 
                ID="lblMensaje" 
                Width="500px"
                Font-Size="X-Large"
                ForeColor="DarkGreen">Usuario Registrado con el Folio</asp:Label>
                <br />

            <asp:Label 
                runat="server" 
                ID="Label1" 
                Width="500px"
                Font-Size="Medium"
                ForeColor="DarkGreen">Gracias por su Preferencia</asp:Label>
            <asp:Button 
                runat="server"
                Text="Aceptar"
                CssClass="Boton"
                ID="cmdAceptar"
                />
        </div>--%>
    </div>    

<script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
<script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
<script src="../Scripts/Funciones.js"           type="text/javascript"></script>

<script type="text/javascript">
    function Cliente_Agregado() {
        $(".Registro_Exitoso").slideDown(1000);
    }
    function Cerrar_Mensaje() {
        $(".Registro_Exitoso").slideDown(1000);
        window.location("Principal.aspx")
    }
</script>

</asp:Content>
