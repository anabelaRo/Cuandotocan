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
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            int id_Artista = Convert.ToInt32(Request.QueryString["id_Artista"]);
            int id_Usuario = Convert.ToInt32(Session["id_usua"]);

            if (Session["usuario"] != null)
            {
                var querySeguir =   from ua in ct.usuario_artista
                                    where ua.id_usuario == id_Usuario &&
                                          ua.id_artista == id_Artista
                                    select ua;

                if (querySeguir.Count() == 0)
                {
                    divSeguir.Visible = true;
                    divDejarSeguir.Visible = false;
                }
                else
                {
                    divSeguir.Visible = false;
                    divDejarSeguir.Visible = true;
                }  
            }
            else
            {
                divSeguir.Visible = false;
                divDejarSeguir.Visible = false;
            }

            /*-----------------Biografia---------------------------------------------------*/
            var query = from art in ct.artista
                        where art.id_artista == id_Artista
                        select art;

            foreach (var a in query)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                dynDiv.ID = "divImgArtista";
                dynDiv.InnerHtml = "<img class='imgArtista' alt='' src='../" + a.image_path + "' />";
                    
                divImgArtista1.Controls.Add(dynDiv);

                lblMenuArtista.Text = a.nombre;
                lblBioArtista.Text = a.nombre;
                lblDisArtista.Text = a.nombre;
                lblEveArtista.Text = a.nombre;
                //
                lblBiografiaArtista.Text = a.descripcion;
            }

            /*-----------------Discografia-------------------------------------------------*/
            var query1 = (from art in ct.artista
                          join dis in ct.discografia on art.id_artista equals dis.id_artista
                          where art.id_artista == id_Artista
                          select new
                          {
                              titulo = dis.titulo,
                              fecha = dis.fecha_publicacion,
                              discografica = dis.discografica
                          });

            string tablaDiscArtista = "<table class='table'><thead><tr><th>Álbum</th><th>Fecha de lanzamiento</th><th>Discográfica</th></thead><tbody>";

            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            dynDiv2.ID = "divDiscArtista";

            foreach (var b in query1)
            {
                tablaDiscArtista = tablaDiscArtista + "<tr><td>" + b.titulo + "</td><td>" + b.fecha + "</td><td>" + b.discografica + "</td></tr>";
            }

            tablaDiscArtista = tablaDiscArtista + "</tbody></table>";

            dynDiv2.InnerHtml = tablaDiscArtista;
            divDiscArtista1.Controls.Add(dynDiv2);

            /*-----------------Eventos-----------------------------------------------------*/
            var query2 = (  from ev in ct.evento
                            join ar in ct.artista on ev.id_artista equals ar.id_artista
                            join lo in ct.locacion on ev.id_locacion equals lo.id_locacion
                            where ar.id_artista == id_Artista
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

        protected void btnSeguir_Art(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            CuandoTocan.usuario_artista art = new CuandoTocan.usuario_artista();

            art.id_usuario = Convert.ToInt32(Session["id_usua"]);
            art.id_artista = Convert.ToInt32(Request.QueryString["id_Artista"]);
            art.fecha_alta = DateTime.Now;
            art.fecha_modificacion = DateTime.Now;

            ct.AddTousuario_artista(art);
            ct.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }

        protected void btnDejarSeguir_Art(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            int id_Artista = Convert.ToInt32(Request.QueryString["id_Artista"]);
            int id_Usuario = Convert.ToInt32(Session["id_usua"]);

            var eli = (from ua in ct.usuario_artista
                       where ua.id_usuario == id_Usuario &&
                             ua.id_artista == id_Artista
                       select ua).First();

            ct.usuario_artista.DeleteObject(eli);
            ct.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }
    }
}