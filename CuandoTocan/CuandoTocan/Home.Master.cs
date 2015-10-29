using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CuandoTocan
{
    public partial class Home : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
            {

             }
         protected void Submit(object sender, EventArgs e)
            {
                 //Label1.Text = txtUser.Text + " " + txtPass.Text ;
            }

         protected void Button5_Click(object sender, EventArgs e)
         {
            Page.Validate("login");
            if (Page.IsValid)
            {
                Response.Redirect("http://localhost:63281/Pages/Evento.aspx");
            }
         }

         protected void Button6_Click(object sender, EventArgs e)
         {
             Page.Validate("registro");
             if (Page.IsValid)
             {
                 Response.Redirect("http://localhost:63281/Pages/Evento.aspx");
             }
         }

         
        
        }

}














      