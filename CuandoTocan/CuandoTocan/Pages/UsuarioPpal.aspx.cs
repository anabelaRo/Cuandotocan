using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace CuandoTocan.Pages
{
	public partial class UsuarioPpal : System.Web.UI.Page
    {
        int id_usuario;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            int id_Usuario = Convert.ToInt32(Session["id_usua"]);

            System.Web.UI.HtmlControls.HtmlGenericControl dynDivMenu = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
			
			CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
			
			System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            dynDivMenu.ID = "divMenutUserPpal";

            string menuUserPpal = "";

			if (Session["tipoUsuario"].Equals(1))
			{
				menuUserPpal = menuUserPpal + "	<div class='list-group'>																										" +
											  "		<a class='list-group-item' href='/Pages/ActDatosUserEstandar.aspx?id_usuario='" + Session["id_usua"] + "'>Actualizar Datos</a>		" +
											  "		<a class='list-group-item' href='/Pages/ActPassUserEstandar.aspx?id_usuario='" + Session["id_usua"] + "'>Cambio de Contraseña</a>	" +
                                              "	</div> " ;
			}
			else
			{
				menuUserPpal = menuUserPpal + "	<div class='list-group'>																									" +
											  "		<a class='list-group-item' href='/Pages/ActDatosUserBanda.aspx?id_usuario='" + Session["id_usua"] + "'>Actualizar Datos</a>		" +
											  "		<a class='list-group-item' href='/Pages/ActPassUserBanda.aspx?id_usuario='" + Session["id_usua"] + "'>Cambio de Contraseña</a>	" +
											  "</div>																														";
			}

			dynDivMenu.InnerHtml = menuUserPpal;
            divMenuUsuarioVert.Controls.Add(dynDivMenu);
//            System.Web.UI.HtmlControls.HtmlGenericControl dynDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            int primero = 0;

            var usuarioPpal = (  from usu in ct.usuario
                                 where usu.id_usuario == id_Usuario
								select new
								{
									id_usuario = usu.id_usuario,
									usuario = usu.nickname,
									email = usu.email,
									nombre = usu.nombre_completo,
									fechanac = usu.fecha_nacimiento,
									biografia = usu.biografia,
									image_path = usu.image_path
								});

			foreach (var a in usuarioPpal)
            {
                if (primero == 0)
                {
                    dynDiv.ID = "divImgUsuario";
                    dynDiv.InnerHtml = "<img class='imgUsuario' alt='' src='../" + a.image_path + "' />";

                    divImgUsuario1.Controls.Add(dynDiv);

                    primero = 1;
                }
                
                regUser.Text = a.usuario;
                regMail.Text = a.email;
                txtNombreA.Text = a.nombre;

                if (!IsPostBack)
                {
					//txtFechaNac.Text = Convert.ToString(a.fechanac);
					DateTime fechafmt = Convert.ToDateTime(a.fechanac);
					txtFechaNac.Text = fechafmt.ToString("dd/MM/yyyy");
					txtBiografia.Text = a.biografia;
                }

				id_usuario = a.id_usuario;

                //***************************************Artistas************************************************

                var artistasSeguidos = (      from ar in ct.artista
											  join ua in ct.usuario_artista on ar.id_artista equals ua.id_artista
											 where ua.id_usuario == id_usuario
											select new
											{
												id_artista = ar.id_artista,
												nombre = ar.nombre,
												genero = ar.genero,
												estado = ar.estado,
												paisorigen = ar.pais_origen,
												imagepath = ar.image_path
                                    });

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv1 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                dynDiv1.ID = "GrillaArtistas";

                string tablaArtistas = "";

				if (artistasSeguidos.Count() == 0)
                {
					tablaArtistas = tablaArtistas + "<strong>Usted no está siguiendo a ningún artista</strong>";
                }
                else
                {
					tablaArtistas = "	        <table class='table table-bordered table-striped'>	" +
                                    "	        	<thead>											" +
                                    "	        		<tr>                                        " +
                                    "	        			<th>Nombre</th>                         " +
                                    "	        			<th>Género</th>           " +
                                    "	        			<th>Estado</th>                   " +
                                    "	        			<th>País de origen</th>                         " +
                                    "	        		</tr>                                       " +
                                    "	        	</thead>                                        " +
                                    "	        	<tbody>                                         ";

					foreach (var ars in artistasSeguidos)
                    {
						tablaArtistas = tablaArtistas + " <tr>                               " +
													"		 <td><a class='aArtista' href='./PerfilArtista.aspx?id_Artista=" + ars.id_artista + "'>" + ars.nombre + "</a></td>" +
													"		 <td>" + ars.genero + "</td>     " +
													"		 <td>" + ars.estado + "</td>     " +
													"		 <td>" + ars.paisorigen + "</td> " +
                                                    "	  </tr>                              ";                        
                    }

					tablaArtistas = tablaArtistas + "   </tbody>                             " +
                                                    "</table>                                ";
                }

				dynDiv1.InnerHtml = tablaArtistas;

				GrillaArtistasS.Controls.Add(dynDiv1);

                //********************************************Eventos**********************************************
                //crearE.Visible = false;

				var eventosSeguidos = (from ev in ct.evento
									   join ue in ct.usuario_evento on ev.id_evento equals ue.id_evento
                                       join lo in ct.locacion on ev.id_locacion equals lo.id_locacion
                                       join ti in ct.tipo_evento on ev.tipo_evento equals ti.id_tipo_evento
									   where ue.id_usuario == id_usuario
                                       select new
                                    {
                                        id_evento = ev.id_evento,
                                        nombre = ev.titulo.Replace("\"", ""),
                                        fecha = ev.fecha_evento,
                                        lugar = lo.nombre,
                                        tipo = ti.descripcion,
                                        desc = ev.descripcion,
										
                                    });

                System.Web.UI.HtmlControls.HtmlGenericControl dynDiv2 = new System.Web.UI.HtmlControls.HtmlGenericControl("div");

                dynDiv2.ID = "GrillaEventos";

                string tablaEventos = "";

				if (eventosSeguidos.Count() == 0)
                {
                    tablaEventos = "<strong>Usted no está asistiendo a ningún evento</strong>                             ";
                }
                else
                {
                    tablaEventos =  "	        <table class='table table-bordered table-striped'>	                " +
                                    "	        	<thead>											                " +
                                    "	        		<tr>                                                        " +
                                    "	        			<th>Nombre</th>                                         " +
                                    "	        			<th>Descripción</th>                                    " +
                                    "	        			<th>Fecha</th>                                          " +
                                    "	        			<th>Lugar</th>                                          " +
                                    "	        			<th>Tipo Evento</th>                                    " +
                                    "	        		</tr>                                                       " +
                                    "	        	</thead>                                                        " +
                                    "	        	<tbody>                                                         ";

					foreach (var ev in eventosSeguidos)
                    {
                        tablaEventos = tablaEventos + "	<tr>																										" +
													"		<td><a class='aEventos' href='./Evento.aspx?id_evento=" + ev.id_evento + "'>" + ev.nombre + "</a></td>	" +
                                                    "		<td>" + ev.desc + "</td>																				" +
                                                    "		<td>" + ev.fecha.ToString("dd/M/yyyy hh:mm") + "</td>													" +
                                                    "		<td>" + ev.lugar + "</td>																				" +
                                                    "		<td>" + ev.tipo + "</td>																				" +
                                                    "	</tr>                                                       ";                        
                    }

                    tablaEventos = tablaEventos + " </tbody>                                                        " +
                                                "</table>                                                           ";
                }

                dynDiv2.InnerHtml = tablaEventos;

                GrillaEventosG.Controls.Add(dynDiv2);
            }
        }
    }
}