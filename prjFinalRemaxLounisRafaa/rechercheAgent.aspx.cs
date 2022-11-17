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
    public partial class rechercheAgent : System.Web.UI.Page
    {
        static DataSet mySet;
        public OleDbConnection myConnection;
        static DataTable tabMembre, tabCritere;
        static OleDbDataAdapter adpMembre, adpCritere;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MembreId"] == null)
            {
                Server.Transfer("Connexion.aspx");
            }
            else
            {
                ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                myConnection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                myConnection.Open();

                if (!Page.IsPostBack)
                {
                    //Création dataSet et dataTables
                    mySet = Set();
                    tabMembre = mySet.Tables["Membres"];
                    tabCritere = mySet.Tables["Criteres"];
                }
            }
        
        }
        protected void Titre(Int32 ID)
        {
            string sql = " SELECT * FROM Membres WHERE MembreId = @id";
            ID = Convert.ToInt32(Session["MembreId"]);
            OleDbCommand myCommand = new OleDbCommand(sql, myConnection);
            myCommand.Parameters.AddWithValue("id", ID);

            OleDbDataReader myReader = myCommand.ExecuteReader();

            if (myReader.Read())
            {
                litTitre.Text = myReader["Prenom"].ToString() + "    " + myReader["Nom"].ToString();
            }
            myReader.Close();
        }
        protected DataSet Set()

        {
            DataSet mySet = new DataSet();


            adpMembre = new OleDbDataAdapter("SELECT * FROM Membres", myConnection);
            adpMembre.Fill(mySet, "Membres");




            return mySet;
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Server.Transfer("rechercheAgent.aspx");

        }

      

        protected void btnContacter_Click(object sender, EventArgs e)
        {
            Int32 IdReceveur = Convert.ToInt32(lstMembre.SelectedItem.Value);
            Session["ReceveurId"] = IdReceveur;
            Response.Redirect("envoyerMessage.aspx");
        }

        protected void lstMembre_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

      
       
        protected void Rechercher_Click(object sender, EventArgs e)
        {
            btnContacterMembre.Visible = true;
            lstMembre.Items.Clear();
            string Genre = radGenre.SelectedItem.Value;
            string Langue = radLangue.SelectedItem.Value;
            string Emplacement = radEmplacement.SelectedItem.Value;
            string sql = "SELECT * FROM Membres where Membres.genre='"+ Genre + "' AND Membres.Emplacement='" + Emplacement + "'AND Membres.Langue='" + Langue + "'";
            OleDbCommand myCommand = new OleDbCommand(sql, myConnection);
            myCommand.Parameters.AddWithValue("Genre", Genre);
            myCommand.Parameters.AddWithValue("Langue", Langue);
            myCommand.Parameters.AddWithValue("Emplacement", Emplacement);
            OleDbDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                ListItem itm = new ListItem();
                itm.Text = myReader["Prenom"].ToString() + "  " + myReader["Nom"].ToString();
                itm.Value = myReader["MembreId"].ToString();
                if (!lstMembre.Items.Contains(itm))
                {
                    lstMembre.Items.Add(itm);
                }

                lstMembre.SelectedIndex = 0;
            }
            myReader.Close();
        }

        protected void btnAfficherMembres_Click(object sender, EventArgs e)
        {
            panCritere.Visible = false;
            lstMembre.Items.Clear();
            btnContacterMembre.Visible = true;
            lstMembre.Visible = true;
            lstMembre.Visible = true;
            var Membres = from DataRow membres in tabMembre.Rows where membres.Field<Int32>("MembreId") != Convert.ToInt32(Session["MembreId"]) select membres;
            if (Membres.Count() != 0)
            {
                foreach (DataRow myRow in Membres)
                {
                    ListItem elmt = new ListItem();
                    elmt.Text = myRow["Prenom"].ToString() + "    " + myRow["Nom"].ToString() + " (" + myRow["NomUtilisateur"].ToString() + ")";
                    elmt.Value = myRow["MembreId"].ToString();
                    lstMembre.Items.Add(elmt);
                }
               
                lstMembre.SelectedIndex = 0;
            }
        }
    }
}