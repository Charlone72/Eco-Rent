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
    <meta name="description" content="eco-rent contacts, rent scooter, noleggio scooter, affitto scooter">
    <meta name="author" content="eco-rent">
    <title>Come fare - Eco Rent</title>

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
          margin-top: 50px; /* define margin as you see fit */
      }

      .spacer2 {
          margin-top: 20px; /* define margin as you see fit */
      }
    </style>
  </head>
  <body>
    <div id="wrap">
      <!-- Menu -->
    <jsp:include page='navigation.jsp'>
      <jsp:param name="param" value="how"/>
    </jsp:include>

      <div class="container">

        <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="howToDo.title1a" /></h3>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-8 col-sm-8 mb-8">
                <video width="780" controls>
                  <source src="video/createUserPart1.mp4" type="video/mp4">
                  "Your browser does not support HTML5 video.
                </video>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="howToDo.title1b" /></h3>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-8 col-sm-8 mb-8">
                <video width="780" controls>
                  <source src="video/createUserPart2.mp4" type="video/mp4">
                  "Your browser does not support HTML5 video.
                </video>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="howToDo.title1c" /></h3>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-8 col-sm-8 mb-8">
                <video width="780" controls>
                  <source src="video/createUserPart3.mp4" type="video/mp4">
                  "Your browser does not support HTML5 video.
                </video>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo1a.png" target='_blank'><img src="pictures/howToDo1a.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step1aTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step1a" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo1b.png" target='_blank'><img src="pictures/howToDo1b.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step1bTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step1b" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo1c.png" target='_blank'><img src="pictures/howToDo1c.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step1cTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step1c" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h2><fmt:message key="howToDo.title2" /></h2>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo2a.png" target='_blank'><img src="pictures/howToDo2a.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step2aTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step2a" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo2b.png" target='_blank'><img src="pictures/howToDo2b.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step2bTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step2b" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo2c1.png" target='_blank'><img src="pictures/howToDo2c1.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step2c1Title"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step2c1" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo2c2.png" target='_blank'><img src="pictures/howToDo2c2.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step2c2Title"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step2c2" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row spacer"></div>

        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h2><fmt:message key="howToDo.title3" /></h2>
              </div>
          </div>
        </div>

        <div class="row spacer2"></div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3a.png" target='_blank'><img src="pictures/howToDo3a.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3aTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3a" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3b.png" target='_blank'><img src="pictures/howToDo3b.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3bTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3b" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3c.png" target='_blank'><img src="pictures/howToDo3c.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3cTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3c" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3d.png" target='_blank'><img src="pictures/howToDo3d.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3dTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3d" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3e.png" target='_blank'><img src="pictures/howToDo3e.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3eTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3e" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3f.png" target='_blank'><img src="pictures/howToDo3f.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3fTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3f" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3g.png" target='_blank'><img src="pictures/howToDo3g.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3gTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3g" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3h.png" target='_blank'><img src="pictures/howToDo3h.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3hTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3h" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

        <div class="row">
              <div class="col-md-2 col-sm-4 mb-4"></div>
              <div class="col-md-4 col-sm-4 mb-4">
                <a href="pictures/howToDo3i.png" target='_blank'><img src="pictures/howToDo3i.png" style="height:200px;" class="img-responsive center-block" /></a>
              </div>
              <div class="col-md-4 col-sm-4 mb-4" class="center-block">
                <h3><fmt:message key="howToDo.step3iTitle"/></h3>
                <p style="font-size:12px; color:#03225C;"><fmt:message key="howToDo.step3i" /></p>
              </div>
              <div class="col-md-2 col-sm-4 mb-4"></div>
        </div>

      </div><!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>
  </body>
</html>