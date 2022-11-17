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
    public partial class rechercheMaison : System.Web.UI.Page
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

                        string sql = "SELECT * FROM CritereMaison";

                        OleDbCommand mycmd1 = new OleDbCommand(sql, mycon);

                        OleDbDataReader myRder = mycmd1.ExecuteReader();



                        while (myRder.Read() == true)
                        {
                            ListItem typeMaison = new ListItem();
                            typeMaison.Text = myRder["TypeMaison"].ToString() + " ( " + myRder["Disponible"].ToString() + " )";
                            typeMaison.Value = myRder["TypeMaison"].ToString();
                            cboTypeMaison.Items.Add(typeMaison);

                            ListItem Emplacement = new ListItem();
                            Emplacement.Text = myRder["EmplacementMaison"].ToString();
                            Emplacement.Value = myRder["EmplacementMaison"].ToString();

                            cboEmplacementMaison.Items.Add(Emplacement);

                            ListItem NombrePiece = new ListItem();
                            NombrePiece.Text = myRder["NombrePieceMaison"].ToString();
                            NombrePiece.Value = myRder["NombrePieceMaison"].ToString();

                            cboNombrePiece.Items.Add(NombrePiece);


                            ListItem PrixMaison = new ListItem();
                            PrixMaison.Text = myRder["PrixMaison"].ToString();
                            PrixMaison.Value = myRder["PrixMaison"].ToString();

                            cboPrixMaison.Items.Add(PrixMaison);
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

        protected void Rechercher_Click(object sender, EventArgs e)
        {
            lstMaison.Items.Clear();

            btnContacterMembre.Visible = true;
            lstMaison.Items.Clear();
            string PrixMaison = cboPrixMaison.SelectedItem.Value;
            string EmplacementMaison = cboEmplacementMaison.SelectedItem.Value;
            string NombrePiece = cboNombrePiece.SelectedItem.Value;
            string TypeMaison = cboTypeMaison.SelectedItem.Value;
            mycon.Open();
            string sql = "SELECT * FROM CritereMaison where CritereMaison.PrixMaison='" + PrixMaison + "' AND CritereMaison.EmplacementMaison='" + EmplacementMaison + "'AND CritereMaison.NombrePieceMaison='" + NombrePiece + "'AND CritereMaison.TypeMaison='" + TypeMaison + "'";
            OleDbCommand myCommand = new OleDbCommand(sql, mycon);
            myCommand.Parameters.AddWithValue("PrixMaison", PrixMaison);
            myCommand.Parameters.AddWithValue("EmplacementMaison", EmplacementMaison);
            myCommand.Parameters.AddWithValue("NombrePieceMaison", NombrePiece);
            myCommand.Parameters.AddWithValue("TypeMaison", TypeMaison);

            OleDbDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                ListItem itm = new ListItem();
                itm.Text = myReader["NomMaison"].ToString() ;
                itm.Value = myReader["RefMaison"].ToString();
                if (!lstMaison.Items.Contains(itm))
                {
                    lstMaison.Items.Add(itm);
                }

                lstMaison.SelectedIndex = 0;
            }
            myReader.Close();
            mycon.Close();
        }

        protected void btnContacter_Click(object sender, EventArgs e)
        {

            Response.Redirect("envoyerMessage.aspx");
        }

        protected void lstMembre_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAfficherMembres_Click(object sender, EventArgs e)
        {
            lstMaison.Items.Clear();
            string sql = "SELECT NomMaison from CritereMaison";
            mycon.Open();

            OleDbCommand myCommand = new OleDbCommand(sql, mycon);
            OleDbDataReader myReader = myCommand.ExecuteReader();
            while (myReader.Read())
            {
                ListItem itm = new ListItem();
                itm.Text = myReader["NomMaison"].ToString();
                if (!lstMaison.Items.Contains(itm))
                {
                    lstMaison.Items.Add(itm);
                }

                lstMaison.SelectedIndex = 0;
            }
            myReader.Close();
            mycon.Close();
        }
    }
}