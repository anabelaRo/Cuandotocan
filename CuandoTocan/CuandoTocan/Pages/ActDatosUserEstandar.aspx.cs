using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class ActDatosUserEstandar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int id_Usuario = Convert.ToInt32(Session["id_usua"]);

            System.Web.UI.HtmlControls.HtmlGenericControl dynDivMenu = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            dynDivMenu.ID = "divMenutUserEstandar";

			string menuUserEstandar = "";

			menuUserEstandar = menuUserEstandar + "   <div class='list-group'>                                                                                                    " +
											"       <a class='list-group-item' href='/Pages/ActDatosUserEstandar.aspx?id_usuario='" + id_Usuario + "'>Actualizar Datos</a>          " +
											"       <a class='list-group-item' href='/Pages/ActPassUserEstandar.aspx?id_usuario='" + id_Usuario + "'>Cambio de Contraseña</a>  " +
                                            "   </div>                                                                                                                      ";

			dynDivMenu.InnerHtml = menuUserEstandar;

            divMenuEstandarVert.Controls.Add(dynDivMenu);

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            int primero = 0;

			var usuarioEstandar = (from usu in ct.usuario
								   where usu.id_usuario == id_Usuario
                                   select new
                                   {
                                       usuario = usu.nickname,
                                       email = usu.email,
                                       nombre = usu.nombre_completo,
                                       fechanac = usu.fecha_nacimiento,
                                       biografia = usu.biografia,
									   image_path = usu.image_path
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

                regUser.Text = a.usuario;
                regMail.Text = a.email;
	//			txtNombreComp.Text = a.nombre;

                if (!IsPostBack)
                {
                    txtNombreComp.Text = a.nombre;
					DateTime fechafmt = Convert.ToDateTime(a.fechanac);
					txtFechaNac.Text = fechafmt.ToString("dd/MM/yyyy");
                    txtBiografia.Text = a.biografia;
                }
            }
        }

        protected void btnActDatosUser_Click(object sender, EventArgs e)
        {
            /*valGeneroAct.Visible = true;
            valGeneroAct.Enabled = true;

            valDescrip.Visible = true;
            valDescrip.Enabled = true;
            */
            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

				var usuarioEstandar = (  from usu in ct.usuario
									    where usu.id_usuario == id_Usuario
                                       select usu);

				foreach (var a in usuarioEstandar)
                {
					a.nombre_completo = txtNombreComp.Text;
					a.fecha_nacimiento = Convert.ToDateTime(txtFechaNac.Text);
					a.biografia = txtBiografia.Text;
					/*
                    String pathImagen = SubirFoto();

                    if (pathImagen != "img/Users/userDefault.jpg")
                    {
                        a.image_path = pathImagen;
                    }
					*/
                }

                ct.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
        }

        public String SubirFoto()
        {
            String pathCompleto = "img/Users/userDefault.jpg";

            if (IsPostBack)
            {
                Boolean fileOK = false;

                String path = Server.MapPath("~/img/Users/");

                if (FileUpload1.HasFile)
                {
                    String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                    String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                        pathCompleto = "img/Users/" + FileUpload1.FileName;
                    }
                    catch (Exception ex)
                    {
                        pathCompleto = "img/Users/userDefault.jpg";
                    }
                }
            }

            return pathCompleto;
        }
    }
}