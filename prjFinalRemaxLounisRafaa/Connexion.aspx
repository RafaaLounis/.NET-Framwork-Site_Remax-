<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Connexion.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.Connexion" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title></title>
        <style type="text/css">
            .auto-style1 {
                text-align: center;
            }
            .auto-style2 {
                width: 100%;
            }
            .auto-style3 {
                text-align: right;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">
            <div>
                <h1 class="auto-style1">Remax</h1>
                <hr />
                <h3 class="auto-style1">Remax Site de recherche de Maison et villa </h3>
                <hr />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <center>
                <asp:Panel ID="panConnection" runat="server" BorderStyle="Solid" GroupingText="Identification Du Membre" Width="600px">
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style3">Numero Du Membre:</td>
                            <td>
                                <asp:TextBox ID="txtNumeroMembre" runat="server" Width="200px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">Mot De Passe:</td>
                            <td>
                                <asp:TextBox ID="txtMDP" runat="server" Width="200px"></asp:TextBox>
                            </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Button ID="btnCommencer" runat="server" Text="Commencer" Width="200px" OnClick="btnCommencer_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnEffacer" runat="server" Text="Effacer" Width="200px" OnClick="btnEffacer_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" colspan="2">
                            <asp:Label ID="lblErreur" runat="server" BorderStyle="Solid" Visible="False" Width="500px"></asp:Label>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
                </center>
        </div>
    </form>
</body>
</html>
