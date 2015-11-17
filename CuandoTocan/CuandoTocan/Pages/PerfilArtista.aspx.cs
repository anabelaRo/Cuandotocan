using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class PerfilArtista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id_Artista = Request.QueryString["id_Artista"];
            int id_Artista_int = Convert.ToInt32(id_Artista);

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            var query = from art in ct.artista
                        //where art.id_artista.Equals(id_Artista)
                        where art.id_artista == id_Artista_int
                        select art;

            foreach (var a in query)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                dynDiv.ID = "divImgArtista";
                dynDiv.InnerHtml = "<img class='img-responsive' alt='' src='../" + a.image_path + "' />";
                    
                divImgArtista1.Controls.Add(dynDiv);

                lblMenuArtista1.Text = a.nombre;
            }
        }
    }
}