using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;


namespace prjFinalRemaxLounisRafaa
{
    public partial class Connexion : System.Web.UI.Page
    {
        static DataSet mySet;
        static OleDbDataAdapter adpMembre;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Connection Bd
                OleDbConnection myConnection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                myConnection.Open();

                OleDbCommand myCommand = new OleDbCommand("SELECT * FROM Membres", myConnection);


                //Création du data set
                mySet = new DataSet();
                adpMembre = new OleDbDataAdapter(myCommand);


                // Ajouter la table Membres dans le dataset
                adpMembre.Fill(mySet, "Membres");
            }
        }

        protected void btnCommencer_Click(object sender, EventArgs e)
        {
            try
            {
                string membre = txtNumeroMembre.Text.Trim();
                string pwd = txtMDP.Text.Trim();

                var membreTrouve = from DataRow membres in mySet.Tables["Membres"].Rows where (membres.Field<String>("NomUtilisateur") == membre) && membres.Field<String>("MotPasse") == pwd select membres;


                //vérification si compte trouvé
                if (membreTrouve.Count() != 0)
                {

                    DataRow login = membreTrouve.First();
                    Session["MembreId"] = login["MembreId"];
                    Response.Redirect("Acceuil.aspx");
                }

                //Sinon demander de réessayer
                else
                {
                    lblErreur.Text = "Nom Utilisateur ou  Mot de Passe Incorrecte";
                }
            }
            catch (Exception Ex)
            {
                lblErreur.Text = Ex.Message;
            }
        }

        protected void btnEffacer_Click(object sender, EventArgs e)
        {
            txtMDP.Text = "";
            txtNumeroMembre.Text = "";
            txtNumeroMembre.Focus();
        }
    }
}