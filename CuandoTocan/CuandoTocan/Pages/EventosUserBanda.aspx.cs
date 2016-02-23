using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class EventosUserBanda : System.Web.UI.Page
    {
        int id_artista;

        protected void Page_Load(object sender, EventArgs e)
        {
            int id_Usuario = Convert.ToInt32(Session["id_usua"]);

            System.Web.UI.HtmlControls.HtmlGenericControl dynDivMenu = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            dynDivMenu.ID = "divMenutUserBanda";

            string menuUserBanda = "";

            menuUserBanda = menuUserBanda + "   <div class='list-group'>                                                                                                    " +
                                            "       <a class='list-group-item' href='/Pages/ActDatosUserBanda.aspx?id_usuario='" + id_Usuario + "'>Actualizar Datos</a>          " +
                                            "       <a class='list-group-item' href='/Pages/ActPassUserBanda.aspx?id_usuario='" + id_Usuario + "'>Cambio de Contraseña</a>  " +
                                            "       <a class='list-group-item' href='/Pages/DiscografiaUserBanda.aspx?id_usuario='" + id_Usuario + "'>Discografía</a>       " +
                                            "       <a class='list-group-item' href='/Pages/EventosUserBanda.aspx?id_usuario='" + id_Usuario + "'>Eventos</a>               " +
                                            "   </div>                                                                                                                      ";

            dynDivMenu.InnerHtml = menuUserBanda;

            divMenuArtistaVert.Controls.Add(dynDivMenu);

            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

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

                id_artista = a.id_artista;

                //crearE.Visible = false;

                var infoevento = (from ev in ct.evento
                                  join lo in ct.locacion on ev.id_locacion equals lo.id_locacion
                                  join ti in ct.tipo_evento on ev.tipo_evento equals ti.id_tipo_evento
                                  where ev.id_artista == id_artista
                                  select new
                                  {
                                      ID = ev.id_evento,
                                      Nombre = ev.titulo.Replace("\"", ""),
                                      Fecha = ev.fecha_evento,
                                      Lugar = lo.nombre,
                                      Tipo = ti.descripcion,
                                      Des = ev.descripcion
                                  });

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                dynDiv2.ID = "GrillaEventos";

                string tablaEventos = "";

                if (infoevento.Count() == 0)
                {
                    tablaEventos = "<strong>Su banda no posee eventos próximos</strong>                             ";
                }
                else
                {
                    ddlLugar.DataValueField = "ID_locacion";
                    ddlLugar.DataTextField = "Nombre";
                    ddlLugar.DataSource = ct.locacion.ToList();

                    ddlLugar.DataBind();

                    ddlTipo.DataValueField = "id_tipo_evento";
                    ddlTipo.DataTextField = "descripcion";
                    ddlTipo.DataSource = ct.tipo_evento.ToList();
                    ddlTipo.DataBind();

                    tablaEventos = "	        <table class='table table-bordered table-striped'>	                " +
                                    "	        	<thead>											                " +
                                    "	        		<tr>                                                        " +
                                    "	        			<th>Nombre</th>                                         " +
                                    "	        			<th>Descripción</th>                                    " +
                                    "	        			<th>Fecha</th>                                          " +
                                    "	        			<th>Lugar</th>                                          " +
                                    "	        			<th>Tipo Evento</th>                                    " +
                                    "	        			<th>Editar</th>                                         " +
                                    "	        		</tr>                                                       " +
                                    "	        	</thead>                                                        " +
                                    "	        	<tbody>                                                         ";

                    foreach (var ev in infoevento)
                    {
                        tablaEventos = tablaEventos + "	<tr>                                                        " +
                                                    "		<td>" + ev.Nombre + "</td>                              " +
                                                    "		<td>" + ev.Des + "</td>                                 " +
                                                    "		<td>" + ev.Fecha.ToString("dd/M/yyyy hh:mm") + "</td>   " +
                                                    "		<td>" + ev.Lugar + "</td>                               " +
                                                    "		<td>" + ev.Tipo + "</td>                                " +
                                                    "		<th><button type='button' onclick='mostrarActualizarEvento(" + ev.ID + ",\"" + ev.Nombre + "\",\"" + ev.Des + "\",\"" + ev.Fecha + "\",\"" + ev.Tipo + "\",\"" + ev.Lugar + "\");' class='btn btn-default' id='" + ev.ID + "'>Editar</button></th>" +
                                                    "	</tr>                                                       ";
                    }

                    tablaEventos = tablaEventos + " </tbody>                                                        " +
                                                "</table>                                                           ";
                }

                dynDiv2.InnerHtml = tablaEventos;

                GrillaEventosG.Controls.Add(dynDiv2);
            }

            ddlLugar2.DataValueField = "ID_locacion";
            ddlLugar2.DataTextField = "Nombre";
            ddlLugar2.DataSource = ct.locacion.ToList();

            ddlLugar2.DataBind();

            ddlTIpo2.DataValueField = "id_tipo_evento";
            ddlTIpo2.DataTextField = "descripcion";
            ddlTIpo2.DataSource = ct.tipo_evento.ToList();
            ddlTIpo2.DataBind();
        }

        protected void btnActualizarEvento_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            int id_even = Convert.ToInt32(idEvento.Value);

            if (chkEli.Checked) //Eliminar
            {
                try
                {
                    var query = from ue in ct.usuario_evento
                                where ue.id_evento == id_even
                                select ue;

                    foreach (var ue in query.ToList())
                    {
                        ct.usuario_evento.DeleteObject(ue);
                        ct.SaveChanges();
                    }

                    var eli = (from ev in ct.evento
                               where ev.id_evento == id_even
                               select ev).First();

                    ct.evento.DeleteObject(eli);
                    ct.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                }
            }
            else //Editar
            {
                try
                {
                    var query = from ev in ct.evento
                                where ev.id_evento == id_even
                                select ev;

                    foreach (var ev in query)
                    {
                        ev.titulo = txtNomE.Text;
                        ev.fecha_evento = Convert.ToDateTime(txtFechaE.Text);
                        ev.id_locacion = Convert.ToInt32(ddlLugar.SelectedValue);
                        ev.fecha_modificacion = DateTime.Now;
                        ev.tipo_evento = Convert.ToInt32(ddlTipo.SelectedValue);
                        ev.descripcion = txtDescE.Text;
                    }

                    ct.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {
                }
            }
        }

        protected void btnCrearEvento_Click(object sender, EventArgs e)
        {
            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                CuandoTocan.evento ev = new CuandoTocan.evento();

                //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

                var usuarioBanda = (from art in ct.artista
                                    join usu in ct.usuario on art.id_artista equals usu.id_artista
                                    where usu.id_usuario == id_Usuario
                                    select art);

                foreach (var a in usuarioBanda)
                {
                    ev.id_artista = a.id_artista;
                    ev.titulo = txtNameNuevo.Text;
                    ev.descripcion = tvtDescNueva.Text;
                    ev.fecha_alta = DateTime.Now;
                    ev.fecha_evento = Convert.ToDateTime(txtFechaNueva.Text);
                    ev.id_locacion = Convert.ToInt32(ddlLugar2.SelectedValue);
                    ev.tipo_evento = Convert.ToInt32(ddlTIpo2.SelectedValue);
                }

                ct.AddToevento(ev);
                ct.SaveChanges();

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}