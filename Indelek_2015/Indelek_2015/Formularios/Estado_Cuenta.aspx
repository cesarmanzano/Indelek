<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="Pagina_Maestra.Master" CodeBehind="Estado_Cuenta.aspx.vb" Inherits="Indelek_2015.Estado_Cuenta" %>

<%@ Register Assembly="RJS.Web.WebControl.PopCalendar.Net.2008" Namespace="RJS.Web.WebControl"
    TagPrefix="rjs" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Mapa_Sitio">
    <asp:SiteMapPath ID="SiteMapPath1" runat="server"></asp:SiteMapPath>
</div>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div style="width: 850px; text-align:left;">
    <section class="Calendario">
        <label>Fecha Inicial</label>
        <asp:TextBox 
            ID="txtFecha" 
            Width="90px" 
            runat="server"
            ReadOnly="true"            
            BackColor=LightGray></asp:TextBox>&nbsp;
        <rjs:PopCalendar 
            ID="PopCalendar1"
            runat="server" 
            Control="txtFecha" 
            Format="yyyy mm dd" 
            Separator="-"/>
    </section>
    <section class="Calendario">
        <label>Fecha Final</label>  
        <asp:TextBox 
            ID="txtFecha2" 
            runat="server" 
            Width="90px" 
            ReadOnly="true" 
            BackColor=LightGray></asp:TextBox>
        <rjs:PopCalendar 
            ID="PopCalendar2"
            runat="server" 
            Control="txtFecha2" 
            Format="yyyy mm dd" 
            Separator="-"/>
    </section>  
    <asp:Button 
            CssClass="Flotar_Izquierda"
            ID="cmdEstado_Centa" 
            runat="server" 
            name="cmdEstado_Cuenta" 
            Text="Consultar" 
            OnClick="cmdEstado_Centa_Click"/>
</div>        
    <br />
    <br />
    <br />
<div>                
    <rsweb:ReportViewer 
        ID="loReporte" 
        runat="server" 
        Height="580px" 
        Width="1007px"
        Font-Names="Verdana" Font-Size="8pt">
    </rsweb:ReportViewer>        
</div>

    <script src="../Scripts/jquery-2.0.3.js"        type="text/javascript"></script>
    <script src="../Scripts/jquery-1.3.2.min.js"    type="text/javascript"></script>    
    <script src="../Scripts/Funciones.js"           type="text/javascript"></script>

</asp:Content>
