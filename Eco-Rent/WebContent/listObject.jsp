<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${sessionScope.lang}">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="eco-rent scooters, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">
    <meta name="author" content="eco-rent">
    <title>listObjects - Eco Rent</title>

    <!-- Bootstrap CSS -->
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


    <!-- Custom styles for this template -->

  <style>


    div.main {
      position: relative;
      width: 250px;
      height: 90px;
      border: 0px solid #73AD21;
    }

    div.title {
        position: relative;
        width: 130px;
        height: 25px;
        border: 0px solid #73AD21;
        //font-family: Arial;
        color: blue;
        font-size:18px;
        float: left;
    }

    div.marca {
        position: relative;
        width: 130px;
        height: 25px;
        border: 0px solid #73AD21;
        //font-family: Arial;
        color: blue;
        font-size:14px;
        float: left;
    }

    div.type {
        position: relative;
        width: 120px;
        height: 25px;
        float: left;
        //color: blue;
        font-size:14px;
        padding: 1px;
    }
    div.body {
        position: relative;
        width: 250px;
        height: 65px;
        border: 0px solid #73AD21;
        font-size:14px;

    }

    .spacer {
        margin-top: 40px; /* define margin as you see fit */
    }

    .spacer2 {
        margin-top: 15px; /* define margin as you see fit */
    }

  </style>

  <script>

    function viewObject(sel){
      document.myForm.key.value = sel;
      document.myForm.submit();
    }

    function rentObject(sel) {
        document.myForm.key.value = sel;
        document.myForm.Command.value = 'rentObject';
        document.myForm.submit();

    }

  </script>

  </head>
  <body>
  <div id="wrap">
    <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="list"/>
      </jsp:include>

    <!-- Begin page content -->
    <div class="container">

      <div class="row spacer"></div>

      <div class="row">
        <div class="col-3 mx-auto">
            <div class="text-center">
              <h3><fmt:message key="listObject.title" /></h3>
            </div>
        </div>
      </div>

      <FORM name="myForm" method="post" action="/ecorent/Controller">
        <INPUT type="hidden" name="Command" value="viewObject">
        <INPUT type="hidden" name="key" value="?">
        <INPUT type="hidden" name="page" value="">

<c:choose>
    <c:when test="${objectsFree.size() gt 0}">

          <div class="row">
            <div class="col-3 mx-auto">
                <h4><fmt:message key="listObject.available.title" /></h4>
            </div>
          </div>

          <div class="row spacer2"></div>

          <c:forEach var="row" items="${objectsFree}" varStatus="loopCounter">
            <c:set var="url" value="/ecorent/view?fk_ogg=${row.key}&num=1" scope="request" />
                  <div class="row">
             <c:if test="${viewPicture}">
                     <div class="col-xs-4 col-sm-2">
                        <A href="javascript:viewObject('<c:out value="${row.key}"/>')"><IMG src="<c:out value="${url}"/>" width="123" height="92" style="border: gray solid 1px"></A>
                     </div>
             </c:if>
                    <div class="col-xs-8 col-sm-4">
                           <div class="main">
                             <div class="title"><c:out value="${row.nome}"/></div>
                             <div class="type"><c:out value="${row.tipo}"/></div>
                             <div class="body"><c:out value="${row.descrizione}"/><br><c:out value="${row.varie}"/></div>
                           </div>
                     </div>
                     <div class="col-xs-8 col-sm-4">
                           <div class="main">
                             <div class="marca"><c:out value="${row.marca}"/></div>
                             <div class="type">Anno: <c:out value="${row.anno}"/></div>
                             <div class="body">
                                <c:out value="${row.specifiche}"/>
                             </div>
                           </div>
                     </div>
                     <div class="col-xs-4 col-sm-2">
                        <button type="button" class="btn btn-info" name="deleteO" onclick="javascript:rentObject('<c:out value="${row.key}"/>')">
                          <span class="glyphicon glyphicon-search"></span><fmt:message key="listObject.available.btn" />
                        </button>
                     </div>
                   </div>
                   <div class="row spacer2"></div>
          </c:forEach>

  </c:when>
  <c:otherwise>
       <c:if test="${objectsNotFree.size() gt 0}">
          <div class="row">
            <div class="col-3 mx-auto">
                <h4><fmt:message key="listObject.available.title.empty" /></h4>
            </div>
          </div>
       </c:if>
   </c:otherwise>
</c:choose>

<div class="row spacer2"></div>

<c:choose>
    <c:when test="${objectsNotFree.size() gt 0}">

          <div class="row">
            <div class="col-3 mx-auto">
                <h4><fmt:message key="listObject.notAvailable.title" /></h4>
            </div>
          </div>

          <div class="row spacer2"></div>

          <c:forEach var="row" items="${objectsNotFree}" varStatus="loopCounter">
            <c:set var="url" value="/ecorent/view?fk_ogg=${row.key}&num=1" scope="request" />
                  <div class="row">
             <c:if test="${viewPicture}">
                     <div class="col-xs-4 col-sm-2">
                        <A href="javascript:viewObject('<c:out value="${row.key}"/>')"><IMG src="<c:out value="${url}"/>" width="123" height="92" style="border: gray solid 1px"></A>
                     </div>
             </c:if>
                    <div class="col-xs-8 col-sm-4">
                           <div class="main">
                             <div class="title"><c:out value="${row.nome}"/></div>
                             <div class="type"><c:out value="${row.tipo}"/></div>
                             <div class="body"><c:out value="${row.descrizione}"/><br><c:out value="${row.varie}"/></div>
                           </div>
                     </div>
                     <div class="col-xs-8 col-sm-4">
                           <div class="main">
                             <div class="marca"><c:out value="${row.marca}"/></div>
                             <div class="type">Anno: <c:out value="${row.anno}"/></div>
                             <div class="body">
                                <c:out value="${row.specifiche}"/>
                             </div>
                           </div>
                     </div>
                     <div class="col-xs-4 col-sm-2">
                        <button type="button" class="btn btn-info" name="deleteO" onclick="javascript:rentObject('<c:out value="${row.key}"/>')">
                          <span class="glyphicon glyphicon-search"></span><fmt:message key="listObject.available.btn" />
                        </button>
                     </div>
                   </div>
                   <div class="row spacer2"></div>
          </c:forEach>

  </c:when>
  <c:otherwise>
      <!--   <c:if test="${objectsFree.size() gt 0}">
          <div class="row">
            <div class="col-3 mx-auto">
                <h4><fmt:message key="listObject.notAvailable.title.empty" /></h4>
            </div>
          </div>
       </c:if>-->
   </c:otherwise>
</c:choose>

        <c:if test="${objectsFree.size() eq 0 and objectsNotFree.size() eq 0}">
          <div class="row">
            <div class="col-3 mx-auto">
                <h4><fmt:message key="listObject.empty" /></h4>
            </div>
          </div>
       </c:if>

        </FORM>

      </div>
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>