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
        }

        protected void btnActPassUser_Click(object sender, EventArgs e)
        {
            valPassActual.Enabled = true;
            valPassActual.Visible = true;

            valPassNueva.Enabled = true;
            valPassNueva.Visible = true;

            valRePassNueva.Enabled = true;
            valRePassNueva.Visible = true;

            valCompPassNueva.Enabled = true;
            valCompPassNueva.Visible = true;

            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

				var usuarioEstandar = (from usu in ct.usuario
                                      where usu.id_usuario == id_Usuario
									  select usu);
            }
        }
    }
}