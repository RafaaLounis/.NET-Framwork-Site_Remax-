using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Drawing;

namespace prjFinalRemaxLounisRafaa
{
    public partial class Inbox : System.Web.UI.Page
    {
        OleDbConnection myConnection;
        static DataSet mySet;
        static DataTable tabMembre, tabCritere, tabMessage;
        static OleDbDataAdapter adpMembre, adpCritere, adpMessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                myConnection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                myConnection.Open();

                if (Session["MembreId"] == null)
                {
                    Server.Transfer("Connexion.aspx");
                }
                else
                {
                    if (!Page.IsPostBack)
                    {
                        //Affichage du Nom et prenom du membre connecté  en titre
                        Titre(Convert.ToInt32(Session["MembreId"]));

                        //Création dataSet et dataTables
                        mySet = Set();
                        tabMembre = mySet.Tables["Membres"];
                        tabMessage = mySet.Tables["Messages"];
                    }


                    //Création deslignes des titres de colonnes du tableau
                    TableRow maLigne = new TableRow();
                    TableCell maColonne = new TableCell();
                    maColonne.BackColor = Color.Gainsboro;
                    maColonne.Text = "Titre du Message :";
                    maLigne.Cells.Add(maColonne);



                    maColonne = new TableCell();
                    maColonne.BackColor = Color.Gainsboro;
                    maColonne.Text = "Destinateur du Message :";
                    maLigne.Cells.Add(maColonne);



                    maColonne = new TableCell();
                    maColonne.BackColor = Color.Gainsboro;
                    maColonne.Text = "Actions :";
                    maLigne.Cells.Add(maColonne);

                    tableMessage.Rows.Add(maLigne);

                    var Messages = (from DataRow msgs in tabMessage.Rows
                                    join DataRow membres in tabMembre.Rows
on msgs.Field<Int32>("Envoyeur") equals membres.Field<Int32>("MembreId")
                                    where msgs.Field<Int32>("Receveur") == Convert.ToInt32(Session["MembreId"])
                                    select new
                                    {
                                        Nom = membres.Field<String>("Nom"),
                                        Prenom = membres.Field<String>("Prenom"),
                                        NomUtilisateur = membres.Field<String>("NomUtilisateur"),
                                        Nouveau = msgs.Field<Boolean>("Nouveau"),
                                        Titre = msgs.Field<String>("Titre"),
                                        refMsg = msgs.Field<Int32>("RefMessage")
                                    }).Distinct().ToList();
                    if (Messages.Count() != 0)
                    {
                        //Pour chaque enregistrement dans la table message du membre
                        foreach (var myRow in Messages)
                        {
                            maLigne = new TableRow();

                            //Couleur différente pour les messages non lu
                            if (myRow.Nouveau.ToString() == "True")
                            {
                                maLigne.BackColor = Color.LightYellow;
                            }

                            maColonne = new TableCell();
                            maColonne.Text = myRow.Titre.ToString();
                            maLigne.Cells.Add(maColonne);

                            maColonne = new TableCell();
                            maColonne.Text = myRow.Prenom.ToString() + "    " + myRow.Nom.ToString() + "  (" + myRow.NomUtilisateur.ToString() + ")";
                            maLigne.Cells.Add(maColonne);

                            maColonne = new TableCell();

                            int refmsg = Convert.ToInt32(myRow.refMsg);
                            String nom = myRow.Prenom.ToString() + "    " + myRow.Nom.ToString() + "  (" + myRow.NomUtilisateur.ToString() + ")";

                            //Liens pour actions lire et supprimer
                            maColonne.Text = "<a href='lireMessage.aspx?refm=" + refmsg + "&nom=" + nom + "'>Lire</a> - <a href='EffacerMsg.aspx?refm=" + refmsg + "'>Effacer</a>";
                            maLigne.Cells.Add(maColonne);

                            tableMessage.Rows.Add(maLigne);
                        }
                    }
                    else
                    {
                        lblInfo.Text = "Vous n'avez aucun message pour l'instant";
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