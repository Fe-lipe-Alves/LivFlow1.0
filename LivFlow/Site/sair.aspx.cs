using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LivFlow.Site
{
    public partial class sair : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["usuario_codigo"] != null)
            {
                Session.RemoveAll();
            }

            Response.Redirect("home.aspx");
        }
    }
}