<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rechercheMaison.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.rechercheMaison" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>

    <style type="text/css">
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
        .auto-style6 {
            font-size: large;
            text-align: left;
            width: 302px;
            height: 56px;
        }
        .auto-style7 {
            width: 302px;
        }
        .auto-style8 {
            font-size: large;
            text-align: left;
            width: 141px;
            height: 56px;
        }
        .auto-style9 {
            text-align: left;
            width: 141px;
        }
        .auto-style10 {
            font-size: large;
            text-align: left;
            width: 167px;
            height: 56px;
        }
        .auto-style11 {
            width: 167px;
        }
        .auto-style12 {
            font-size: large;
            text-align: left;
            height: 56px;
        }
        .auto-style13 {
            font-size: large;
            text-align: left;
            height: 56px;
            width: 500px;
        }
        .auto-style14 {
            text-align: left;
            width: 500px;
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
                            <a class="nav-link" href="Inbox.aspx">Inbox</a>
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
                        <td class="auto-style6"><strong>Type Maison<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="cboTypeMaison" Display="None" ErrorMessage="Veuillez choisir le type de maison" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style8"><strong>Nombre De Piece<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="cboNombrePiece" ErrorMessage="Veuillez choisir le Nombre de chambre" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style10"><strong>Emplacement <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="cboEmplacementMaison" ErrorMessage="Veuillez choisir l'emplacement de la maison" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style13"><strong>Prix<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cboPrixMaison" ErrorMessage="Veuillez choisir un prix " ForeColor="Red">*</asp:RequiredFieldValidator>
                            </strong></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style12"></td>
                        <td class="auto-style12"></td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            <asp:DropDownList ID="cboTypeMaison" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="22px" Width="566px">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style9"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="cboNombrePiece" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="22px" Width="566px">
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;
                            </strong></td>
                        <td class="auto-style11"><strong>
                            <asp:DropDownList ID="cboEmplacementMaison" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="22px" Width="566px">
                            </asp:DropDownList>
                            </strong></td>
                        <td class="auto-style14"><strong>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:DropDownList ID="cboPrixMaison" runat="server" BackColor="#CCCCCC" Font-Bold="True" Height="22px" Width="566px">
                            </asp:DropDownList>
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
                        <asp:Button ID="btnAfficherMaison" runat="server" CausesValidation="False" CssClass="auto-style2" OnClick="btnAfficherMembres_Click" Text="Afficher tous les Maison" />
                        </strong></td>
                    <td class="text-left"><strong>
                        <asp:Button ID="RechercherMaison" runat="server" CssClass="auto-style2" OnClick="Rechercher_Click" Text="Rechercher Maison" Width="300px" />
                        </strong></td>
                    <td class="text-left">&nbsp;</td>
                    <td class="auto-style4"><strong>
                        <asp:Button ID="btnContacterMembre" runat="server" CssClass="auto-style2" OnClick="btnContacter_Click" Text="Contacter" Visible="False" Width="300px" />
                        </strong></td>
                </tr>
            </table>
            <br />
            <br />
            <asp:ListBox ID="lstMaison" runat="server" CssClass="text-center" Height="500px" Width="500px" OnSelectedIndexChanged="lstMembre_SelectedIndexChanged"></asp:ListBox>
        </div>
    </form>
</body>
</html>
