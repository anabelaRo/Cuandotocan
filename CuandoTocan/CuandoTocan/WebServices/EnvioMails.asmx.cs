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
        public string MandarMailReg(string tipo, string mail, string user)
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
            msg.Subject = "Bienvenido a CuandoTocan!";
            msg.IsBodyHtml = true;
            msg.To.Add(mail);
             if (tipo == "regA")
             {
                
                 try
                 { //HACER TEMPLATE HtmlString PARA USUARIO TIPO BANDA
                     StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailA.htm"));
                    string readFile = reader.ReadToEnd();
                     string StrContent = "";
                     StrContent = readFile;
                     StrContent = StrContent.Replace("[MyName]", user);
                     msg.To.Add("anabela.rossi@gmail.com");
                    // msg.Body = "Gracias " + user + " por registrate en CuandoTocan!";
                     msg.Body = StrContent.ToString();
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
                 // msg.Body = "Gracias " + user + " por registrate en CuandoTocan!";
                 msg.Body = StrContent.ToString();
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

        public string MandarMailCPsinAut(int evento_id, string mail, string user)
        {
            //MAILS CUANDO USUARIO INDICA asistencia sin auto, se le envian todos los que estan hasta el momento con auto
            string ret;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
            int cont;

            evento_id = 3; //test
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from ue in ct.usuario_evento
                         join u in ct.usuario on ue.id_usuario equals u.id_usuario
                         join even in ct.evento on ue.id_evento equals even.id_evento
                         where (ue.flag_ofrece_carpooling == "S") && ue.id_evento == evento_id
                         select new
                         {
                             nombre = u.nombre_completo,
                             mail = u.email,
                             desde = ue.origen_carpooling,
                             eve = even.titulo,
                         });

            string cuerpo = "";
            string ev = "";
            foreach (var ue in query)
            {
                ev = ue.eve;
                cuerpo += "<tr>" +
                                             "<td >" + ue.nombre + "</td>" +
                                             "<td>" + ue.mail + "</td>" +
                                             "<td>" + ue.desde + "</td>" +
                                       "</tr>";

            }
            if (query != null)
            {
                try
                {

                    MailMessage msg = new MailMessage();
                    msg.To.Add(mail);
                    msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                    msg.Subject = "Carpooling en CuandoTocan!";
                    msg.IsBodyHtml = true;
                    StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailEsinAuto.htm"));
                    string readFile = reader.ReadToEnd();
                    string StrContent = "";
                    StrContent = readFile;
                    StrContent = StrContent.Replace("[MyName]", user);
                    StrContent = StrContent.Replace("[MyEvent]", ev.ToString());
                    StrContent = StrContent.Replace("[MyTable]", cuerpo);

                    msg.Body = StrContent.ToString();
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
                ret = "Aún no hay autos ofrecidos";
                return (ret);
            }
        }


         public string MandarMailCPConAut(int evento_id, string user)
         {
             //MAILS CUANDO USUARIO INDICA asistencia con auto, se envian todos marcaron carpooling
             string ret;
             SmtpClient client = new SmtpClient("smtp.gmail.com");
             client.Port = 587;
             client.EnableSsl = true;
             client.Timeout = 100000;
             client.DeliveryMethod = SmtpDeliveryMethod.Network;
             client.UseDefaultCredentials = false;
             client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
             int cont;

             evento_id = 3; //test
             CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


             var query = (from ue in ct.usuario_evento
                          join u in ct.usuario on ue.id_usuario equals u.id_usuario
                          join e in ct.evento on ue.id_evento equals e.id_evento
                          where (ue.flag_usa_carpooling == "S") && ue.id_evento == evento_id
                          select new
                          {
                              nombre = u.nombre_completo,
                              mail = u.email,
                              even = e.titulo,
                             });

             string cuerpo = "";

             foreach (var ue in query)
             {

                     MailMessage msg = new MailMessage();
                     msg.To.Add(ue.mail);
                     msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                     msg.Subject = "Carpooling en CuandoTocan!";
                     msg.IsBodyHtml = true;
                     StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailEconAuto.htm"));
                     string readFile = reader.ReadToEnd();
                     string StrContent = "";
                     StrContent = readFile;
                     StrContent = StrContent.Replace("[MyName]", ue.nombre);
                     StrContent = StrContent.Replace("[MyEvent]", ue.even.ToString());
                     StrContent = StrContent.Replace("[user]", Session["usuario"].ToString());
                     StrContent = StrContent.Replace("[userMail]", Session["mail"].ToString());
                     StrContent = StrContent.Replace("[desde]", Session["desde"].ToString());
                     msg.Body = StrContent.ToString();
                     client.Send(msg);
                   


                  }
             
               ret = "Enviado";
                     
                     return (ret);
                 }

                


         }
       
            
         }
        
    
