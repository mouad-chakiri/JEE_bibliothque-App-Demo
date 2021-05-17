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
    	<h3 style="padding:15px 0 15px 0;">Gestion de Bibioltheque</h3>
    </div>
    <form method="post" action="connexion">
      <input type="email"  class="fadeIn second" name="mail" placeholder="login">
      <input type="password" class="fadeIn third" name="password" placeholder="password">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>
    <%
    String message = (String)request.getAttribute("message");
    %>
	<p style="color : red ;font-weight: bold;"> <%if (message != null){out.print(message);}%></p>
    <!-- Cree un compte -->
    <div id="formFooter">
      <a class="underlineHover" href="./registration.jsp">créer un nouveau compte</a>
    </div>

  </div>
</div>
</body>
</html>