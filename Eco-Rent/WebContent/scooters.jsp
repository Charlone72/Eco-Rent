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
    <meta name="description" content="eco-rent scooters, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">
    <meta name="author" content="eco-rent">
    <title>Scooters - Eco Rent</title>

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
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
          margin-top: 60px; /* define margin as you see fit */
      }

      .spacer2 {
          margin-top: 30px; /* define margin as you see fit */
      }

      .spacer3 {
          margin-top: 10px; /* define margin as you see fit */
      }
    </style>

  </head>

  <body>

    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="list"/>
      </jsp:include>


      <div class="container">

        <!-- <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h2><fmt:message key="scooters.title" /></h2>
              </div>
          </div>
        </div>-->

        <div class="row spacer3"></div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="Controller?Command=viewList&cat=2"><img src="pictures/cat0.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><a href="Controller?Command=viewList&cat=2"><fmt:message key="scooters.row1.title" /></a></h3>
                <div style="font-size:12px; color:#03225C;"><fmt:message key="scooters.row1.body" /></div>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>
        </div>

        <div class="row spacer3"></div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="Controller?Command=viewList&cat=3"><img src="pictures/sunraGrace.jpg" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><a href="Controller?Command=viewList&cat=3"><fmt:message key="scooters.row2.title" /></a></h3><h5><fmt:message key="scooters.row2.link" /></h5>
                <div style="font-size:12px; color:#03225C;"><fmt:message key="scooters.row2.body" /></div>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <div class="row spacer3"></div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="Controller?Command=viewList&cat=45"><img src="pictures/cat2.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><a href="Controller?Command=viewList&cat=45"><fmt:message key="scooters.row3.title" /></a></h3><h5><fmt:message key="scooters.row3.link" /></h5>
                <div style="font-size:12px; color:#03225C;"><fmt:message key="scooters.row3.body" /></div>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <div class="row spacer3"></div>

      </div> <!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>

