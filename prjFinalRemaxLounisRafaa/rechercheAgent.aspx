<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rechercheAgent.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.rechercheAgent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    <style type="text/css">
        .auto-style1 {
            font-size: large;
            text-align: left;
        }
        .auto-style2 {
            font-weight: bold;
        }
        .center {
            text-align : center;
        }
        .auto-style3 {
            width: 79%
        }
        .auto-style4 {
            text-align: left;
            width: 7px;
        }
        .auto-style5 {
            width: 91%
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="text-center">
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
            <h1  style="text-decoration: underline; background-color: #FF0000;"><marquee class="auto-style3">Recherchez un membre par son nom d'utilisateur ou visitez la liste de tous les membres</marquee></h1>
                <asp:Literal ID="litTitre" runat="server"></asp:Literal>
        </div>
        <hr style="color: red;" />
            <asp:Panel ID="panCritere" runat="server" GroupingText="Critères">
                <table class="w-100">
                    <tr>
                        <td class="auto-style1"><strong>Genre<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="radGenre" ErrorMessage="Veuillez choisir un genre de votre agent" ForeColor="Red" Display="None">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style1"><strong>Emplacement<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="radEmplacement" ErrorMessage="Veuillez choisir lemplacement de vorte agent" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style1"><strong>Langue Parlé<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="radLangue" ErrorMessage="Veuillez choisir la langue de votre agent" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style1"></td>
                        <td class="auto-style1">&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <strong>
                            <asp:RadioButtonList ID="radGenre" runat="server">
                                <asp:ListItem>Homme</asp:ListItem>
                                <asp:ListItem>Femme</asp:ListItem>
                            </asp:RadioButtonList>
                            </strong></td>
                        <td class="text-left"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RadioButtonList ID="radEmplacement" runat="server">
                                <asp:ListItem>Canada</asp:ListItem>
                                <asp:ListItem>Tunisie</asp:ListItem>
                                <asp:ListItem>France</asp:ListItem>
                                <asp:ListItem>USA</asp:ListItem>
                            </asp:RadioButtonList>
                            </strong></td>
                        <td><strong>
                            <asp:RadioButtonList ID="radLangue" runat="server">
                                <asp:ListItem>Francais</asp:ListItem>
                                <asp:ListItem>Anglais</asp:ListItem>
                            </asp:RadioButtonList>
                            </strong></td>
                        <td class="text-left"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </strong></td>
                        <td class="text-left"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </strong></td>
                        <td class="text-left"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></td>
                        <td>
                            <br />
                            <div class="text-left">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <table class="auto-style5" align="center">
                <tr>
                    <td class="text-left"><strong>
                        <asp:Button ID="btnAfficherMembres" runat="server" CausesValidation="False" CssClass="auto-style2" OnClick="btnAfficherMembres_Click" Text="Afficher tous les Membres" />
                        </strong></td>
                    <td class="text-left"><strong>
                        <asp:Button ID="Rechercher" runat="server" CssClass="auto-style2" OnClick="Rechercher_Click" Text="Rechercher Membres" Width="300px" />
                        </strong></td>
                    <td class="text-left">&nbsp;</td>
                    <td class="auto-style4"><strong>
                        <asp:Button ID="btnContacterMembre" runat="server" CssClass="auto-style2" OnClick="btnContacter_Click" Text="Contacter" Visible="False" Width="300px" />
                        </strong></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:ListBox ID="lstMembre" runat="server" CssClass="text-center" Height="500px" Width="500px" OnSelectedIndexChanged="lstMembre_SelectedIndexChanged"></asp:ListBox>
        </div>
    </form>
</body>
</html>
