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
<nav class="navbar navbar-fixed-top navbar-default">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Eco Rent</a>
    </div>
    <div id="navbar" class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li <c:out value='${myFunc:isActive(param.param, "home")}'/> ><a href="index.jsp">Home</a></li>
        <!-- <li <c:out value='${myFunc:isActive(param.param, "list")}'/> ><a href="Controller?Command=viewList"><fmt:message key="menu.list" /></a></li> -->
        <li <c:out value='${myFunc:isActive(param.param, "list")}'/> ><a href="scooters.jsp"><fmt:message key="menu.list" /></a></li>
        <!--<li <c:out value='${myFunc:isActive(param.param, "monopattini")}'/> ><a href="monopattini.jsp"><fmt:message key="menu.monopattini" /></a></li>-->
        <li <c:out value='${myFunc:isActive(param.param, "accessories")}'/> ><a href="accessories.jsp"><fmt:message key="menu.accessories" /></a></li>
        <li <c:out value='${myFunc:isActive(param.param, "info")}'/> ><a href="infoRent.jsp"><fmt:message key="menu.infoRent" /></a></li>
        <li <c:out value='${myFunc:isActive(param.param, "how")}'/> ><a href="howToDo.jsp"><fmt:message key="menu.howToDo" /></a></li>
        <li <c:out value='${myFunc:isActive(param.param, "retailer")}'/> ><a href="retailer.jsp"><fmt:message key="menu.retail" /></a></li>
        <li <c:out value='${myFunc:isActive(param.param, "contacts")}'/> ><a href="contacts.jsp"><fmt:message key="menu.contacts" /></a></li>
        <li <c:out value='${myFunc:isActive(param.param, "partners")}'/> ><a href="partners.jsp"><fmt:message key="menu.partners" /></a></li>
        <!--<li <c:out value='${myFunc:isActive(param.param, "calendar")}'/> ><a href="calendar.jsp">Calendario</a></li>-->
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <c:choose>
          <c:when test="${utente != null}">
            <li><a href="Controller?Command=logout">Logout</a></li>
            <li <c:out value='${myFunc:isActive(param.param, "myHome")}'/>><a href="Controller?Command=myHome">My home</a></li>
          </c:when>
          <c:otherwise>
            <li <c:out value='${myFunc:isActive(param.param, "login")}'/>><a href="Controller?Command=viewLogin">Login</a></li>
          </c:otherwise>
        </c:choose>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><fmt:message key="menu.language" /><span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Controller?Command=changeLang&lang=it"><fmt:message key="label.lang.it" /></a></li>
            <li><a href="Controller?Command=changeLang&lang=en"><fmt:message key="label.lang.en" /></a></li>
            <li><a href="Controller?Command=changeLang&lang=de"><fmt:message key="label.lang.de" /></a></li>
            <li><a href="Controller?Command=changeLang&lang=fr"><fmt:message key="label.lang.fr" /></a></li>
            <li role="separator" class="divider"></li>
            <li class="dropdown-header">Managers</li>
            <li><a href="Manager?Command=viewLogin">Login Manager</a></li>

          </ul>
        </li>
        <!--<li><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>-->
      </ul>
    </div><!--/.nav-collapse -->
  </div>
</nav>
</header>