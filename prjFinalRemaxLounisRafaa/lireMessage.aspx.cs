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
    public partial class lireMessage : System.Web.UI.Page

    {
        OleDbConnection myConnection;
        static DataSet mySet;
        static DataTable tabMembre, tabCritere, tableMessage;
        static OleDbDataAdapter adpMembre, adpCritere, adpMessage;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                myConnection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                myConnection.Open();

                if (Session["MembreId"] == null)
                {
                    Server.Transfer("connection.aspx");
                }
                else
                {
                    //Création dataSet et dataTables
                    if (!Page.IsPostBack)
                    {
                        //Affichage du Nom et prenom du membre connecté  en titre
                        Titre(Convert.ToInt32(Session["MembreId"]));

                        //Création dataSet et dataTables
                        mySet = Set();
                        tabMembre = mySet.Tables["Membres"];
                        tabCritere = mySet.Tables["Criteres"];
                        tableMessage = mySet.Tables["Messages"];
                    }


                    Int32 refM = Convert.ToInt32(Request.QueryString["refm"]);
                    String nom = Request.QueryString["nom"];
                    var Msg = from DataRow message in tableMessage.Rows where message.Field<Int32>("RefMessage") == +refM select message;
                    //Vérification msg
                    if (Msg.Count() != 0)
                    {
                        //AFFICHAGE MESSAGE
                        DataRow myRow = Msg.First();
                        cellContenuTitre.Text = myRow["Titre"].ToString();
                        cellContenuDate.Text = myRow["DateCreation"].ToString();
                        cellContenuEnvoyeur.Text = nom;
                        cellContenuMessage.Text = myRow["Message"].ToString();
                    }
                    else
                    {
                        lblErreur.Text = "Impossible d'afficher le message veuillez réessayer dépuis votre boîte de reception";
                    }
                }

            }


            catch (Exception Ex)
            {
                litTitre.Text = Ex.Message;
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


            adpMessage = new OleDbDataAdapter("SELECT * FROM Messages", myConnection);
            adpMessage.Fill(mySet, "Messages");


            return mySet;
        }
    }
}