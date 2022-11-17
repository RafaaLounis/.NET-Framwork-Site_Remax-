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
    public partial class EffacerMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OleDbConnection mycon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Me\source\repos\prjFinalRemaxLounisRafaa\prjFinalRemaxLounisRafaa\App_Data\RemaxDB.mdb;Persist Security Info=True");
            mycon.Open();

            Int32 refMess = Convert.ToInt32(Request.QueryString["refM"]);
            string sql = "DELETE * FROM Messages WHERE RefMessage = " + refMess;
            OleDbCommand mycmd = new OleDbCommand(sql, mycon);
            mycmd.ExecuteNonQuery();

            mycon.Close();
            Server.Transfer("Inbox.aspx");
        }
    }
}