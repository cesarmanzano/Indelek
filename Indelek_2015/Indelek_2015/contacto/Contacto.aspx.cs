using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Net.Mail;

public partial class Contacto : System.Web.UI.Page 
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public class GoogleVerificationResponseOutput
    {
        public bool success { get; set; }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Validar())
        {
            Correo();
            string script = "<script language='javascript'>alert('Informacion Enviada');</script>";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Aceptar", script, false);
            limpiar();
        }
        else
        {
            string script = "<script language='javascript'>alert('Fallo o falto aceptar el Captcha!! Por facor Intente de nuevo!!');</script>";
            ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "Aceptar", script, false);
        }
    }

    public bool Validar()
    {
        string ValidateResponseField = "g-recaptcha-response";
        string EncodedResponse = this.Page.Request.Form[ValidateResponseField];
        String PrivateKey = "6LfYrSMTAAAAADtMIOhQ1Eoiu1UzdGUASqpN4Gsu";

        if (string.IsNullOrEmpty(EncodedResponse) || string.IsNullOrEmpty(PrivateKey))
            return false;
        //by pass certificate validation
        System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };

        var client = new System.Net.WebClient();

        var GoogleReply = client.DownloadString(string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}", PrivateKey, EncodedResponse));

        JavaScriptSerializer serializer = new JavaScriptSerializer();
        GoogleVerificationResponseOutput gOutput = serializer.Deserialize<GoogleVerificationResponseOutput>(GoogleReply);

        return gOutput.success;
    }

    protected void Correo()
    {
        SmtpClient _nSmtp = new SmtpClient("smtp.brang.us", 587);
        MailMessage _nMailMsg = new MailMessage();
        _nMailMsg.From = new MailAddress("envio@brang.us", "Forma de Contacto brang.us");
        _nSmtp.Credentials = new System.Net.NetworkCredential("envio@brang.us", "Envio2015");
        _nMailMsg.Subject = "Contacto";
        _nMailMsg.IsBodyHtml = true;
        _nMailMsg.Body = MessageBuild();
        _nMailMsg.To.Add(new MailAddress("info@brang.us", ""));
        _nSmtp.Send(_nMailMsg);
    }

    protected string MessageBuild()
    {
        string msg = "Datos Contacto<br>";
        msg = msg + "Nombre: "+tbNombre.Text+"<br>";
        msg = msg + "Telefono: " + tbTelefono.Text + "<br>";
        msg = msg + "Email: " + tbEmail.Text + "<br>";
        msg = msg + "Mensaje: " + tbMensaje.Text + "<br>";
        return msg;
    }

    protected void limpiar()
    {
        tbNombre.Text = "";
        tbTelefono.Text = "";
        tbEmail.Text = "";
        tbMensaje.Text = "";
    }
}