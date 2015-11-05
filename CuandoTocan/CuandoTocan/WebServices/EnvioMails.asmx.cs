using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Net;
using System.Net.Mail;
using System.IO;
using System.Configuration;
using System.Web.UI.WebControls;


namespace CuandoTocan.WebServices
{
    /// <summary>
    /// Descripción breve de EnvioMails
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio Web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    // [System.Web.Script.Services.ScriptService]
    public class EnvioMails : System.Web.Services.WebService
    {

        [WebMethod]
        public string MandarMail(string tipo, string mail, string user)
         {
             string ret;
             SmtpClient client = new SmtpClient("smtp.gmail.com");
             client.Port = 587;
             client.EnableSsl = true;
             client.Timeout = 100000;
             client.DeliveryMethod = SmtpDeliveryMethod.Network;
             client.UseDefaultCredentials = false;
             client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
             //client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["Email"], ConfigurationManager.AppSettings["Password"]);
           
        
            MailMessage msg = new MailMessage();
             msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
            //msg.From = new MailAddress(ConfigurationManager.AppSettings["Email"]);

             if (tipo == "regA")
             {
                
                 try
                 { //HACER TEMPLATE HtmlString PARA USUARIO TIPO BANDA
                     //StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMail.htm"));
                    //string readFile = reader.ReadToEnd();
                     //string StrContent = "";
                     //StrContent = readFile;
                     //StrContent = StrContent.Replace("[MyName]", user);
                     msg.To.Add("anabela.rossi@gmail.com");
                     msg.To.Add(mail);
                     msg.Subject = "mail de prueba cuando tocan";
                     msg.Body = "Gracias " + user + " por registrate en CuandoTocan!";
                     //msg.Body = StrContent.ToString();
                     msg.IsBodyHtml = true;


                     client.Send(msg);
                     ret = "Enviado";
                     return (ret);
                    
                 }
                 catch (Exception ex)
                 {
                     ret = ex.Message;
                     return (ret);
                 }
             }
             else if (tipo == "regU")
             {  try{
                 StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMail.htm")); 

                  string readFile = reader.ReadToEnd();
                  string StrContent = "";
                  StrContent = readFile;
                 StrContent = StrContent.Replace("[MyName]", user); 
                 msg.To.Add("anabela.rossi@gmail.com");
                 //msg.To.Add("emiliano.zambrano@hotmail.com");
                 //msg.To.Add("juan_sobrile@hotmail.com");
                 msg.To.Add(mail);
                 msg.Subject = "mail de prueba cuando tocan";
                // msg.Body = "Gracias " + user + " por registrate en CuandoTocan!";
                 msg.Body = StrContent.ToString();
                 msg.IsBodyHtml = true;


                 client.Send(msg);
                 ret = "Enviado";
                 return (ret);
             }
                 catch (Exception ex)
                 {
                     ret = ex.Message;
                     return (ret);
                 }
             }
             else
             {

                 ret = "Tipo erróneo";
                 return (ret);
             }

            
        }

        }
    
}
