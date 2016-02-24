using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class DiscografiaUserBanda : System.Web.UI.Page
    {
        int id_artista;

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

                DateTime fecha;
                string fecha_publicacion;

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
                    Session["id_artista"] = id_artista;

                    //**********************************************Discos************************************************
                    //crearD.Visible = false;

                    var infodisco = (from art in ct.artista
                                     join dis in ct.discografia on art.id_artista equals dis.id_artista
                                     where art.id_artista == id_artista
                                     select new
                                     {
                                         ID = dis.id_disco,
                                         Titulo = dis.titulo,
                                         Fecha = dis.fecha_publicacion,
                                         Discografica = dis.discografica
                                     });

                    System.Web.UI.HtmlControls.HtmlGenericControl dynDiv1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                    dynDiv1.ID = "GrillaDiscos";

                    string tablaDiscos = "";

                    if (infodisco.Count() == 0)
                    {
                        tablaDiscos = tablaDiscos + "<strong>Su banda no posee discos</strong>          ";
                    }
                    else
                    {
                        tablaDiscos = "	        <table class='table table-bordered table-striped'>	" +
                                        "	        	<thead>											" +
                                        "	        		<tr>                                        " +
                                        "	        			<th>Titulo</th>                         " +
                                        "	        			<th>Fecha de Publicación</th>           " +
                                        "	        			<th>Discografica</th>                   " +
                                        "	        			<th>Editar</th>                         " +
                                        "	        		</tr>                                       " +
                                        "	        	</thead>                                        " +
                                        "	        	<tbody>                                         ";

                        foreach (var di in infodisco)
                        {
                            fecha = (DateTime) di.Fecha;
                            fecha_publicacion = fecha.ToString("dd/MM/yyyy hh:mm");

                            tablaDiscos = tablaDiscos + "	<tr>                                        " +
                                                        "		<td>" + di.Titulo + "</td>              " +
                                                        "		<td>" + fecha_publicacion + "</td>               " +
                                                        "		<td>" + di.Discografica + "</td>        " +
                                                        "		<th><button type='button' onclick='mostrarActualizarDisco(" + di.ID + ",\"" + di.Titulo + "\",\"" + fecha_publicacion + "\",\"" + di.Discografica + "\");' class='btn btn-default' id='" + di.ID + "'>Editar</button></th>" +
                                                        "	</tr>                                       ";
                        }

                        tablaDiscos = tablaDiscos + "   </tbody>                                        " +
                                                    "</table>                                           ";
                    }

                    dynDiv1.InnerHtml = tablaDiscos;

                    GrillaDiscosG.Controls.Add(dynDiv1);
                }
            }
        }

        protected void btnActualizarDisco_Click(object sender, EventArgs e)
        {
            Page.Validate("modificarDisco");

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                int id_disc = Convert.ToInt32(idDisco.Value);

                if (chkEliD.Checked) //Eliminar
                {
                    try
                    {
                        var eli = (from di in ct.discografia
                                   where di.id_disco == id_disc
                                   select di).First();

                        ct.discografia.DeleteObject(eli);
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
                        var query = from di in ct.discografia
                                    where di.id_disco == id_disc
                                    select di;

                        foreach (var dis in query)
                        {
                            dis.titulo = txtTituloD.Text;
                            dis.fecha_publicacion = Convert.ToDateTime(txtFechaD.Text);
                            dis.discografica = txtDiscograficaD.Text;
                        }

                        ct.SaveChanges();
                        Response.Redirect(Request.RawUrl);
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        protected void btnCrearDisco_Click(object sender, EventArgs e)
        {
            Page.Validate("crearDisco");

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                CuandoTocan.discografia dis = new CuandoTocan.discografia();

                int id_artista = Convert.ToInt32(Session["id_artista"]);

                dis.id_artista = id_artista;
                dis.titulo = txtTituloNuevo.Text;
                dis.fecha_publicacion = Convert.ToDateTime(txtFechaDNueva.Text);
                dis.discografica = txtDiscograficaNueva.Text;
                dis.fecha_alta = DateTime.Now;

                ct.AddTodiscografia(dis);
                ct.SaveChanges();

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}