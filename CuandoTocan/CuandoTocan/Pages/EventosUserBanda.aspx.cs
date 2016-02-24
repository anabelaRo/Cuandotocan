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
        WebServices.EnvioMails serv = new WebServices.EnvioMails();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                                          Des = ev.descripcion,
                                          Fecha = ev.fecha_evento,
                                          ID_Lugar = lo.id_locacion,
                                          Des_Lugar = lo.nombre,
                                          ID_Tipo = ti.id_tipo_evento,
                                          Des_Tipo = ti.descripcion
                                          //Lugar = lo.nombre,
                                          //Tipo = ti.descripcion
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
                                                        "		<td>" + ev.Fecha.ToString("dd/MM/yyyy hh:mm") + "</td>   " +
                                                        "		<td>" + ev.Des_Lugar + "</td>                           " +
                                                        "		<td>" + ev.Des_Tipo + "</td>                            " +
                                                        "		<th><button type='button' onclick='mostrarActualizarEvento(" + ev.ID + ",\"" + ev.Nombre + "\",\"" + ev.Des + "\",\"" + ev.Fecha.ToString("dd/MM/yyyy hh:mm") + "\",\"" + ev.ID_Lugar + "\",\"" + ev.ID_Tipo + "\");' class='btn btn-default' id='" + ev.ID + "'>Editar</button></th>" +
                                                        "	</tr>                                                       ";
                        }

                        tablaEventos = tablaEventos + " </tbody>                                                        " +
                                                    "</table>                                                           ";
                    }

                    dynDiv2.InnerHtml = tablaEventos;

                    GrillaEventosG.Controls.Add(dynDiv2);
                }

                ddlLugarCrear.DataValueField = "id_locacion";
                ddlLugarCrear.DataTextField = "nombre";
                ddlLugarCrear.DataSource = ct.locacion.ToList();
                ddlLugarCrear.DataBind();

                ddlTipoCrear.DataValueField = "id_tipo_evento";
                ddlTipoCrear.DataTextField = "descripcion";
                ddlTipoCrear.DataSource = ct.tipo_evento.ToList();
                ddlTipoCrear.DataBind();

                //-----------------------------------------------//

                ddlLugarModif.DataValueField = "id_locacion";
                ddlLugarModif.DataTextField = "nombre";
                ddlLugarModif.DataSource = ct.locacion.ToList();
                ddlLugarModif.DataBind();

                ddlTipoModif.DataValueField = "id_tipo_evento";
                ddlTipoModif.DataTextField = "descripcion";
                ddlTipoModif.DataSource = ct.tipo_evento.ToList();
                ddlTipoModif.DataBind();
            }
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

                    var eli = (from ev in ct.evento
                               where ev.id_evento == id_even
                               select ev).First();

                    foreach (var ue in query.ToList())
                    {
                        //ANA envío mail de evento modificado a los asistentes
                        //falta programar
                        //deberia pasar id del evento, descripcion, artista y fecha
                        serv.MandarMailEliE(eli.titulo, eli.fecha_evento.ToString(), ue.id_evento, ue.id_usuario);


                        ct.usuario_evento.DeleteObject(ue);
                        ct.SaveChanges();
                    }

                  

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
                        ev.descripcion = txtDescE.Text;
                        ev.fecha_evento = Convert.ToDateTime(txtFechaE.Text);
                        ev.id_locacion = Convert.ToInt32(ddlLugarModif.SelectedValue);
                        ev.tipo_evento = Convert.ToInt32(ddlTipoModif.SelectedValue);
                        ev.fecha_modificacion = DateTime.Now;
                    }

                    ct.SaveChanges();
                    //ANA envío mail de evento eliminado a los asistentes
                    //falta programar
                    //deberia pasar id del evento, y la nueva configuracion
                    serv.MandarMailEliE(id_even);

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
                    ev.id_locacion = Convert.ToInt32(ddlLugarCrear.SelectedValue);
                    ev.tipo_evento = Convert.ToInt32(ddlLugarCrear.SelectedValue);
                }

                ct.AddToevento(ev);
                ct.SaveChanges();

                //ANA envío mail de nuevo evento a seguidores del artista
                //falta programar
                //deberia pasar id del evento, la fecha, el nombre, el lugar y el artista
                serv.MandarMailNewE(id_Usuario, ev.id_artista, ev.id_evento);

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}