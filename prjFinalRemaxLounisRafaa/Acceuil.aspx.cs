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
    public partial class Acceuil : System.Web.UI.Page
    {
        OleDbConnection myConnection;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                if (Session["MembreId"] == null)
                {
                    Server.Transfer("Connexion.aspx");
                }
                else
                {
                    Int32 id = Convert.ToInt32(Session["MembreId"]);

                    myConnection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                    myConnection.Open();

                    //Affichage d'un titre
                    Titre(id);
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
    }
}