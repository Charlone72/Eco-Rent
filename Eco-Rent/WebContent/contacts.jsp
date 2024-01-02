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

    <meta name="description" content="eco-rent contacts, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">

    <meta name="author" content="eco-rent">
    <title>EcoRent - contacts</title>

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
      .table-image {
        td, th {
          vertical-align: middle;
        }
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="contacts"/>
      </jsp:include>


      <div class="container">

      <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="contacts.title" /></h3>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p><fmt:message key="contacts.info" /></p>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p><fmt:message key="contacts.address" /></p>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p><fmt:message key="contacts.email" /></p>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <p></p>
              </div>
          </div>
        </div>
        <div class="row">
          <div class="col-12">
          <table class="table table-image">
            <thead>
              <tr>
                <!--<th scope="col"><fmt:message key="contacts.photo" /></th>-->
                <th scope="col"><fmt:message key="contacts.desc" /></th>
              </tr>
            </thead>
            <tbody>
              <!--<tr>
                <td class="w-25">
                  <img src="pictures/lele.png" height="80" width="100" class="img-fluid img-thumbnail" alt="Lele">
                </td>
                <td><fmt:message key="contacts.lele" /></td>
              </tr>
              <tr>
                <td class="w-25">
                  <img src="pictures/charly.jpg" height="80" width="100" class="img-fluid img-thumbnail" alt="Charly">
                </td>
                <td><fmt:message key="contacts.charly" /></td>
              </tr>-->
              <tr>
                <!--<td class="w-25">
                  <img src="pictures/nick2.jpg" height="80" width="100" class="img-fluid img-thumbnail" alt="Sheep">
                </td>-->
                <td><fmt:message key="contacts.jirayu" /></td>
              </tr>
            </tbody>
          </table>
          </div>
        </div>

      </div><!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>
  </body>
</html>