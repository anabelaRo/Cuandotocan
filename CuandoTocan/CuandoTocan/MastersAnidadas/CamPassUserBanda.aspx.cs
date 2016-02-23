using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.MastersAnidadas
{
    public partial class CamPassUserBanda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

                int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);

                var usuarioBanda = (from art in ct.artista
                                    join usu in ct.usuario on art.id_artista equals usu.id_artista
                                    where usu.id_usuario == id_Usuario
                                    select art);

                /*foreach (var a in usuarioBanda)
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
                Response.Redirect(Request.RawUrl);*/
            }
        }
    }
}