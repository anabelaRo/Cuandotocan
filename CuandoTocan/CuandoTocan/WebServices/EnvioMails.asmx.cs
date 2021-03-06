﻿using System;
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


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
            msg.Subject = "Bienvenido a CuandoTocan!";
            msg.IsBodyHtml = true;
            msg.To.Add(mail);
            if (tipo == "regA")
            {

                try
                {
                    StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailA.htm"));
                    string readFile = reader.ReadToEnd();
                    string StrContent = "";
                    StrContent = readFile;
                    StrContent = StrContent.Replace("[MyName]", user);
                    msg.To.Add(mail);
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
            {
                try
                {
                    StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMail.htm"));

                    string readFile = reader.ReadToEnd();
                    string StrContent = "";
                    StrContent = readFile;
                    StrContent = StrContent.Replace("[MyName]", user);
                    msg.To.Add(mail);
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


            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from ue in ct.usuario_evento
                         join u in ct.usuario on ue.id_usuario equals u.id_usuario
                         join even in ct.evento on ue.id_evento equals even.id_evento
                         where (ue.flag_ofrece_carpooling == "S") && ue.id_evento == evento_id
                         select new
                         {
                             nombre = u.nickname,
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
            if (query.Count() != 0)
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


            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from ue in ct.usuario_evento
                         join u in ct.usuario on ue.id_usuario equals u.id_usuario
                         join e in ct.evento on ue.id_evento equals e.id_evento
                         where (ue.flag_usa_carpooling == "S") && ue.id_evento == evento_id
                         select new
                         {
                             nombre = u.nickname,
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



        public string MandarMailEliE(string titulo, string fecha, int id_even, int id_usua)
        {
            //MAILS CUANDO USUARIO BANDA ELIMINA EVENTO, NOTIFICA A LOS ASISTENTES
            string ret;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
            int cont;


            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from u in ct.usuario
                         where u.id_usuario == id_usua
                         select new
                         {
                             nombre = u.nickname,
                             mail = u.email,
                         });


            string cuerpo = "";

            foreach (var us in query)
            {
                //TEST
                MailMessage msg = new MailMessage();
                msg.To.Add(us.mail);
                msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                msg.Subject = "Evento cancelado!";
                msg.IsBodyHtml = true;
                StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailEliEvento.htm"));
                string readFile = reader.ReadToEnd();
                string StrContent = "";
                StrContent = readFile;
                StrContent = StrContent.Replace("[MyName]", us.nombre);
                StrContent = StrContent.Replace("[MyEvent]", titulo);
                StrContent = StrContent.Replace("[fecha]", fecha);
                msg.Body = StrContent.ToString();
                client.Send(msg);


            }

            ret = "Enviado";

            return (ret);
        }

        public string MandarMailEdiE(int id_even)
        {
            //MAILS CUANDO USUARIO BANDA MODIFICA EVENTO, NOTIFICA A LOS ASISTENTES
            string ret;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
            int cont;


            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from e in ct.evento
                         join l in ct.locacion
                             on e.id_locacion equals l.id_locacion
                         join tp in ct.tipo_evento
                         on e.tipo_evento equals tp.id_tipo_evento
                         where e.id_evento == id_even
                         select new
                         {
                             e.titulo,
                             e.fecha_evento,
                             tp.descripcion,
                             l.nombre
                         });

            string cuerpo = "";
            string url = "http://localhost:63281/Pages/Evento.aspx?id_evento=" + id_even.ToString();

            foreach (var ev in query)
            {
                var query2 = (from u in ct.usuario
                              join ue in ct.usuario_evento
                                  on u.id_usuario equals ue.id_usuario
                              where ue.id_evento == id_even
                              select new
                              {
                                  u.nickname,
                                  u.email
                              });
                foreach (var us in query2)
                {
                    MailMessage msg = new MailMessage();
                    msg.To.Add(us.email);
                    msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                    msg.Subject = "Actualización de evento!";
                    msg.IsBodyHtml = true;
                    StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailModEvento.htm"));
                    string readFile = reader.ReadToEnd();
                    string StrContent = "";
                    StrContent = readFile;
                    StrContent = StrContent.Replace("[MyName]", us.nickname);
                    StrContent = StrContent.Replace("[MyEvent]", ev.titulo);
                    StrContent = StrContent.Replace("[fecha]", ev.fecha_evento.ToString());
                    StrContent = StrContent.Replace("[tipo]", ev.descripcion);
                    StrContent = StrContent.Replace("[lugar]", ev.nombre);

                    StrContent = StrContent.Replace("[url]", url);
                    msg.Body = StrContent.ToString();
                    client.Send(msg);
                }

            }

            ret = "Enviado";

            return (ret);
        }

        //
        public string MandarMailNewE(int id_arti, int id_even)
        {
            //MAILS CUANDO USUARIO BANDA CREA EVENTO, NOTIFICA A LOS SEGUIDORES

            string ret;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
            int cont;

            string url = "http://localhost:63281/Pages/Evento.aspx?id_evento=" + id_even.ToString();

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from ua in ct.usuario_artista
                         join u in ct.usuario
                         on ua.id_usuario equals u.id_usuario
                         join a in ct.artista
                         on ua.id_artista equals a.id_artista
                         join e in ct.evento
                         on a.id_artista equals e.id_artista
                         join l in ct.locacion
                         on e.id_locacion equals l.id_locacion
                         where ua.id_artista == id_arti
                                 && id_even == e.id_evento
                         select new
                         {
                             nombreU = u.nickname,
                             mail = u.email,
                             artista = a.nombre,
                             evento = e.titulo,
                             lugar = l.nombre,
                             fecha = e.fecha_evento
                         });


            foreach (var us in query)
            {

                MailMessage msg = new MailMessage();
                msg.To.Add(us.mail);
                msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                msg.Subject = "Nuevo evento de tu artista favorito!";
                msg.IsBodyHtml = true;
                StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailNewEvento.htm"));
                string readFile = reader.ReadToEnd();
                string StrContent = "";
                StrContent = readFile;
                StrContent = StrContent.Replace("[MyName]", us.nombreU);
                StrContent = StrContent.Replace("[MyEvent]", us.evento);
                StrContent = StrContent.Replace("[fecha]", us.fecha.ToString());
                StrContent = StrContent.Replace("[artista]", us.artista);
                StrContent = StrContent.Replace("[lugar]", us.lugar);
                StrContent = StrContent.Replace("[url]", url);
                msg.Body = StrContent.ToString();
                client.Send(msg);


            }


            ret = "Enviado";

            return (ret);
        }


        public string MandarMailNewD(int id_arti, int id_disco)
        {
            //MAILS CUANDO BANDA ANUNCIA NUEVO DISCO
            string ret;
            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
            int cont;

            string url = "http://localhost:63281/Pages/PerfilArtista.aspx?id_Artista=" + id_arti.ToString();

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();


            var query = (from u in ct.usuario
                         join ua in ct.usuario_artista
                             on u.id_usuario equals ua.id_usuario
                         where ua.id_artista == id_arti
                         select new
                         {
                             u.nickname,
                             u.email

                         });

            string cuerpo = "";

            foreach (var u in query)
            {
                var query2 = (from d in ct.discografia
                              join a in ct.artista
                              on d.id_artista equals a.id_artista
                              where d.id_disco == id_disco && d.id_artista == id_arti
                              select new
                              {
                                  a.nombre,
                                  d.fecha_publicacion,
                                  d.titulo,
                                  d.discografica
                              });
                foreach (var di in query2)
                {
                    MailMessage msg = new MailMessage();
                    msg.To.Add(u.email);
                    msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
                    msg.Subject = "Nuevo lanzamiento!";
                    msg.IsBodyHtml = true;
                    StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendMailNewDisco.htm"));
                    string readFile = reader.ReadToEnd();
                    string StrContent = "";
                    StrContent = readFile;
                    StrContent = StrContent.Replace("[MyName]", u.nickname);
                    StrContent = StrContent.Replace("[artista]", di.nombre);
                    StrContent = StrContent.Replace("[titulo]", di.titulo);
                    StrContent = StrContent.Replace("[discografica]", di.discografica);
                    StrContent = StrContent.Replace("[fecha]", di.fecha_publicacion.ToString());
                    StrContent = StrContent.Replace("[url]", url);
                    msg.Body = StrContent.ToString();
                    client.Send(msg);
                }

            }

            ret = "Enviado";

            return (ret);
        }

        public string MandarCodRecuperarPassword(string codigo_password, string nickname, string email)
        {
            //MAILS PARA RECUPERAR CONTRASEÑA
            string ret;

            SmtpClient client = new SmtpClient("smtp.gmail.com");
            client.Port = 587;
            client.EnableSsl = true;
            client.Timeout = 100000;
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Credentials = new NetworkCredential("CuandoTocan2015@gmail.com", "CT123456");
 
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            MailMessage msg = new MailMessage();
            msg.To.Add(email);
            msg.From = new MailAddress("CuandoTocan2015d@gmail.com");
            msg.Subject = "Codigo para recuperar contraseña";
            msg.IsBodyHtml = true;
            StreamReader reader = new StreamReader(Server.MapPath("~/Pages/SendRecPass.htm"));
            string readFile = reader.ReadToEnd();
            string StrContent = "";
            StrContent = readFile;
            StrContent = StrContent.Replace("[MyName]", nickname);
            StrContent = StrContent.Replace("[codigo_password]", codigo_password);
            msg.Body = StrContent.ToString();
            client.Send(msg);

            ret = "Enviado";

            return (ret);
        }
    }
}


