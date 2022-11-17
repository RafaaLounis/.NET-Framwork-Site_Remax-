<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Acceuil.aspx.cs" Inherits="prjFinalRemaxLounisRafaa.Acceuil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        
        .auto-style3 {
            background-color: #FF0000;
        }


        img {
            width:100px;
            height:650px;
        }
        .auto-style4 {
            left: 0px;
            top: 0px;
            height: 25px;
        }
        .auto-style5 {
            position: relative;
            width: 100%;
            overflow: hidden;
            left: 0px;
            top: 0px;
            height: 227px;
        }
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
</head>
<body style="height: 389px">
    <form id="form1" runat="server">

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
        <div>
            <h1  style="text-decoration: underline; background-color: #FFFFFF;"><marquee class="auto-style3">Bienvenue</marquee></h1>
            <h1 class="text-center" style="color: #FF0000">
                <asp:Literal ID="litTitre" runat="server"></asp:Literal>
            </h1>
        </div>
        <hr style="color: red;" />


     





    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </form>
</body>
</html>
