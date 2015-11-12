using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan
{
    public partial class Evento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnEvento_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities1 ct = new CuandoTocan.CuandoTocanEntities1();

           
            string user = Session["usuario"].ToString();
            string mail = Session["mail"].ToString();
            int id_evento = 3;  // ahor se hardcodea valor, pero debe recibirse por sesion
            //string evento =  Convert.ToInt32(Session["evento"]);
           

            CuandoTocan.usuario_evento ue = new usuario_evento();

            ue.flag_asist_fav = "A";
            /* en esta primera entrega se maneja solo asistencia, no hay eventos favoritos */
            /* solo los usuarios logueados pueden indicar asistencia */

            ue.id_usuario = Convert.ToInt32(Session["id_usua"]);
            ue.id_evento = Convert.ToInt32(id_evento);
            ue.fecha_alta = DateTime.Now;
            

            if (radConAuto.Checked)
            {

                ue.flag_ofrece_carpooling = "S";
                ue.origen_carpooling = txtCarpooling.Text;
                Session["desde"] = txtCarpooling.Text;
                ct.AddTousuario_evento(ue);
                ct.SaveChanges();

                WebServices.EnvioMails serv = new WebServices.EnvioMails();
                serv.MandarMailCPConAut(id_evento, user);

                /* si indica que va a ir y comparte su auto, se le mandan todos los que van a ese evento sin auto
                 e indicaron que les interesa el carpooling */


            }
            else if (radSinAuto.Checked)
            {
                ue.flag_ofrece_carpooling = "N";
                ue.flag_usa_carpooling = "S";
                
                ct.AddTousuario_evento(ue);
                ct.SaveChanges();
                
                WebServices.EnvioMails serv = new WebServices.EnvioMails();


                serv.MandarMailCPsinAut(id_evento, mail, user);
                /* si indica que va a ir, pero sin auto, se le mandan todos los que van en auto hasta ese momento
                luego, cada vez que un usuario indique que va a ese evento y ofrezca su auto, le llegara un mail con ese */
            }
            else
            {
                ue.flag_ofrece_carpooling = "N";
                ue.flag_usa_carpooling = "N";

                ct.AddTousuario_evento(ue);
                ct.SaveChanges();

                /* si va y no marca nada, solo se registra y no manda mails */

            }
        }

        


    }
}