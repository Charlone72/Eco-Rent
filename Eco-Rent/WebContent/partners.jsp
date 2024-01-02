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
    <meta name="description" content="eco-rent info, rent scooter, noleggio scooter, affitto scooter">
    <meta name="author" content="eco-rent">
    <title>Partners - Eco Rent</title>

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


    <style type="text/css">
      .spacer {
          margin-top: 40px; /* define margin as you see fit */
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="partners"/>
      </jsp:include>


      <div class="container">

        <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="partners.title" /></h3>
              </div>
          </div>
        </div>


        <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <img src="pictures/Loco75_Logo_Nav_1.png" style="height:180px;" class="img-responsive center-block" />
              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="partners.locoT" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="partners.loco" /></p>
                <p style="font-size:12px; color:#03225C;"><a target="_blank" href="http://<fmt:message key="partners.locoLink" />"><fmt:message key="partners.locoLink" /></a></p>
                <p style="font-size:12px; color:#03225C;"><a href="mailto:<fmt:message key="partners.locoMail" />"><fmt:message key="partners.locoMail" /></a></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>

        <!--<div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <!--  <img src="pictures/filoLogo.jpg" style="height:200px; margin-left:-15px;" class="img-responsive center-block" />-->
              <!--</div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="partners.filoT" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="partners.filo" /></p>

              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>
          <div class="row">

              <div class="col-md-2 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">

              </div>
              <div class="col-md-4 col-sm-4 mb-4">
                <h3><fmt:message key="partners.martinelliGroupT" /></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="partners.martinelliGroup" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4">

              </div>

        </div>-->



      </div>
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>