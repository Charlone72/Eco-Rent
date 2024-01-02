<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<c:set var="lang" value="${not empty sessionScope.lang ? sessionScope.lang : not empty lang ? lang : 'it'}" scope="session" />

<fmt:setLocale value="${lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${sessionScope.lang}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="eco-rent home, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">
    <meta name="author" content="eco-rent">
    <title>Eco Rent</title>
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/sticky-footer-navbar/">

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="./css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-year-calendar.min.css">
    <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./css/sticky-footer.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./css/carousel.css" rel="stylesheet">

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
          margin-top: 30px; /* define margin as you see fit */
      }

      .spacer3 {
          margin-top: 10px; /* define margin as you see fit */
      }
    </style>

    <title>Home</title>
  </head>

  <body>

    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="home"/>
      </jsp:include>

      <!-- Carousel
      ================================================== -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
          <div class="item active">
            <img class="first-slide" src="pictures/carousel1.jpg" alt="First slide">
            <div class="container">
              <div class="carousel-caption">
                <h1><fmt:message key="index.titolo.slogan1" /></h1>
                <p><fmt:message key="index.slogan1" /></p>
              </div>
            </div>
          </div>
          <div class="item">
            <img class="second-slide" src="pictures/carousel1b.jpg" alt="Second slide">
            <div class="container">
              <div class="carousel-caption">
                <h1><fmt:message key="index.titolo.slogan2" /></h1>
                <p><fmt:message key="index.slogan2" /></p>
              </div>
            </div>
          </div>
          <div class="item">
            <img class="third-slide" src="pictures/carousel2.jpg" alt="Third slide">
            <div class="container">
              <div class="carousel-caption">
                <h1><fmt:message key="index.titolo.slogan3" /></h1>
                <p><fmt:message key="index.slogan3" /></p>
              </div>
            </div>
          </div>
        </div>
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div><!-- /.carousel -->

      <div class="container">

        <div class="row">
              <div class="col-md-4 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/logoER2.png" style="height:100px;" class="img-responsive center-block" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">

              </div>
        </div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p><fmt:message key="index.welcome1" /></p>
                <p><fmt:message key="index.welcome2" /></p>
                <p><fmt:message key="index.welcome3" /></p>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

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

        <!--
        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/scooter1.png" style="height:200px;" class="img-responsive center-block" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="index.titolo.slogan1" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan1" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <div class="row spacer3"></div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/sunraGrace.jpg" style="height:200px;" class="img-responsive center-block" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="index.titolo.slogan2" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan2" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>
        </div>

        <div class="row spacer3"></div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/scooter3.png" style="height:200px;" class="img-responsive center-block" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="index.titolo.slogan3" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan3" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>
        -->
      </div> <!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>

