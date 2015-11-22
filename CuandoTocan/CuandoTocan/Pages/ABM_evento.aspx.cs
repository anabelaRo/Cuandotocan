using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan
{
    public partial class ABM_evento : System.Web.UI.Page
    {
        CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
        int id_artista = 3;

        protected void Page_Load(object sender, EventArgs e)
        {
            crearEvento1.Visible = false;
              
                // session["id_usuario"]
               if (!IsPostBack)
               {
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
                       System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                       dynDiv.ID = "GrillaEventos";
                       dynDiv.InnerHtml = "<div class='row'><div class ='col-md-8'><strong>Su banda no posee eventos proximos</strong> </div>  </div>";

                       GrillaEventos1.Controls.Add(dynDiv);
                   }

                   else
                   { lblTitle.Text="Eventos existentes";
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
                          
                          
                           System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                           dynDiv.ID = "GrillaEventos";
                           dynDiv.InnerHtml = "<div class='row'><div class ='col-md-1'>" + ev.ID + "</div><div class ='col-md-3'>" + ev.Nombre + "</div><div class ='col-md-3'>" + ev.Des + "</div><div class ='col-md-3'>" + ev.Fecha.ToString("dd/M/yyyy hh:mm") + "</div><div class ='col-md-3'>" + ev.Lugar + "</div><div class ='col-md-3'>" + ev.Tipo + "</div><div class ='col-md-3'><button type='button' onclick='hola(" + ev.ID + ",\"" + ev.Nombre + "\",\"" + ev.Des + "\",\"" + ev.Fecha + "\",\"" + ev.Tipo + "\",\"" + ev.Lugar + "\");' class='btn btn-default' id='" + ev.ID + "'>Editar</button></div>  </div>";

                           GrillaEventos1.Controls.Add(dynDiv);
                       }
                   }

               }
       
    }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
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

                        //Elimino el torneo seleccionado
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
            CuandoTocan.evento ev = new CuandoTocan.evento();
            ev.id_artista = id_artista;
            ev.titulo = txtNameNuevo.Text;
            ev.descripcion = tvtDescNueva.Text;
            ev.fecha_alta = DateTime.Now;
            ev.fecha_evento = Convert.ToDateTime(txtFechaNueva.Text);
            ev.id_locacion = Convert.ToInt32(ddlLugar2.SelectedValue);
            ev.tipo_evento = Convert.ToInt32(ddlTIpo2.SelectedValue);

            ct.AddToevento(ev);
            ct.SaveChanges();

            Response.Redirect(Request.RawUrl);
        }

        
    }
}