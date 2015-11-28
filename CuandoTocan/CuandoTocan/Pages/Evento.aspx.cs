using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Text;

namespace CuandoTocan
{  
    public partial class Evento : System.Web.UI.Page
    {
        CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

            string id_evento_str = Request.QueryString["id_evento"];
            int id_evento = Convert.ToInt32(id_evento_str);

            /* para que muestre o no el botón VOY  si esta o no logueado*/
            if (Session["usuario"] == null)
            {

                asistencia.Visible = false;
                voy.Visible = false;

            }
            else if (Session["usuario"] != null)
            {

                int id = Convert.ToInt32(Session["id_usua"]);


                var asiste = from ue in ct.usuario_evento
                             where ue.id_evento == id_evento
                             && ue.id_usuario == id
                             select ue;

                if (asiste.Count() == 0)
                {
                    voy.Visible = true;
                    asistencia.Visible = false;
                   

                }
                else
                {
                    voy.Visible = false;
                    asistencia.Visible = true;
                    //lblAsiste.Text = "Irás al evento";
                   
                }

                

            }

            // int id_evento = 3;ahora se hardcodea valor, pero debe recibirse por sesion
            //string id_evento =  Convert.ToInt32(Session["evento"]);          

            var infoevento = (from ev in ct.evento
                             join lo in ct.locacion on ev.id_locacion equals lo.id_locacion
                             join ar in ct.artista on ev.id_artista equals ar.id_artista
                             join t in ct.tipo_evento on ev.tipo_evento equals t.id_tipo_evento
                             where ev.id_evento == id_evento //&& ev.tipo_evento == 1
                             select new
                             {
                                id_arti = ar.id_artista,
                                titulo = ev.titulo,
                                artista = ar.nombre, 
                                tipo = t.descripcion,
                                desc = ev.descripcion,
                                fecha = ev.fecha_evento,
                                donde = lo.nombre,
                                direccion = lo.direccion,
                                city = lo.ciudad,
                                capacidad = lo.capacidad,
                                contact = lo.sitio_oficial,
                                lati = lo.coordenada_x,
                                longi = lo.coordenada_y,
                                imagen = ar.image_path,
                                
                             });

            /* seteo que el decimal tiene que ser punto, porque sino latitud y longitud en el mapa fallan */
            NumberFormatInfo nfi = new NumberFormatInfo();
            nfi.NumberDecimalSeparator = ".";

            var latitud = "";
            var longitud = "";
            foreach (var even in infoevento)
            {
                linkArti.NavigateUrl = "../Pages/PerfilArtista.aspx?id_Artista=" + even.id_arti;
                linkarti2.NavigateUrl = "../Pages/PerfilArtista.aspx?id_Artista=" + even.id_arti;
                lblArti.Text = even.artista;
                lblTitulo.Text = even.tipo + " | " + even.titulo;
                lblFecha.Text = even.fecha.ToString("dddd") +" " + even.fecha.ToString("dd/M/yyyy");
                lvlDesc.Text = even.desc;
                lblLugar.Text = even.donde;
                lblDireccion.Text = even.direccion;
                lblCiudad.Text = even.city;
                lblCapacidad.Text = even.capacidad.ToString();
                lblContacto.Text = even.contact;
                latitud = ((double)even.lati).ToString(nfi);
                longitud = ((double)even.longi).ToString(nfi);
                imgArtista.Src = "../" + even.imagen;

            };
          
          /* asigno latitud y longitud de la base a los inputs hidden, que levanta la funcion js para el mapa */

            lat.Value = latitud;
            lon.Value = longitud;

            string myScriptName = "EventScriptBlock";
            string myScript = string.Empty;

            myScript = "\n<script async defer  src=\"https://maps.googleapis.com/maps/api/js?key=AIzaSyAzQgis4x77FBxoDPawUOFvt0c_D06vkM0&callback=initMap\" > </script>\n";
           
            
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myKey", myScript, false);

       }

        protected void btnEvento_Click(object sender, EventArgs e)
        {  
            
            string user = Session["usuario"].ToString();
            string mail = Session["mail"].ToString();
           // int id_evento = 3;  ahora se hardcodea valor, pero debe recibirse por sesion
            //string id_evento =  Convert.ToInt32(Session["evento"]);

            string id_evento_str = Request.QueryString["id_evento"];
            int id_evento = Convert.ToInt32(id_evento_str);

            CuandoTocan.usuario_evento ue = new usuario_evento();

            ue.flag_asist_fav = "A";

            /* en esta primera entrega se maneja solo asistencia, no hay eventos favoritos */
            /* solo los usuarios logueados pueden indicar asistencia */

            ue.id_usuario = Convert.ToInt32(Session["id_usua"]);
            ue.id_evento = Convert.ToInt32(id_evento);
            ue.fecha_alta = DateTime.Now;
            

            if (radConAuto.Checked)
            {
                
                    ue.flag_ofrece_carpooling = "S";
                    ue.origen_carpooling = txtCarpooling.Text;
                    Session["desde"] = txtCarpooling.Text;
                    ct.AddTousuario_evento(ue);
                    ct.SaveChanges();

                    WebServices.EnvioMails serv = new WebServices.EnvioMails();
                    serv.MandarMailCPConAut(id_evento, user);

                    /* si indica que va a ir y comparte su auto, se le mandan todos los que van a ese evento sin auto
                     e indicaron que les interesa el carpooling */
                    

            }
            else if (radSinAuto.Checked)
            {
                ue.flag_ofrece_carpooling = "N";
                ue.flag_usa_carpooling = "S";
                
                ct.AddTousuario_evento(ue);
                ct.SaveChanges();
                
                WebServices.EnvioMails serv = new WebServices.EnvioMails();

                serv.MandarMailCPsinAut(id_evento, mail, user);
                /* si indica que va a ir, pero sin auto, se le mandan todos los que van en auto hasta ese momento
                luego, cada vez que un usuario indique que va a ese evento y ofrezca su auto, le llegara un mail con ese */
            }
            else
            {
                ue.flag_ofrece_carpooling = "N";
                ue.flag_usa_carpooling = "N";

                ct.AddTousuario_evento(ue);
                ct.SaveChanges();

                /* si va y no marca nada, solo se registra y no manda mails */

            }
            Response.Redirect(Request.RawUrl);
        }

        protected void btnNoVoy_Click(object sender, EventArgs e)
        {

            string id_evento_str = Request.QueryString["id_evento"];
            int id_evento = Convert.ToInt32(id_evento_str);
            int id = Convert.ToInt32(Session["id_usua"]);

            var query = from ue in ct.usuario_evento
                        where ue.id_evento == id_evento && ue.id_usuario == id
                        select ue;

            foreach (var ue in query.ToList())
            {
                ct.usuario_evento.DeleteObject(ue);
                ct.SaveChanges();
            }
            Response.Redirect(Request.RawUrl);

        }

        


    }
}