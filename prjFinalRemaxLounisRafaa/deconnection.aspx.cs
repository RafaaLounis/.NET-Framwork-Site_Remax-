using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjFinalRemaxLounisRafaa
{
    public partial class deconnection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //attribut la valeur null à la session MembreID ce qui entrainera une redirection vers la page connection dans des pages (accueil)
            Session["MembreId"] = null;


            //Redirection vers l'index du site
            Response.Redirect("Connexion.aspx");
        }
    }
}