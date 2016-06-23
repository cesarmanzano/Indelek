<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Lista_Archivos.aspx.vb" Inherits="Ejemplo_Archivos.Lista_Archivos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Prueba para Cargar y Bajar Archivos</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="grdArchivos" CssClass="GridViewStyle"
            AutoGenerateColumns="true" runat="server">
            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
            <FooterStyle CssClass="GridViewFooterStyle" />
            <HeaderStyle CssClass="GridViewHeaderStyle" />
            <PagerStyle CssClass="GridViewPagerStyle" />
            <RowStyle CssClass="GridViewRowStyle" />    
            <SelectedRowStyle CssClass="GridViewSelectedRowStyle" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink runat="server"
                            NavigateUrl='<%# Eval("documento", "Baja_Archivo.aspx?ID={0}")%>'
                            Text="Download"></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
