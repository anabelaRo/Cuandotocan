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
                //logged.Text ="Bienvenido, " + Session["usuario"];

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                dynDiv.ID = "divAfterlogged";

                string armoUserLogueado = "";
                 
                armoUserLogueado = 						"<div id='userLogueado'>";
                armoUserLogueado = armoUserLogueado + 	"	<div class='navbar navbar-default navbar-fixed-top' role='navigation'>";
                armoUserLogueado = armoUserLogueado + 	"		<ul class='nav navbar-nav navbar-right'>";
                armoUserLogueado = armoUserLogueado + 	"			<li class='dropdown'>";
                armoUserLogueado = armoUserLogueado + 	"				<a href='#' class='dropdown-toggle' data-toggle='dropdown'>";
                armoUserLogueado = armoUserLogueado +   "				    <img class='imgUserBanda' alt='' src='../img/Users/userDefault.jpg' />";
                armoUserLogueado = armoUserLogueado +  	"					<strong class='nombreUser'>" + Session["usuario"] + "</strong>";
                armoUserLogueado = armoUserLogueado + "				        <img class='imgUserFlecha' alt='' src='../img/Users/flachaAbajo.jpg' />";
                armoUserLogueado = armoUserLogueado +  	"				</a>";
                armoUserLogueado = armoUserLogueado +  	"				<ul class='dropdown-menu'>";
                armoUserLogueado = armoUserLogueado +  	"					<li>";
                armoUserLogueado = armoUserLogueado +  	"						<div class='navbar-login'>";
                armoUserLogueado = armoUserLogueado +  	"							<div class='row'>";
                armoUserLogueado = armoUserLogueado +  	"								<div class='col-lg-4'>";
                armoUserLogueado = armoUserLogueado +  	"									<p class='text-center'>";
                armoUserLogueado = armoUserLogueado + "										<img class='imgUserBanda2' alt='' src='../img/Users/userDefault.jpg' />";
                armoUserLogueado = armoUserLogueado +  	"									</p>";
                armoUserLogueado = armoUserLogueado +  	"								</div>";
                armoUserLogueado = armoUserLogueado +  	"								<div class='col-lg-8'>";
                armoUserLogueado = armoUserLogueado +  	"									<p class='text-left'><strong>" + Session["nombreCompleto"] + "</strong></p>";
                armoUserLogueado = armoUserLogueado +  	"									<p class='text-left small'>" + Session["mail"] + "</p>";
                armoUserLogueado = armoUserLogueado +  	"									<p class='text-left'>";

                if (Session["tipoUsuario"].Equals(1))
                {
                    armoUserLogueado = armoUserLogueado + "										    <a href='Pages/UsuarioEstandar.aspx' class='btn btn-primary btn-block btn-sm'>Actualizar Datos</a>";
                }
                else
                {
                    armoUserLogueado = armoUserLogueado + "										    <a href='Pages/UsuarioBanda.aspx' class='btn btn-primary btn-block btn-sm'>Actualizar Datos</a>";
                }

                armoUserLogueado = armoUserLogueado +  	"									</p>";
                armoUserLogueado = armoUserLogueado +  	"								</div>";
                armoUserLogueado = armoUserLogueado +  	"							</div>";
                armoUserLogueado = armoUserLogueado +  	"						</div>";
                armoUserLogueado = armoUserLogueado +  	"					</li>";
                armoUserLogueado = armoUserLogueado +  	"					<li class='divider'></li>";
                armoUserLogueado = armoUserLogueado +  	"					<li>";
                armoUserLogueado = armoUserLogueado +  	"						<div class='navbar-login navbar-login-session'>";
                armoUserLogueado = armoUserLogueado +  	"							<div class='row'>";
                armoUserLogueado = armoUserLogueado +  	"								<div class='col-lg-12'>";
                armoUserLogueado = armoUserLogueado +  	"									<p>";
                armoUserLogueado = armoUserLogueado +  	"										<a href='#' class='btn btn-danger btn-block'>Cerrar Sesion</a>";
                armoUserLogueado = armoUserLogueado +  	"									</p>";
                armoUserLogueado = armoUserLogueado +  	"								</div>";
                armoUserLogueado = armoUserLogueado +  	"							</div>";
                armoUserLogueado = armoUserLogueado +  	"						</div>";
                armoUserLogueado = armoUserLogueado +  	"					</li>";
                armoUserLogueado = armoUserLogueado +  	"				</ul>";
                armoUserLogueado = armoUserLogueado +  	"			</li>";
                armoUserLogueado = armoUserLogueado +  	"		</ul>";
                armoUserLogueado = armoUserLogueado +  	"	</div>";
                armoUserLogueado = armoUserLogueado +   "</div>";

                dynDiv.InnerHtml = armoUserLogueado;

                afterlogged.Controls.Add(dynDiv);
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
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
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
                      Session["nombreCompleto"] = u.nombre_completo;
                      Session["tipoUsuario"] = u.tipo_usuario;

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














