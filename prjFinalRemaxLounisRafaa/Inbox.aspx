<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inbox.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.Inbox" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    </head>
<body>
    <form id="form1" runat="server">
        <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">

                        <li class="nav-item">
                            <a class="nav-link" href="Acceuil.aspx">Accueil</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="inbox.aspx">Inbox</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="rechercheAgent.aspx">Rechercher un Agent </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="rechercheMaison.aspx">Rechercher une maison </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="deconnection.aspx">Déconnection </a>
                        </li>
                        

                    </ul>

                </div>
            </div>
        </nav>
        </div>
        <div>
            <h1  style="text-decoration: underline; background-color: #FF0000;"><marquee class="auto-style3">Votre boîte de reception</marquee></h1>
            <h1 class="text-center" style="color: #FF0000">
                <asp:Literal ID="litTitre" runat="server"></asp:Literal>
            &nbsp;&nbsp;
            </h1>
        </div>
        <hr style="color: red;" />
        <br />
        <center>
            <strong>
        <asp:Table ID="tableMessage" runat="server" BorderStyle="Solid" GridLines="Both" Width="629px">
        </asp:Table>
            </strong>
            <br />
            <strong>
            <asp:Label ID="lblInfo" runat="server"></asp:Label>
            </strong>
            </center>
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
    </form>
</body>
</html>
