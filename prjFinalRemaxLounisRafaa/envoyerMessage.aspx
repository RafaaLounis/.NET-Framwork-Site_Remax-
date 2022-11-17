<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="envoyerMessage.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.envoyerMessage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    <style type="text/css">

        .auto-style3 {
            width: 98%;
        }
        .auto-style4 {
            text-align: right;
            width: 261px;
        }
        .auto-style7 {
            width: 300px;
        }
        .auto-style9 {
            text-align: right;
            height: 26px;
            width: 261px;
        }
        .auto-style10 {
            width: 300px;
            height: 26px;
        }
        .auto-style11 {
            height: 26px;
        }
        .auto-style5 {
            text-align: right;
            height: 30px;
            width: 261px;
        }
        .auto-style8 {
            height: 30px;
            width: 300px;
            text-align: right;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style12 {
            width: 59%;
            font-size: large;
        }
        .auto-style13 {
            font-weight: bold;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="text-center">
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
                            <a class="nav-link" href="rechercheAgent.aspx">Rechercher un Membre </a>
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
            <h1  style="text-decoration: underline; background-color: #FF0000;"><marquee class="auto-style3">Envoyer un message a votre agent</marquee></h1>
            <h1 class="text-center" style="color: #FF0000">
                <asp:Literal ID="litTitre" runat="server"></asp:Literal>
            &nbsp;&nbsp;
            </h1>
        </div>
        <hr style="color: red;" />
        <br />
        <table align="center" class="auto-style12">
            <tr>
                <td class="auto-style4"><strong>Destinataire:</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="cboDestinataires" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="22px" Width="566px">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqDestinataire" runat="server" ControlToValidate="cboDestinataires" ErrorMessage="Champ Destinataire Vide" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style9"><strong>Titre Message:</strong></td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtTitre" runat="server" Width="250px" CssClass="auto-style13"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:RequiredFieldValidator ID="reqTitre" runat="server" ControlToValidate="txtMsg" ErrorMessage="Champ Titre Vide" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"><strong>Contenu Message:</strong></td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtMsg" runat="server" Height="200px" TextMode="MultiLine" Width="250px" CssClass="auto-style13"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="reqMsg" runat="server" ControlToValidate="txtMsg" ErrorMessage="Champ Message Vide" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="btnEnvoyer" runat="server" OnClick="btnEnvoyer_Click" Text="Envoyer" CssClass="auto-style13" Width="250px" />
                </td>
                <td class="auto-style8" colspan="2">
                    <asp:Button ID="btnRecommencer" runat="server" OnClick="btnRecommencer_Click" Text="Recommencer" CssClass="auto-style13" Width="250px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1" colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                    </strong></strong></td>
            </tr>
        </table>
        <br />
        <asp:HyperLink ID="linkInbox" runat="server" ForeColor="Red" NavigateUrl="~/rechercheAgent.aspx">Retour aux Recherche Agent</asp:HyperLink>
    </form>
</body>
</html>
