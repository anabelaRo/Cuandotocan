using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace CuandoTocan
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            if (!IsPostBack)
            {
                var query = from art in ct.artista
                            select art;
                
                foreach (var a in query)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    dynDiv.ID = "divDescatados";
                    dynDiv.InnerHtml = "<div class='row'><div class='col-md-7'><a href='Pages/PerfilArtista.aspx?id_Artista=" + a.id_artista + "'><img class='img-responsive' src='" + a.image_path + "' alt=''/></a></div><div class='col-md-5'><a class='h4' href='Pages/PerfilArtista.aspx?id_Artista=" + a.id_artista + "'>" + a.nombre + "</a></div></div><hr/>";

                    divDestacados1.Controls.Add(dynDiv);
                }
            }
        }

 
    }
}