using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan.Pages
{
    public partial class UsuarioBanda : System.Web.UI.Page
    {
        int id_artista;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            
            
                int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                dynDiv.ID = "divImgUsuario";
                dynDiv.InnerHtml = "<img class='imgUsuario' alt='' src='../img/Users/userDefault.jpg' />";

                divImgUsuario1.Controls.Add(dynDiv);

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
                                        id_artista = art.id_artista
                                    });

                foreach (var a in usuarioBanda)
                {
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

                    id_artista = a.id_artista;

                    //Discos
                    crearDisco1.Visible = false;

                //if (!IsPostBack)
                //{
                    var infodisco = (from art in ct.artista
                                     join dis in ct.discografia on art.id_artista equals dis.id_artista
                                     where art.id_artista == id_artista
                                     select new
                                     {
                                         id = dis.id_disco,
                                         titulo = dis.titulo,
                                         fecha = dis.fecha_publicacion,
                                         discografica = dis.discografica
                                     });

                    if (infodisco.Count() == 0)
                    {
                        GrillaD.Visible = false;
                        System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                        dynDiv2.ID = "GrillaDiscos";
                        dynDiv2.InnerHtml = "<div class='row'><div class ='col-md-8'><strong>Su banda no posee discos</strong> </div>  </div>";

                        GrillaDiscos1.Controls.Add(dynDiv2);
                    }
                    else
                    {
                        foreach (var di in infodisco)
                        {
                            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                            dynDiv1.ID = "GrillaDiscos";
                            dynDiv1.InnerHtml = "<div class='row'><div class ='col-md-1'>" + di.id + "</div><div class ='col-md-3'>" + di.titulo + "</div><div class ='col-md-3'>" + di.fecha + "</div><div class ='col-md-3'>" + di.discografica + "</div><div class ='col-md-3'><button type='button' onclick='actDiscos(" + di.id + ",\"" + di.titulo + "\",\"" + di.fecha + "\",\"" + di.discografica + "\");' class='btn btn-default' id='" + di.id + "'>Editar</button></div>  </div>";

                            GrillaDiscos1.Controls.Add(dynDiv1);
                        }
                    }
                //}

                //Eventos
                crearEvento1.Visible = false;

                //if (!IsPostBack)
                //{
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

                    if (infoevento.Count() == 0)
                    {
                        Grilla.Visible = false;
                        System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                        dynDiv2.ID = "GrillaEventos";
                        dynDiv2.InnerHtml = "<div class='row'><div class ='col-md-8'><strong>Su banda no posee eventos proximos</strong> </div>  </div>";

                        GrillaEventos1.Controls.Add(dynDiv2);
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

                        foreach (var ev in infoevento)
                        {
                            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                            dynDiv1.ID = "GrillaEventos";
                            dynDiv1.InnerHtml = "<div class='row'><div class ='col-md-1'>" + ev.ID + "</div><div class ='col-md-3'>" + ev.Nombre + "</div><div class ='col-md-3'>" + ev.Des + "</div><div class ='col-md-3'>" + ev.Fecha.ToString("dd/M/yyyy hh:mm") + "</div><div class ='col-md-3'>" + ev.Lugar + "</div><div class ='col-md-3'>" + ev.Tipo + "</div><div class ='col-md-3'><button type='button' onclick='actEventos(" + ev.ID + ",\"" + ev.Nombre + "\",\"" + ev.Des + "\",\"" + ev.Fecha + "\",\"" + ev.Tipo + "\",\"" + ev.Lugar + "\");' class='btn btn-default' id='" + ev.ID + "'>Editar</button></div>  </div>";

                            GrillaEventos1.Controls.Add(dynDiv1);
                        }
                    }
                }
            //}
        }

        protected void btnActDatos_Click(object sender, EventArgs e)
        {
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
                }

                ct.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
        }

        //Discografia
        protected void btnUpdateD_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            int id_disc = Convert.ToInt32(idDisco.Value);

            if (chkEliD.Checked)
            {
                try
                {
                    var eli = (from di in ct.discografia
                               where di.id_disco == id_disc
                               select di).First();

                    //Elimino
                    ct.discografia.DeleteObject(eli);
                    ct.SaveChanges();

                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {

                }
            }
            else //edita
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

        protected void btnNewDisco_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            divCrearDisco.Visible = false;
            GrillaDiscos1.Visible = false;
            crearDisco1.Visible = true;
        }

        protected void btnCrearNuevoD_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            CuandoTocan.discografia dis = new CuandoTocan.discografia();

            dis.id_artista = id_artista;
            dis.titulo = txtTituloNuevo.Text;
            dis.fecha_publicacion = Convert.ToDateTime(txtFechaDNueva.Text);
            dis.discografica = txtDiscograficaNueva.Text;

            ct.AddTodiscografia(dis);
            ct.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }

        //Eventos
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
            
            int id_even = Convert.ToInt32(idEvento.Value);

            if (chkEli.Checked)
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

                    //Elimino
                    ct.evento.DeleteObject(eli);
                    ct.SaveChanges();
                    Response.Redirect(Request.RawUrl);
                }
                catch (Exception ex)
                {

                }
            }
            else //edita
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

        protected void btnNewEvent_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            divCrearEvento.Visible = false;
            GrillaEventos1.Visible = false;
            crearEvento1.Visible = true;

            ddlLugar2.DataValueField = "ID_locacion";
            ddlLugar2.DataTextField = "Nombre";
            ddlLugar2.DataSource = ct.locacion.ToList();

            ddlLugar2.DataBind();

            ddlTIpo2.DataValueField = "id_tipo_evento";
            ddlTIpo2.DataTextField = "descripcion";
            ddlTIpo2.DataSource = ct.tipo_evento.ToList();
            ddlTIpo2.DataBind();
        }

        protected void btnCrearNuevo_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            CuandoTocan.evento ev = new CuandoTocan.evento();

            int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);

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