<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="./stayle/connexionStyle.css" rel="stylesheet" >
<title>bibliotheque</title>
</head>
<body>
	<div class="wrapper fadeInDown">
  <div id="formContent">
    
    <!-- Login Form -->
    <div>
    	<h3 style="padding:15px 0 15px 0;">Gestion de Réservation des livres</h3>
    	<h5>Créer un compte</h5>
    </div>
    <form method="post" action="registration">
      <input type="text" id="login" class="fadeIn second" name="nom" placeholder="nom" />
      <input type="text" id="login" class="fadeIn second" name="prenom" placeholder="prenom" />
      <input type="email" id="login" class="fadeIn second" name="mail" placeholder="login" />
      <input type="password" id="password" class="fadeIn third" name="password" placeholder="password" />
      <div>Vous étes :</div>
      <select name="type" style="width : 80%; padding :10px;margin :10px"> 
      	<option value="etudiant" name="etudiant">etudiant</option>
      	<option value="auteur" name="auteur"> auteur</option>
      </select></br>
      <input type="submit" class="fadeIn fourth" value="Creer compte">
    </form>
    <%
    String message = (String)request.getAttribute("message");
    %>
	<p style="color : red ;font-weight: bold;"> <%if (message != null){out.print(message);}%></p>

    <!-- connexion un compte -->
    <div id="formFooter">
      <a class="underlineHover" href="./connexion.jsp">Connextion a votre compte</a>
    </div>

  </div>
</div>

</body>
</html>