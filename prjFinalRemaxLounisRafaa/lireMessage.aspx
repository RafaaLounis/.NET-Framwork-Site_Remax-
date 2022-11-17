<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lireMessage.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.lireMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    <style type="text/css">
        .auto-style1 {
            font-size: large;
        }
    </style>

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
            <h1  style="text-decoration: underline; background-color: #FF0000;"><marquee class="auto-style3">Lecture du message</marquee></h1>
            <h1 class="text-center" style="color: #FF0000">
                <asp:Literal ID="litTitre" runat="server"></asp:Literal>
            &nbsp;&nbsp;
            </h1>
        </div>
        <hr style="color: red;" />
        <br />
        <asp:Table ID="tabMessage" runat="server" BorderStyle="Solid" CssClass="auto-style1" Font-Bold="True" GridLines="Both" Height="337px" HorizontalAlign="Center" Width="771px">
            <asp:TableRow runat="server">
                <asp:TableCell ID="cellTitre" runat="server" Height="8%" Width="20%">Titre</asp:TableCell>
                <asp:TableCell ID="cellContenuTitre" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell ID="cellDate" runat="server" Height="8%" Width="20%">Date</asp:TableCell>
                <asp:TableCell ID="cellContenuDate" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell ID="cellEnvoyeur" runat="server" Height="8%" Width="20%">De </asp:TableCell>
                <asp:TableCell ID="cellContenuEnvoyeur" runat="server"></asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server" VerticalAlign="top">
                <asp:TableCell ID="cellMessage" runat="server" Height="76%" Width="20%">Message</asp:TableCell>
                <asp:TableCell ID="cellContenuMessage" runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="lblErreur" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:HyperLink ID="linkInbox" runat="server" ForeColor="Red" NavigateUrl="~/inbox.aspx">Retour aux Messages</asp:HyperLink>
    </form>
</body>
</html>
