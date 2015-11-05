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

        protected void CheckBox2_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void btnConf_Click(object sender, EventArgs e)
        {
            if (chkCarpooling.Checked)
            {

            }
            else
            {
               WebServices.EnvioMails serv = new WebServices.EnvioMails();

               string user = "sesion_user";
               string mail = "Session_Mail";
               string evento = "session_evento";

               serv.MandarMailCPsinAut(evento, mail, user);
               //si indica que va a ir, pero sin auto, se le mandan todos los que van en auto hasta ese momento
            }
        }


    }
}