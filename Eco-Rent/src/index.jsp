<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>
  <title>EcoRent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Bootstrap core CSS -->
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
  <script src="//netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
  <!-- Custom styles for this template -->
  <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script>

      $(function(){
          $("#footer").load("footer.html");
      });


    </script>

    <style>
      body {
        padding-top: 100px;
      }
    </style>
</head>
<body>

  <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Eco-Rent</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="#">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ricercaMezzo.htm">Cerca un Mezzo di trasporto</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Servizi
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="pubblicazione.htm"><fmt:message key="menu.daiInAffitto" /></a>
                <a class="dropdown-item" href="riservazione.htm"><fmt:message key="menu.affitta" /></a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="mailinglist.htm">Mailing list</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Contatti
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="cMartinenghi.jsp">Carlo Martinenghi</a>
                <a class="dropdown-item" href="lOrtelli.jsp">Lele Ortelli</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">Nicola Carbonetti</a>
              </div>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="partners.htm">Partners</a>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Login
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="../ecorent/Controllore?Command=viewLogin">Login</a>
                <a class="dropdown-item" href="../ecorent/Controllore?Command=viewPagination">Crea Utente</a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="../ecorent/Controllore?Command=Logout">Disconnetti</a>
              </div>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Lingua
              </a>
              <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                <a class="dropdown-item" href="?lang=it"><fmt:message key="label.lang.it" /></a>
                <a class="dropdown-item" href="?lang=en"><fmt:message key="label.lang.en" /></a>
                <a class="dropdown-item" href="?lang=de"><fmt:message key="label.lang.de" /></a>
                <a class="dropdown-item" href="?lang=fr"><fmt:message key="label.lang.fr" /></a>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </nav>

  <div class="container">
    <h3><fmt:message key="label.welcome" /></h3>
    <p>Non abbiamo ancora deciso il nome da dare!!!!</p>
  </div>

   <!-- Footer -->
   <div id="footer" />
   <!-- Footer -->

</body>
</html>
