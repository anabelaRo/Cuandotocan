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

                var query2 = from eve in ct.EventosProximos
                             select eve;

                foreach (var a in query)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    dynDiv.ID = "divDescatados";
                    dynDiv.InnerHtml = "<div class='row'><div class='col-md-7'><a class='h4' href='Pages/PerfilArtista.aspx?id_Artista=" + a.id_artista + "'><img class='img-responsive' src='" + "../" + a.image_path + "' alt=''/></div><div class='col-md-5'>" + a.nombre + "</a></div></div><hr/>";

                    divDestacados1.Controls.Add(dynDiv);
                }

                foreach (var ev in query2)
                {
                    System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    dynDiv2.ID = "proximos1";
                    dynDiv2.InnerHtml = "<div class='divImagen'><a class='imgA' href='Pages/Evento.aspx?id_evento=" + ev.id_evento + "'><img class='img-responsive' src='" + "../" + ev.image_path + "' alt=''/> <p class='text'>" + ev.titulo + "<br>" + ev.nombre + "<br>" + ev.fecha_evento.ToString("dddd") + " " + ev.fecha_evento.ToString("dd/M") + "</p></a></div>";
             
                    proximos.Controls.Add(dynDiv2);
                }

            }


        }

 
    }
}