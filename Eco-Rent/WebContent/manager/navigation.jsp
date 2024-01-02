<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages"/>

<c:set var="pageActive" value='request.getParameter("param")' scope="request" />

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
        <li <c:out value='${myFunc:isActive(param.param, "home")}'/> >
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

