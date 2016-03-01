using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class RecuperarPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
                var random = new Random();
                var result = new string(
                    Enumerable.Repeat(chars, 8)
                                .Select(s => s[random.Next(s.Length)])
                                .ToArray());

                Session["codPassword"] = result;

                //Enviar email

                mostrarMensaje("Se envió un email, con la clave recuperación");
            }
            
            if (Convert.ToInt32(Session["codigoErroneo"]) == 2)
            {
                mostrarMensaje("Contraseña cambiada");
                Session["codigoErroneo"] = 0;
            }
        }

        protected void btnActPassword_Click(object sender, EventArgs e)
        {
            Page.Validate();

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            string usuario_nick = Session["user_RePassword"].ToString();

            var usuarioBanda = from u in ct.usuario
                                where u.nickname == usuario_nick
                                select u;

            Session["codigoErroneo"] = 0;

            foreach (var a in usuarioBanda)
            {
                if (txtPasswordActual.Text == Session["codPassword"])
                {
                    a.password = txtPasswordNueva.Text;
                }
                else
                {
                    lblCodigoErroneo.Text = "Código invalido";
                    Session["codigoErroneo"] = 1;
                }
            }

            if (Convert.ToInt32(Session["codigoErroneo"]) == 0)
            {
                ct.SaveChanges();
                Session["codigoErroneo"] = 2;
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void mostrarMensaje(string message)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");

            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }
    }
}