<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Listas_Precios.aspx.vb" Inherits="Indelek_2015.Listas_Precios" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div style="text-align:left">
    <h1>Listas de Precios</h1>
        <table>
            <tr>
                <td>
                    <asp:RadioButton
                        ID="rbTodos" 
                        runat="server" 
                        Text="Toda"
                        GroupName="Uno" Checked="True" />
                </td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:RadioButton 
                        ID="rbLinea" 
                        runat="server" 
                        Text="Línea de Artículos"
                        GroupName="Uno" />
                </td>
                <td>
                    <asp:DropDownList ID="cboLineas" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="cmdConsultar" CssClass="cmdTerminar" runat="server" Text="Consultar" />
                </td>
            </tr>
            <tr>
                <td><asp:RadioButton 
                    ID="rbMarca"
                    runat="server" 
                    Text="Marca"
                    GroupName="Uno" />
                </td>
                <td>
                    <asp:DropDownList ID="cboMarcas" runat="server" Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    <br />
</div>
<div style="text-align:left">
    <rsweb:ReportViewer 
        ID="loReporte" 
        runat="server"        
        Height="580px" 
        Width="100%"
        Font-Names="Verdana" 
        Font-Size="8pt">
    </rsweb:ReportViewer>
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
