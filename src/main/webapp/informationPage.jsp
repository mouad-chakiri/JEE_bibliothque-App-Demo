<%@page import="metier.etudiant"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>bibliotheque</title>

<!-- inserte bootstrap  -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="stayle/informationPageStyle.css" />

</head>

<body>

<% etudiant etu =(etudiant) session.getAttribute("etudiant"); %>
<% String password = etu.getPassword(); %>
<div style="padding-bottom: 50px ; padding-left: 10px ; padding-top: 10px" class="lolmp">
	Bonjour : 
	<span style="font-weight: 600 ; color : green; margin-bottom: 40px;">
	<%=etu.getPrenome() %> <%=etu.getName() %> 
</span>
</div>
    <div class="container"> 
        <div class="row ">
            <div class="col">
                <h4 class="h">afficher liste des livres reserver</h4>
                <br/><hr/>
                <a href="./affichagePage.jsp?var=afficher">Afficher les livres</a>
            </div>

            <div class="col">
                <h4 class="h">reserver un livre</h4>
                <hr>
                <a href="./affichagePage.jsp?var=reserver" >Afficher tout les livre disponible</a>
                <hr>
                <a href="./affichagePage.jsp?var=afficherLivreParAuteur" >Chercher un livre par son auteur</a>
                <hr>
                <a href="./affichagePage.jsp?var=afficherLivreParCategorie" >Chercher un livre par categorie</a>
            </div>
            
            <div class="col">
                <h4 class="h">Supprimer livre reserver</h4>
                <br/><hr/>
                <a href="./affichagePage.jsp?var=supprimer" >Supprimer</a>
            </div>
        </div>
    </div>
    
    
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>    
</body>
</html>