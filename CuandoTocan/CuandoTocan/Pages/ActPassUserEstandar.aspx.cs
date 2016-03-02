using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class ActPassUserEstandar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

                System.Web.UI.HtmlControls.HtmlGenericControl dynDivMenu = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                dynDivMenu.ID = "divMenutUserStd";

                string menuUserStd = "";

				menuUserStd = menuUserStd + "   <div class='list-group'>                                                                                                    " +
                                                "       <a class='list-group-item' href='/Pages/ActDatosUserEstandar.aspx?id_usuario='" + id_Usuario + "'>Actualizar Datos</a>          " +
                                                "       <a class='list-group-item' href='/Pages/ActPassUserEstandar.aspx?id_usuario='" + id_Usuario + "'>Cambio de Contraseña</a>  " +
                                                "   </div>                                                                                                                      ";

				dynDivMenu.InnerHtml = menuUserStd;

                divMenuEstandarVert.Controls.Add(dynDivMenu);

                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                int primero = 0;

                var usuarioEstandar = (from usu in ct.usuario
                                      where usu.id_usuario == id_Usuario
                                     select new
                                    {
                                        idusuario = usu.id_usuario,
										usuario = usu.nickname,
                                        email = usu.email,
										biografia = usu.biografia,
										fechanac = usu.fecha_nacimiento,
										image_path = usu.image_path,
										nombre = usu.nombre_completo
                                    });

				foreach (var a in usuarioEstandar)
                {
                    if (primero == 0)
                    {
                        dynDiv.ID = "divImgUsuario";
                        dynDiv.InnerHtml = "<img class='imgUsuario' alt='' src='../" + a.image_path + "' />";

                        divImgUsuario1.Controls.Add(dynDiv);

                        primero = 1;
                    }
                }
            }

			if (Convert.ToInt32(Session["huboError"]) == 1)
			{
				passErronea.Text = "Contraseña invalida";
				Session["huboError"] = 0;
			}

			if (Convert.ToInt32(Session["huboError"]) == 2)
			{
				mostrarMensaje("Contraseña cambiada");
				Session["huboError"] = 0;
			}

        }

		protected void btnActPassUser_Click(object sender, EventArgs e)
		{
			Page.Validate();

			if (Page.IsValid)
			{
				CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

				//int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
				int id_Usuario = Convert.ToInt32(Session["id_usua"]);

				var usuarioStd = (from usu in ct.usuario
									where usu.id_usuario == id_Usuario
									select usu);
				string password;

				Session["huboError"] = 0;

				foreach (var a in usuarioStd)
				{
					password = a.password;

					if (txtPassActual.Text == password)
					{
						a.password = txtPassNueva.Text;
					}
					else
					{
						passErronea.Text = "Contraseña invalida";
						Session["huboError"] = 1;
					}
				}

				if (Convert.ToInt32(Session["huboError"]) == 0)
				{
					ct.SaveChanges();
					Session["huboError"] = 2;
				}

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