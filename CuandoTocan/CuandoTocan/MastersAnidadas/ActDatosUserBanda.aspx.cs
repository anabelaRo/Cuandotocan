using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.MastersAnidadas
{
    public partial class ActDatosUserBanda : System.Web.UI.Page
    {
        int id_artista;

        protected void Page_Load(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);

            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            int primero = 0;

            var usuarioBanda = (from art in ct.artista
                                join usu in ct.usuario on art.id_artista equals usu.id_artista
                                where usu.id_usuario == id_Usuario
                                select new
                                {
                                    usuario = usu.nickname,
                                    email = usu.email,
                                    nombre = art.nombre,
                                    genero = art.genero,
                                    brain = art.mbid,
                                    spotify = art.spotify_id,
                                    descripcion = art.descripcion,
                                    id_artista = art.id_artista,
                                    image_path = art.image_path
                                });

            foreach (var a in usuarioBanda)
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
                txtNombreA.Text = a.nombre;

                if (!IsPostBack)
                {
                    txtGeneroAct.Text = a.genero;
                    txtMBrainz.Text = a.brain;
                    txtSpotify.Text = a.spotify;
                    txtDescrip.Text = a.descripcion;
                }
            }
        }

        protected void btnActDatosUser_Click(object sender, EventArgs e)
        {
            valGeneroAct.Visible = true;
            valGeneroAct.Enabled = true;

            valDescrip.Visible = true;
            valDescrip.Enabled = true;

            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);

                var usuarioBanda = (from art in ct.artista
                                    join usu in ct.usuario on art.id_artista equals usu.id_artista
                                    where usu.id_usuario == id_Usuario
                                    select art);

                foreach (var a in usuarioBanda)
                {
                    a.genero = txtGeneroAct.Text;
                    a.mbid = txtMBrainz.Text;
                    a.spotify_id = txtSpotify.Text;
                    a.descripcion = txtDescrip.Text;

                    String pathImagen = SubirFoto();

                    if (pathImagen != "img/Users/userDefault.jpg")
                    {
                        a.image_path = pathImagen;
                    }
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

        /*protected void btn_SubirFoto_Click(object sender, EventArgs e)
        {
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
                        lblSubirFoto.Text = "Archivo cargado con éxito!";
                    }
                    catch (Exception ex)
                    {
                        lblSubirFoto.Text = "Error al cargar el archivo.";
                    }
                }
                else
                {
                    lblSubirFoto.Text = "Tipo de archivo incorrecto.[gif, png, jpeg, jpg]";
                }
            }
        }*/
    }
}