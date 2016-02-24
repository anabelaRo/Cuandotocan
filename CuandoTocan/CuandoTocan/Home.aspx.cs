using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;

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

               

                int cant = 0;

                foreach (var a in query)
                {
                    cant++;

                    if (cant < 5)
                    {
                        System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        dynDiv.ID = "divDescatados";
                        dynDiv.InnerHtml = "<div class='row'><div class='col-md-7'><a class='h4' href='Pages/PerfilArtista.aspx?id_Artista=" + a.id_artista + "'><img class='img-responsive' src='" + "../" + a.image_path + "' alt=''/></div><div class='col-md-5'>" + a.nombre + "</a></div></div><hr/>";

                        divDestacados1.Controls.Add(dynDiv);
                    }
                }

                // get local IP addresses

                string url = "http://checkip.dyndns.org";
                System.Net.WebRequest req = System.Net.WebRequest.Create(url);
                System.Net.WebResponse resp = req.GetResponse();
                System.IO.StreamReader sr = new System.IO.StreamReader(resp.GetResponseStream());
                string response = sr.ReadToEnd().Trim();
                string[] ax = response.Split(':');
                string a2 = ax[1].Substring(1);
                string[] a3 = a2.Split('<');
                string a4 = a3[0];



                string ipAddress = a4;


                IPAddress address;
                if (IPAddress.TryParse(ipAddress, out address))
                {
                    //Si A4 no es nulo, y es una ip valida

                    //invoco api que por Json me devuelve los datos del ip
                    //para saber la locacion del usuario

                    //devuelve:

                    //IPAddress 
                    //CountryName 
                    //CountryCode 
                    //CityName 
                    //RegionName 
                    //ZipCode 
                    //Latitude 
                    //Longitude 
                    //TimeZone 

                    string lati = null;
                    string longi = null;
                    string APIKey = "353661017e0168425c758ea08cb9c78adbe3ec6076b0d59c20ea494faea95783";
                    string url2 = string.Format("http://api.ipinfodb.com/v3/ip-city/?key={0}&ip={1}&format=json", APIKey, ipAddress);
                    using (WebClient client = new WebClient())
                    {
                        DataGrid gvLocation = new DataGrid();
                        string json = client.DownloadString(url2);
                        Location location = new JavaScriptSerializer().Deserialize<Location>(json);
                        List<Location> locations = new List<Location>();

                        lati = location.Latitude.ToString();
                        longi = location.Longitude.ToString();
                    }

                    //Luego invoco al SP, que me da los proximos eventos de acuerdo a la cercania
                    //El SP recibe las coordenadas del usuario y de ahí calcula la cercanía a lugares

                    lblProxEventos.Text = "Próximos eventos cerca tuyo";
                    var evC = ct.eventosCercanos(lati, longi);

                    foreach (var ev in evC)
                    {
                        System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        dynDiv2.ID = "proximos1";
                        dynDiv2.InnerHtml = "<div class='divImagen'><a class='imgA' href='Pages/Evento.aspx?id_evento=" + ev.id + "'><img class='img-responsive' src='" + "../" + ev.imagen + "' alt=''/> <p class='text'>" + ev.artista + "<br>" + ev.evento + "<br>" + ev.fecha.ToString("dddd") + " " + ev.fecha.ToString("dd/M") + "</p></a></div>";

                        proximos.Controls.Add(dynDiv2);
                    }



                }
                else
                {
                    //si la IP es inválida, cargo por fecha los próximos 6 eventos
                    lblProxEventos.Text = "Próximos eventos";

                    var query2 = from eve in ct.EventosProximos
                                 select eve;


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
        public class Location
        {
            public string IPAddress { get; set; }
            public string CountryName { get; set; }
            public string CountryCode { get; set; }
            public string CityName { get; set; }
            public string RegionName { get; set; }
            public string ZipCode { get; set; }
            public string Latitude { get; set; }
            public string Longitude { get; set; }
            public string TimeZone { get; set; }
        }



    }
}