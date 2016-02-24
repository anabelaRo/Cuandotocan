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
           int ti_usu =  Convert.ToInt32(ddlTiUsua.SelectedItem.Value);

           //if (ti_usu == 1)
           //{
           //    altaUsuarioU.Visible = true;
           //    altaUsuarioA.Visible = false;

           //}
           //else if (ti_usu == 2)
           //{
           //    altaUsuarioU.Visible = false;
           //    altaUsuarioA.Visible = true;
           //}
           //else
           //{
           //    altaUsuarioU.Visible = false;
           //    altaUsuarioA.Visible = false;
           //}
        }

        protected void btnReg_Click(object sender, EventArgs e)
        {

            Page.Validate("registro");
            int tipousu = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
            var nomTiUsu = ddlTiUsua.SelectedItem.Text;

            WebServices.EnvioMails serv = new WebServices.EnvioMails();
            string r;
            //if(!IsPostBack)
            //{
                if (Page.IsValid)
                {
                    CuandoTocan.CuandoTocanEntities ct = new CuandoTocan.CuandoTocanEntities();
                    
                    var usuarioNoDis = ct.usuario.Count(u => u.nickname == regUser.Text);
                    
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

                                    serv.MandarMailReg("regU", regMail.Text, regUser.Text);
                                    RegOk.Text = "Gracias por registrarte, presiona Login para comenzar";
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
                               
                                //ar.image_path = "img/Users/userDefault.jpg";
                                String pathImagen = SubirFoto();

                                ar.image_path = pathImagen;
                                
                                ct.AddToartista(ar);

                                ct.SaveChanges();

                                int id_arti = ar.id_artista;

                                var query = from u in ct.usuario
                                            where u.id_usuario == id_usu
                                            select u;

                                //foreach (var u in query)
                                //{
                                //    u.id_artista = id_arti;
                                //}
                                CuandoTocan.usuario_artista uar = new CuandoTocan.usuario_artista();
                                uar.id_artista = id_arti;
                                uar.id_usuario = id_usu;
                                uar.fecha_alta = DateTime.Now;

                                ct.AddTousuario_artista(uar);
                                ct.SaveChanges();
                                RegOk.Text = "Gracias por registrarte, presiona Login para comenzar";
                                serv.MandarMailReg("regA", regMail.Text, regUser.Text);
                            }
                        }
                    }
                    else
                    {
                        Label1.Text = "El Usuario está en uso";
                    }
                }
            }

            public String SubirFoto()
            {
                String pathCompleto = "img/Users/userDefault.jpg";
                
                if (IsPostBack)
                {
                    Boolean fileOK = false;

                    String path = Server.MapPath("~/img/Users/");
                    
                    if (FileUpload2.HasFile)
                    {
                        String fileExtension = System.IO.Path.GetExtension(FileUpload2.FileName).ToLower();

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
                            FileUpload2.PostedFile.SaveAs(path + FileUpload2.FileName);
                            pathCompleto = "img/Users/" + FileUpload2.FileName;
                        }
                        catch (Exception ex)
                        {
                            pathCompleto = "img/Users/userDefault.jpg";
                        }
                    }
                }

                return pathCompleto;
            }
        }  
    }
//}
