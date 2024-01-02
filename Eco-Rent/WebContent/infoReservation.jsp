<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${sessionScope.lang}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="eco-rent info reservation, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">
    <meta name="author" content="eco-rent">
    <title>Info - Eco Rent</title>
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/sticky-footer-navbar/">

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

    <style type="text/css">
      .spacer {
          margin-top: 80px; /* define margin as you see fit */
      }

      .spacer2 {
          margin-top: 40px; /* define margin as you see fit */
      }
    </style>

    <title>Info Reservation</title>
  </head>

  <body>

    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="home"/>
      </jsp:include>


      <div class="container">

        <div class="row spacer"></div>

        <div class="row">
              <div class="text-center">
                <img src="pictures/logoER2.png" style="height:100px;" class="img-responsive center-block" />
              </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p><fmt:message key="infoReservation.yourInfo" /></p>
              </div>
          </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <IMG class="img-fluid" src="<c:out value="/ecorent/view?fk_ogg=${Oggetto.key}&num=1"/>" width="160" height="120" style="border: gray solid 1px" alt="<c:out value="${row.descrizione}"/>">
              </div>
              <div class="col-xs-6" align="left">
                <h3><c:out value="${Oggetto.nome}"/></h3>
                <p style="font-size:12px; color:#03225C;"><c:out value="${Oggetto.descrizione}"/></p>
              </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <fmt:message key="infoReservation.dateFrom" />
              </div>
              <div class="col-xs-6" align="left">
                <fmt:formatDate type = "date" value = "${Riservazione.data_inizio}" />
              </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <fmt:message key="infoReservation.dateTo" />
              </div>
              <div class="col-xs-6" align="left">
                <fmt:formatDate type = "date" value = "${Riservazione.data_fine}" />
              </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <fmt:message key="infoReservation.days" />
              </div>
              <div class="col-xs-6" align="left">
                <c:out value="${Riservazione.days}"/>
              </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <fmt:message key="infoReservation.months" />
              </div>
              <div class="col-xs-6" align="left">
                <c:out value="${Riservazione.months}"/>
              </div>
        </div>

        <div class="row">
              <div class="col-xs-6" align="right">
                <fmt:message key="infoReservation.price" />
              </div>
              <div class="col-xs-6" align="left">
                <fmt:formatNumber type="number" pattern="###.## CHF" value="${Riservazione.price}" />
              </div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-8 col-sm-8 mb-8">
                <h3><fmt:message key="infoReservation.confirm" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="infoReservation.confirm2" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>
        </div>
      </div> <!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>

