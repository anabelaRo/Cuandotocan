﻿using System;
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
            altaUsuarioU.Visible = true;
            altaUsuarioA.Visible = false;
        }

        protected void ddlTiUsua_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipousu = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
            var nomTiUsu = ddlTiUsua.SelectedItem.Text;


            switch (tipousu)
            {
                case 0:
                    altaUsuarioU.Visible = false;
                    altaUsuarioA.Visible = false;
                    //UpdatePanel1.Update();
                    break;
                case 1:
                    altaUsuarioU.Visible = true;
                    altaUsuarioA.Visible = false;
                    //UpdatePanel1.Update();
                    break;
                case 2:
                    altaUsuarioU.Visible = false;
                    altaUsuarioA.Visible = true;
                    //UpdatePanel1.Update();
                    break;

            }
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
                        // Do your insert

                        if (tipousu == 1)
                        {
                            Page.Validate("registroU");
                            if (Page.IsValid)
                            {

                                try
                                {


                                    CuandoTocan.usuario us = new CuandoTocan.usuario();

                                    us.nickname = regUser.Text;
                                    us.email = regMail.Text;
                                    us.password = regPassword.Text;
                                    us.tipo_usuario = Convert.ToInt32(ddlTiUsua.SelectedItem.Value);
                                    us.nombre_completo = regNombre.Text;
                                    us.fecha_nacimiento = Convert.ToDateTime(regFNac.Text);
                                    us.biografia = TextAreaBio.Text;
                                    us.fecha_alta = DateTime.Now;


                                    ct.AddTousuario(us);
                                    ct.SaveChanges();


                                    Label1.Text = serv.MandarMailReg("regU", regMail.Text, regUser.Text);
                                }
                                catch (Exception ex)
                                {
                                    Label1.Text = ex.Message;
                                    //throw;
                                }


                                //{ MandarMail(); 

                            }
                        }
                        else if (tipousu == 2)
                        {
                            Page.Validate("registroA");
                            if (Page.IsValid)
                            { Label1.Text = serv.MandarMailReg("regA", regMail.Text, regUser.Text); }
                        }
                    }

                    else
                    {
                        Label1.Text = "Usuario en uso";
                    }

                } 
            
        }

    }
}