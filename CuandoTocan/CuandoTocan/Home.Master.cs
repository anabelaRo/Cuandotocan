using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan
{
    public partial class Home : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] !=  null){

                 divLogin.Visible = false;
                 logged.Text ="Bienvenido, " + Session["usuario"];
                

            }

        }
        protected void Submit(object sender, EventArgs e)
        {
            //Label1.Text = txtUser.Text + " " + txtPass.Text ;
     

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
           
            Page.Validate("login");
            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities1 ct = new CuandoTocan.CuandoTocanEntities1();
                //var usuarioNoDis = ct.usuario.Count(u => u.nickname == txtUser.Text && u.password == txtPass.Text);
                var usuarioNoDis = from u in ct.usuario
                                   where u.nickname == txtUser.Text && u.password == txtPass.Text
                                   select u;
                
                if (usuarioNoDis.Count() == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                    lblLogin.Text = "Usuario o contraseña inválidos";
                }
                else
                {
                    string mail = "";
                    string user = txtUser.Text;
                    foreach (var u in usuarioNoDis)
                    {
                      Session["id_usua"] = u.id_usuario;
                      Session["mail"] = u.email;
                      mail  = u.email;
                    }

                    Session["usuario"] = user;
                    
             
                    /*llamo funcion JS para que refresque la master, saca el botón de login y pone mensaje de bienvenida*/
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "test('" + user + "');", true);
                    Response.Redirect(Request.RawUrl);

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
            }
        }

        protected void btnBusq_Click(object sender, EventArgs e)
        {

            int tipobus = Convert.ToInt32(ddlTiBusqueda.SelectedItem.Value);
            if (tipobus == 1)
            {
                //BUsca eventos

            }
            else if (tipobus == 2)
            {

                //Buscar artistas
            }
            else
            {
                //Busca eventos por zona
            }
        }
               

       
    }
}














