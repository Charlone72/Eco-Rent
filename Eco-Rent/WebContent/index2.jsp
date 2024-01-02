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
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">
    <link rel="canonical" href="https://getbootstrap.com/docs/3.4/examples/sticky-footer-navbar/">

    <title>Sticky Footer Navbar Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="./css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-year-calendar.min.css">
    <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./css/sticky-footer2.css" rel="stylesheet">


    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">

    <script src="./js/respond.min.js"></script>
    <script src="./js/jquery-1.10.2.min.js"></script>
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/bootstrap-datepicker.min.js"></script>
    <script src="./js/bootstrap-year-calendar.min.js"></script>
    <script src="./js/bootstrap-popover.js"></script>
    <script src="./js/scripts.js"></script>

    <title>Home</title>
  </head>

  <body>

    <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="home"/>
      </jsp:include>

    <!-- Begin page content -->
    <div class="container">


        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="index.welcome" /></h3>
                <p><fmt:message key="index.welcome1" /></p>
                <p><fmt:message key="index.welcome2" /></p>
                <p><fmt:message key="index.welcome3" /></p>
              </div>
          </div>
        </div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/scooter1.png" style="height:200px; margin-left:-15px;" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3>Eco-Rent</h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan1" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/scooter1.png" style="height:200px; margin-left:-15px;" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3>Eco-Rent</h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan2" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/scooter3.png" style="height:200px; margin-left:-15px;" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3>Eco-Rent</h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="index.slogan3" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>
    </div> <!-- end container -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>

