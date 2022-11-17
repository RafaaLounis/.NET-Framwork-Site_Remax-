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
    public partial class envoyerMessage : System.Web.UI.Page
    {
        static OleDbConnection mycon;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["MembreId"] == null)
            {
                Server.Transfer("Connexion.aspx");
            }
            else
            {
                try
                {

                    if (IsPostBack == false)
                    {
                        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

                        // se connecter a la base de donnees
                        mycon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
                        mycon.Open();

                        string sql = "SELECT Nom,Prenom,TypeMembre,MembreId FROM Membres";

                        OleDbCommand mycmd = new OleDbCommand(sql, mycon);
                        OleDbDataReader myRder = mycmd.ExecuteReader();

                        while (myRder.Read() == true)
                        {
                            ListItem itm = new ListItem();
                            itm.Text = myRder["Nom"].ToString() + " ( " + myRder["Prenom"].ToString() + " )";
                            itm.Value = myRder["MembreId"].ToString();
                            cboDestinataires.Items.Add(itm);
                        }
                        myRder.Close();
                        mycon.Close();
                    }




                }
                catch (Exception Ex)
                {
                    litTitre.Text = Ex.Message;
                }
            }
        }


        protected void btnRecommencer_Click(object sender, EventArgs e)
        {
            txtMsg.Text = txtTitre.Text = "";
            txtTitre.Focus();
        }

        protected void btnEnvoyer_Click(object sender, EventArgs e)
        {
            int refEnvoi = Convert.ToInt32(Session["MembreId"]);
            int refRecev = Convert.ToInt32(cboDestinataires.SelectedValue);
            string titre = txtTitre.Text.Trim();
            DateTime today = DateTime.Today;

            string message = txtMsg .Text.Trim();
            bool nov = true;
            mycon.Open();

            string sql = "INSERT INTO Messages(Titre, Message,Envoyeur,Receveur,Nouveau) " +
                "VALUES(@titre,@message,@refEnvoi,@refRecev,@nov)";
            OleDbCommand mycmd = new OleDbCommand(sql, mycon);
            mycmd.Parameters.AddWithValue("Titre", titre);
            mycmd.Parameters.AddWithValue("Message", message);
            mycmd.Parameters.AddWithValue("Envoyeur", refEnvoi);
            mycmd.Parameters.AddWithValue("Receveur", refRecev);
            mycmd.Parameters.AddWithValue("Nouveau", nov);
            mycmd.Parameters.AddWithValue("DateCreation", today);

            btnEnvoyer.Visible = false;

            mycmd.ExecuteNonQuery();
            mycon.Close();
            //Retour
            Response.Redirect("Acceuil.aspx");
        }
 
    }

}
