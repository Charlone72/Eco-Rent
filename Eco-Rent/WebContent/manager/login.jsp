<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>
  <title>EcoRent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap core CSS -->
  <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="./css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="./css/bootstrap-year-calendar.min.css">
  <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="./css/sticky-footer.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

  <script src="./js/respond.min.js"></script>
  <script src="./js/jquery-1.10.2.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>
  <script src="./js/bootstrap-datepicker.min.js"></script>
  <script src="./js/bootstrap-year-calendar.min.js"></script>
  <script src="./js/bootstrap-popover.js"></script>
  <script src="./js/scripts.js"></script>

  <script>

    $(function(){
        $("#footer").load("footer.html");
    });

    function submitForm() {

      myForm.submit();
    }


  </script>

  <style>
    .spacer {
        margin-top: 80px; /* define margin as you see fit */
    }

    .spacer2 {
        margin-top: 15px; /* define margin as you see fit */
    }
  </style>
</head>
<body>

  <div id="wrap">
    <!-- Menu -->






<!-- Navigation -->
<header>
<nav class="navbar navbar-fixed-top navbar-inverse">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="../ecorent">Eco Rent - Console amministrativa</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">

      <ul class="nav navbar-nav navbar-right">
        <li><a href="Controller?Command=logout">Logout</a></li>
        <li  >
          <a href="Manager?Command=main">My Home</a>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Funzionalità<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Manager?Command=listManager">Lista Managers</a></li>
            <li><a href="Manager?Command=viewInsertManager">Crea Manager</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="Manager?Command=listObject">Lista Oggetti</a></li>
            <li><a href="Manager?Command=viewInsertObject">Crea Oggetto</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="Manager?Command=userList">Lista Utenti</a></li>
            <li><a href="Manager?Command=reservations">Prenotazioni</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="Manager?Command=viewQuery">view query</a></li>

          </ul>
        </li>
        <!--<li><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>-->
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
</header>



    <!-- Begin page content -->
    <div class="container">

      <div class="row spacer"></div>

      <FORM name="myForm" method="post" action="/ecorent/Manager">
        <INPUT type="hidden" name="Command" value="login">

        <div class="row">
            <div class="col-md-4">

            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
              <label> </label>
            </div>
         </div>
        <div class="row">
            <div class="col-md-2">
              <label>Nome Manager:</label>
            </div>
            <div class="col-md-2">
              <INPUT type="text" name="manager" size="20" maxlength="20">
            </div>
         </div>
         <div class="row">
            <div class="col-md-2">
              <label>Password:</label>
            </div>
            <div class="col-md-2">
              <INPUT type="password" name="password" size="20" maxlength="20">
            </div>
         </div>
         <div class="row">
            <div class="col-md-4">
              <button type="submit" class="btn btn-info" onclick="javascript:submitForm()">
                  <span class="glyphicon glyphicon-search"></span> Login
              </button>
            </div>
         </div>

      </FORM>
    </div>
    <div id="push"></div>
  </div> <!-- end wrap -->

  <!-- Footer -->
  <div id="footer" />
  <!-- Footer -->

</BODY>
</HTML>