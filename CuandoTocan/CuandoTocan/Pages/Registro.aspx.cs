using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

namespace CuandoTocan.Pages
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            altaUsuarioU.Visible = false;
            altaUsuarioA.Visible = false;
        }

        protected void ddlTiUsua_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipousu = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
            var nomTiUsu = ddlTiUsua.SelectedItem.Text;


            switch (tipousu)
            {
                case 0:
                    altaUsuarioU.Visible = false;
                    altaUsuarioA.Visible = false;
                    //UpdatePanel1.Update();
                    break;
                case 1:
                    altaUsuarioU.Visible = true;
                    altaUsuarioA.Visible = false;
                    //UpdatePanel1.Update();
                    break;
                case 2:
                    altaUsuarioU.Visible = false;
                    altaUsuarioA.Visible = true;
                    //UpdatePanel1.Update();
                    break;

            }
        }
        

         protected void MandarMail ()
         { try{
                SmtpClient client = new SmtpClient("smtp.gmail.com");
                client.Port = 587;
                client.EnableSsl = true;
                client.Timeout = 100000;
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new NetworkCredential(
                "CuandoTocan2015@gmail.com", "CT123456");
                MailMessage msg = new MailMessage();
                msg.To.Add("anabela.rossi@gmail.com");
                msg.To.Add("emiliano.zambrano@hotmail.com");
                msg.To.Add("juan_sobrile@hotmail.com");
              //msg.To.Add(textBox_To.Text);
                msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                msg.Subject = "mail de prueba cuando tocan";
                // msg.Subject = textBox_Subject.Text);
                msg.Body = "Gracias por registrate en CuandoTocan!";
            //  msg.Body = textBox_Message.Text;
             //   Attachment data = new Attachment(textBox_Attachment.Text);
             //   msg.Attachments.Add(data);
                client.Send(msg);
                Label1.Text = "Successfully Sent Message.";
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }

        }

        protected void btnReg_Click(object sender, EventArgs e)
        {
            Page.Validate("registro");
            int tipousu = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
            var nomTiUsu = ddlTiUsua.SelectedItem.Text;
           
           
            if (Page.IsValid)
            {
                if (tipousu == 1)
                {
                    Page.Validate("registroU");
                    if (Page.IsValid)
                    { MandarMail(); }
                }
                else if (tipousu == 2)
                {
                    Page.Validate("registroA");
                    if (Page.IsValid)
                    { MandarMail(); }
                }
                
               
            }
        }

    }
}