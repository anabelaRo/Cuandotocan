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
            //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
            int id_Usuario = Convert.ToInt32(Session["id_usua"]); 

            System.Web.UI.HtmlControls.HtmlGenericControl dynDivMenu = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

            dynDivMenu.ID = "divMenutUserBanda";

            string menuUserBanda = "";

            menuUserBanda = menuUserBanda + "   <div class='list-group'>                                                                                                    " +                             
                                            "       <a class='list-group-item' href='/Pages/UsuarioBanda.aspx?id_usuario='" + id_Usuario + "'>Actualizar Datos</a>          " +
                                            "       <a class='list-group-item' href='/Pages/ActPassUserBanda.aspx?id_usuario='" + id_Usuario + "'>Cambio de Contraseña</a>  " +
                                            "       <a class='list-group-item' href='/Pages/DiscografiaUserBanda.aspx?id_usuario='" + id_Usuario + "'>Discografía</a>       " +
                                            "       <a class='list-group-item' href='/Pages/EventosUserBanda.aspx?id_usuario='" + id_Usuario + "'>Eventos</a>               " +  
                                            "   </div>                                                                                                                      " ;

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

                //**********************************************Discos************************************************
                //crearD.Visible = false;

                var infodisco = (   from art in ct.artista
                                    join dis in ct.discografia on art.id_artista equals dis.id_artista
                                    where art.id_artista == id_artista
                                    select new
                                    {
                                        id = dis.id_disco,
                                        titulo = dis.titulo,
                                        fecha = dis.fecha_publicacion,
                                        discografica = dis.discografica
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
                    tablaDiscos =   "	        <table class='table table-bordered table-striped'>	" +
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
                        tablaDiscos = tablaDiscos + "	<tr>                                        " +
                                                    "		<td>" + di.titulo + "</td>              " +
                                                    "		<td>" + di.fecha + "</td>               " +
                                                    "		<td>" + di.discografica + "</td>        " +
                                                    "		<th><button type='button' onclick='mostrarActualizarDisco(" + di.id + ",\"" + di.titulo + "\",\"" + di.fecha + "\",\"" + di.discografica + "\");' class='btn btn-default' id='" + di.id + "'>Editar</button></th>" +
                                                    "	</tr>                                       ";                        
                    }

                    tablaDiscos = tablaDiscos + "   </tbody>                                        " +
                                                "</table>                                           ";
                }

                dynDiv1.InnerHtml = tablaDiscos;

                GrillaDiscosG.Controls.Add(dynDiv1);

                //********************************************Eventos**********************************************
                //crearE.Visible = false;

                var infoevento = (  from ev in ct.evento
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

                    tablaEventos =  "	        <table class='table table-bordered table-striped'>	                " +
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

        protected void btnActPassUser_Click(object sender, EventArgs e)
        {
            valGeneroAct.Enabled = false;
            valDescrip.Enabled = false;
            //
            valPassActual.Enabled = true;
            valPassActual.Visible = true;

            valPassNueva.Enabled = true;
            valPassNueva.Visible = true;

            valRePassNueva.Enabled = true;
            valRePassNueva.Visible = true;

            valCompPassNueva.Enabled = true;
            valCompPassNueva.Visible = true;
              
            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

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

                    String pathImagen = SubirFoto();

                    if (pathImagen != "img/Users/userDefault.jpg")
                    {
                        a.image_path = pathImagen;
                    }
                }

                ct.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
        }

        protected void btnActDatosUser_Click(object sender, EventArgs e)
        {
            valGeneroAct.Visible = true;
            valGeneroAct.Enabled = true;

            valDescrip.Visible = true;
            valDescrip.Enabled = true;
            //
            valPassActual.Enabled = false;
            valPassNueva.Enabled = false;
            valRePassNueva.Enabled = false;
            valCompPassNueva.Enabled = false;
            
            Page.Validate();

            if (Page.IsValid)
            {
                CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

                //int id_Usuario = Convert.ToInt32(Request.QueryString["id_usuario"]);
                int id_Usuario = Convert.ToInt32(Session["id_usua"]);

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

                    String pathImagen = SubirFoto();

                    if (pathImagen != "img/Users/userDefault.jpg")
                    {
                        a.image_path = pathImagen;
                    }
                }

                ct.SaveChanges();
                Response.Redirect(Request.RawUrl);
            }
        }

        //Discografia
        protected void btnActualizarDisco_Click(object sender, EventArgs e)
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

        /*protected void btnNewDisco_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            divCrearDisco.Visible = false;
            mostrarD.Visible = true;
            crearDisco1.Visible = true;
        }*/

        protected void btnCrearDisco_Click(object sender, EventArgs e)
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

        /*protected void btnNewEvent_Click(object sender, EventArgs e)
        {
            CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();

            divCrearEvento.Visible = false;
            GrillaEventosG.Visible = false;
            crearE.Visible = true;

            ddlLugar2.DataValueField = "ID_locacion";
            ddlLugar2.DataTextField = "Nombre";
            ddlLugar2.DataSource = ct.locacion.ToList();

            ddlLugar2.DataBind();

            ddlTIpo2.DataValueField = "id_tipo_evento";
            ddlTIpo2.DataTextField = "descripcion";
            ddlTIpo2.DataSource = ct.tipo_evento.ToList();
            ddlTIpo2.DataBind();
        }*/

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

        public String SubirFoto()
        {
            String pathCompleto = "img/Users/userDefault.jpg";

            if (IsPostBack)
            {
                Boolean fileOK = false;

                String path = Server.MapPath("~/img/Users/");

                if (FileUpload1.HasFile)
                {
                    String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                    String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                        pathCompleto = "img/Users/" + FileUpload1.FileName;
                    }
                    catch (Exception ex)
                    {
                        pathCompleto = "img/Users/userDefault.jpg";
                    }
                }
            }

            return pathCompleto;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
        }

        /*protected void btn_SubirFoto_Click(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Boolean fileOK = false;

                String path = Server.MapPath("~/img/Users/");

                if (FileUpload1.HasFile)
                {
                    String fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();

                    String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };

                    for (int i = 0; i < allowedExtensions.Length; i++)
                    {
                        if (fileExtension == allowedExtensions[i])
                        {
                            fileOK = true;
                        }
                    }
                }

                if (fileOK)
                {
                    try
                    {
                        FileUpload1.PostedFile.SaveAs(path + FileUpload1.FileName);
                        lblSubirFoto.Text = "Archivo cargado con éxito!";
                    }
                    catch (Exception ex)
                    {
                        lblSubirFoto.Text = "Error al cargar el archivo.";
                    }
                }
                else
                {
                    lblSubirFoto.Text = "Tipo de archivo incorrecto.[gif, png, jpeg, jpg]";
                }
            }
        }*/
    }
}