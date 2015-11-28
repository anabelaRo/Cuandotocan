using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class ResultadosBusq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
				lblQuery.Text = Session["str_busq"].ToString();
				string input_busq = Session["str_busq"].ToString();

				if (Convert.ToInt32(Session["search_ty"]) == 1)
				{
					/*-----------------Eventos-----------------------------------------------------*/
					var query2 = (from ev in ct.evento
								  join ar in ct.artista on ev.id_artista equals ar.id_artista
								  join lo in ct.locacion on ev.id_locacion equals lo.id_locacion
								  where ev.titulo.ToLower().Contains(input_busq)
								  select new
								  {
									  idEvento = ev.id_evento,
									  titulo = ev.titulo,
									  descripcion = ev.descripcion,
									  fecha = ev.fecha_evento,
									  donde = lo.nombre,
									  direccion = lo.direccion,
									  city = lo.ciudad,
								  });

					string tablaEventos = "<table class='table'><thead><tr><th>Evento</th><th>Descripción</th><th>Fecha</th><th>Lugar</th><th>Dirección</th></tr></thead><tbody>";

					System.Web.UI.HtmlControls.HtmlGenericControl dynDiv3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

					dynDiv3.ID = "divEventArtista";

					foreach (var c in query2)
					{
						tablaEventos = tablaEventos + "<tr><td><a class='aEventos' href='./Evento.aspx?id_evento=" + c.idEvento + "'>" + c.titulo + "</a></td><td>" + c.descripcion + "</td><td>" + c.fecha + "</td><td>" + c.donde + "</td><td>" + c.direccion + " - " + c.city + "</td></tr>";
					}

					tablaEventos = tablaEventos + "</tbody></table>";

					dynDiv3.InnerHtml = tablaEventos;
					divEventArtista1.Controls.Add(dynDiv3);
				}
				/*-----------------Artistas-----------------------------------------------------*/
				else if (Convert.ToInt32(Session["search_ty"]) == 2)
					
				{
					var query3 = (from ar in ct.artista
								  where ar.nombre.Contains(input_busq)
								  select new
								  {
									  idArtista = ar.id_artista,
									  nombre = ar.nombre,
									  genero = ar.genero,
									  paisorigen = ar.pais_origen,
								  });

					string tablaArtistas = "<table class='table'><thead><tr><th>Artista</th><th>Género</th><th>País de origen</th></tr></thead><tbody>";

					System.Web.UI.HtmlControls.HtmlGenericControl dynDiv4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

					dynDiv4.ID = "divEventArtista";

					foreach (var c in query3)
					{
						tablaArtistas = tablaArtistas + "<tr><td><a class='aEventos' href='./PerfilArtista.aspx?id_Artista=" + c.idArtista + "'>" + c.nombre + "</a></td><td>" + c.genero + "</td><td>" + c.paisorigen + "</td></tr>";
					}

					tablaArtistas = tablaArtistas + "</tbody></table>";

					dynDiv4.InnerHtml = tablaArtistas;
					divEventArtista1.Controls.Add(dynDiv4);
				}
			}
        }
    }
}