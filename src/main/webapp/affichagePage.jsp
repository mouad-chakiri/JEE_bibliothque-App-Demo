<%@page import="DAO.LivresManager"%>
<%@page import="DAO.EtudiantManager"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="metier.livre"%>
<%@ page import="metier.etudiant"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet" type="text/css"
	href="./stayle/affichagePageStyle.css">

<!-- inserte bootstrap  -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>biblio</title>
</head>
<body>

	<!-- Declaration des class JEE -->
	<%
EtudiantManager manager = new EtudiantManager(); //pour manager les etudiants 
String var = request.getParameter("var");        //pour choisit soit supprimer ,aficher ou reserver
etudiant etu =(etudiant) session.getAttribute("etudiant"); //recuperer les information d'etudiant connecter
ArrayList<livre> livres = manager.livreReserver(etu.getId());
String idlivre = request.getParameter("idLivre"); 	
LivresManager m = new LivresManager();
int r = 0 ;
%>


	<!-- ------------------------------------- Nav Bar --------------------------------------------- -->
	<nav class="navbar navbar-expand-lg navBarCoss">
		<a class="navbar-brand" href="./informationPage.jsp">Bibliotheque</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="./informationPage.jsp">accueille <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="./affichagePage.jsp?var=afficher">Afficher livre réserver</a>
				</li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Reserver livre </a>
					<div class="dropdown-menu" aria-labelledby="Reserver livre">
						<a class="dropdown-item" href="./affichagePage.jsp?var=afficherLivreParAuteur">Chercher livre par auteur</a> 
						<a class="dropdown-item" href="./affichagePage.jsp?var=afficherLivreParCategorie">ChercherLivre par catégorie</a> 
						<a class="dropdown-item" href="./affichagePage.jsp?var=reserver">Afficher tout leslivres disponible</a>
					</div></li>
				<li class="nav-item"><a class="nav-link"
					href="./affichagePage.jsp?var=supprimer">Supprimer livre réserver</a></li>
			</ul>
		</div>
	</nav>
	<!-- ----------------------------------------- ------------------------------- ----------------------------------------------------- -->

	<!-- Si l'etudiant choisit afficher -->
	<%if (var.equals("afficher")){ %>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Affichage des reservation</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>livre ID</th>
									<th>Titre</th>
									<th>Auteur</th>
									<th>Categorie</th>
								</tr>
							</thead>
							<tbody>
								<%for(livre l : livres){ %>
								<tr>
									<th scope="row" class="scope"><%=l.getId()%></th>
									<td><%=l.getTitre()%></td>
									<td><%=(l.getAuteur()).getPrenom()%> <%=(l.getAuteur()).getNom()%>
									</td>
									<td><%=l.getCategorie()%></td>
								</tr>
								<%} %>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Si l'etudiant choisit reserver -->
	<%}else if (var.equals("reserver")){
   ArrayList<livre> livreDispo = m.livreDispo();
%>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Réserver un livre</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>livre ID</th>
									<th>Titre</th>
									<th>Auteur</th>
									<th>Categorie</th>
									<th>Reserver</th>
								</tr>
							</thead>
							<tbody>
								<% for (livre liv : livreDispo ){%>
								<tr>
									<th scope="row" class="scope"><%=liv.getId()%></th>
									<td><%=liv.getTitre() %></td>
									<td><%=(liv.getAuteur()).getPrenom()%> <%=(liv.getAuteur()).getNom()%>
									</td>
									<td><%=liv.getCategorie() %></td>
									<td><a class="btn btn-primary"
										href='?idLivre=<%=liv.getId()%>&var=<%=var%>'>Reserver</a></td>
								</tr>
								<%}
					    if (idlivre != null){
							int ID = (int) Integer.parseInt(idlivre);
							r = manager.reserverLivre(ID, etu.getId());
					    }
					    %>
							<span style="color: green; font-weight: 900; font-size: 25px;padding: 20%"><% if (r!=0) { out.print("un livre ajouter"); }  %></span>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- SI l'etudiant choisit de supprimer une reservation------------ -->
	<%}else if (var.equals("supprimer")){
	int supp = 0;
	%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Supprimer livre reserver</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>livre ID</th>
									<th>Titre</th>
									<th>Auteur</th>
									<th>Categorie</th>
									<th>Supprimer</th>
								</tr>
							</thead>
							<tbody>
								<%for(livre l : livres){ %>
								<tr>
									<th scope="row" class="scope"><%=l.getId() %></th>
									<td><%=l.getTitre()%></td>
									<td><%=(l.getAuteur()).getNom()%> <%=(l.getAuteur()).getPrenom() %></td>
									<td><%=l.getCategorie()%></td>
									<td><a class="btn btn-primary"
										href='?idLivre=<%=l.getId()%>&var=<%=var%>'> </a></td>
								</tr>
								<%}
					    if (idlivre != null){
							int ID = (int) Integer.parseInt(idlivre);
							supp = manager.supprimerLivreReserver(ID, etu.getId());
					    }
					    %>
						<span style="color: green; font-weight: 900; font-size: 25px;padding: 20%"><% if (supp!=0) { out.print("un livre supprimer"); }  %></span>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%}else if (var.equals("afficherLivreParAuteur")){%>

	<form method="get" action="recupererAuteur" class="form my-2 my-lg-0"
		style="width: 50%; margin: auto; padding-top: 30px">

		<lable for="prenome" style="font-weight: 900;">Donner le
		prenome d'auteur</lable>
		<input type="text" name="prenomeAutuer" class="form-control mr-sm-2"
			aria-label="prenome"
			style="border: 1px solid blue; box-shadow: -7px 9px 13px -2px rgba(53, 34, 255, 0.52)" />
		<br />
		<lable for="nomAuteur" style="font-weight: 900;">Donner le
		prenome d'auteur</lable>
		<input type="text" name="nomAuteur" class="form-control mr-sm-2"
			aria-label="nom"
			style="border: 1px solid blue; box-shadow: -7px 9px 13px -2px rgba(53, 34, 255, 0.52)" "  />
		<br />
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
	</form>
	<%
String auteurName = request.getParameter("prenomeAutuer");
String auteurLastName = request.getParameter("nomAuteur");
String livreId1 = request.getParameter("idLivre");
if ( auteurLastName != null && auteurName != null ){
ArrayList<livre> livreDispo = m.afficherLivreParAuteur(auteurName,auteurLastName);
%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Réserver un livre</h2>
				</div>
			</div>
			<span style="color: green; font-weight: 900; font-size: 25px;padding: 20%"><% if (livreId1 != null) { out.print("un livre ajouter"); }  %></span>
			<div class="row">
				<div class="col-md-12">
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>livre ID</th>
									<th>Titre</th>
									<th>Auteur</th>
									<th>Categorie</th>
									<th>Reserver</th>
								</tr>
							</thead>
							<tbody>
								<% for (livre liv : livreDispo ){%>
								<tr>
									<th scope="row" class="scope"><%=liv.getId()%></th>
									<td><%=liv.getTitre() %></td>
									<td><%=(liv.getAuteur()).getPrenom()%> <%=(liv.getAuteur()).getNom()%>
									</td>
									<td><%=liv.getCategorie() %></td>
									<td><a class="btn btn-primary" href="?idLivre=<%=liv.getId()%>&prenomeAutuer=<%=(liv.getAuteur()).getPrenom() %>&nomAuteur=<%=(liv.getAuteur()).getNom() %>">Reserver
									</a></td>
										
								</tr>
						<%}if (idlivre != null){
							int ID = (int) Integer.parseInt(idlivre);
							int a = manager.reserverLivre(ID, etu.getId());
							} %>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%}}else{ 
ArrayList<String> categorieDispo = m.categorieDespo();
%>

	<form action="recupererCategorie" method="get" style="width: 50%; margin: auto; padding-top: 30px">
		<span style="font-weight: 900 ; color : purple ; padding-bottom : 10px">Selecter categorie : </span>
		<select name="categorie" style="width: 100% ; margin-top : 15px ; margin-bottom: 15px" >
			<%for (String categ : categorieDispo){ %>
			<option name="cat">
				<%=categ%>
			</option>
			<%} %>
		</select>
		<br>
		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Chercher</button>
	</form>

	<%
String categorie = request.getParameter("categorie");
ArrayList<livre> lvr = m.afficherLivreParCategorie(categorie);
if (categorie != null ){
%>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Réserver un livre</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<h4 class="text-center mb-4">
						Afficher les livres de :
						<%=categorie %></h4>
						<span style="color: green; font-weight: 900; font-size: 25px;padding: 20%"><% if (idlivre != null) { out.print("un livre ajouter"); }  %></span>
					<div class="table-wrap">
						<table class="table">
							<thead class="thead-primary">
								<tr>
									<th>livre ID</th>
									<th>Titre</th>
									<th>Auteur</th>
									<th>Categorie</th>
									<th>Reserver</th>
								</tr>
							</thead>
							<tbody>
								<% for (livre liv : lvr ){%>
								<tr>
									<th scope="row" class="scope"><%=liv.getId()%></th>
									<td><%=liv.getTitre() %></td>
									<td><%=(liv.getAuteur()).getPrenom()%> <%=(liv.getAuteur()).getNom()%>
									</td>
									<td><%=liv.getCategorie() %></td>
									<td><a class="btn btn-primary" href="?idLivre=<%=liv.getId()%>&categorie=<%=liv.getCategorie()%>&var=<%=var%>">Reserver</a></td>
								</tr>
								<%}
					    if (idlivre != null){
							int ID = (int) Integer.parseInt(idlivre);
							int p = manager.reserverLivre(ID, etu.getId());
					    }
					    %>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>
	<%}} %>
</body>
</html>
