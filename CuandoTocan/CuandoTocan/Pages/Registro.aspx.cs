using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;


namespace CuandoTocan.Pages
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }
        
  
        protected void btnReg_Click(object sender, EventArgs e)
        {
            
                Page.Validate("registro");
                int tipousu = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
                var nomTiUsu = ddlTiUsua.SelectedItem.Text;

                WebServices.EnvioMails serv = new WebServices.EnvioMails();
                string r;

                if (Page.IsValid)
                {
                    CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
                    var usuarioNoDis = ct.usuario.Count(u => u.nickname == regUser.Text );
                    if (usuarioNoDis == 0)
                    {

                        CuandoTocan.usuario us = new CuandoTocan.usuario();

                        us.nickname = regUser.Text;
                        us.email = regMail.Text;
                        us.password = regPassword.Text;
                        us.tipo_usuario = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
                        us.fecha_alta = DateTime.Now;

                        if (tipousu == 1)
                        {
                            Page.Validate("registroU");
                            if (Page.IsValid)
                            {

                                try
                                {

                                    
                                    us.nombre_completo = regNombre.Text;
                                    us.fecha_nacimiento = Convert.ToDateTime(regFNac.Text);
                                    us.biografia = TextAreaBio.Text;
                                    
                                    
                                    ct.AddTousuario(us);
                                    ct.SaveChanges();


                                    Label1.Text = serv.MandarMailReg("regU", regMail.Text, regUser.Text);
                                }
                                catch (Exception ex)
                                {
                                    Label1.Text = ex.Message;
                                    //throw;
                                }

                            }
                        }
                        else if (tipousu == 2)
                        {
                            Page.Validate("registroA");
                            if (Page.IsValid)
                            { 
                                

                            ct.AddTousuario(us);
                            ct.SaveChanges();

                            int id_usu = us.id_usuario;

                           
                            CuandoTocan.artista ar = new CuandoTocan.artista();

                            ar.nombre = txtNombreA.Text;
                            ar.spotify_id = txtSpotify.Text;
                            ar.genero = txtGeneroA.Text;
                            ar.mbid = txtMBrainz.Text;
                            ar.pais_origen = DropDownPais.SelectedItem.ToString();
                            ar.descripcion = txtDescrip.Text;

                            ct.AddToartista(ar);
                            ct.SaveChanges();

                            int id_arti = ar.id_artista;

                            var query = from u in ct.usuario
                                        where u.id_usuario == id_usu
                                        select u;

                            foreach (var u in query)
                            {
                                u.id_artista = id_arti;
                       
                            }

                            ct.SaveChanges();

                            serv.MandarMailReg("regA", regMail.Text, regUser.Text); }
                        }
                    }
                    }

                    else
                    {
                        Label1.Text = "El Usuario está en uso";
                    }

                } 
            
        }

    }
