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
            altaUsuarioU.Visible = false;
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
                if (tipousu == 1)
                {
                    Page.Validate("registroU");
                    if (Page.IsValid)
                    {

                        Label1.Text = serv.MandarMailReg("regU", regMail.Text, regUser.Text);
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
        }

    }
}