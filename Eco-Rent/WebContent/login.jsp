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
    <title>Eco Rent - Login</title>

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
          margin-top: 80px; /* define margin as you see fit */
      }

      .top-buffer { margin-top:20px; }
    </style>

    <script language="JavaScript">

      function submitForm(){
        document.Login.submit();
      }

      function signUp(){
        document.Login.Command.value = "viewCreateUser";
        document.Login.submit();
      }

      function forgotPassword(){
          document.Login.Command.value = "viewForgotPassword";
          document.Login.submit();
        }



    </script>

  </head>
  <body>
    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="login"/>
      </jsp:include>


      <div class="container">

        <div class="row spacer"></div>

<c:if test="${msg1 ne null}">
        <div class="row">
          <div class="col-3 mx-auto">
              <div class="text-center">
                <h3><fmt:message key="login.needLogin" /></h3>
                <p><c:out value="${msg1}"/></p>
                <p><c:out value="${msg2}"/></p>
              </div>
          </div>
        </div>
</c:if>
        <div class="row">
          <div class="col-sm-4 col-sm-offset-4">
            <h2><fmt:message key="login.title" /></h2>

            <FORM name="Login" action="/ecorent/Controller" method="post">
              <INPUT type="hidden" name="Command" value="login">

              <div class="form-group">
                <label for="InputEmail1"><fmt:message key="login.email" /></label>
                <input type="email" class="form-control" id="InputEmail1" placeholder="E-mail" name="email" required>
              </div>

              <div class="form-group">
                <label for="InputPassword"><fmt:message key="login.password" /></label>
                <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="password" required>
              </div>

              <div class="form-group">
                <button class="btn btn-lg btn-primary btn-block" type="submit"><fmt:message key="login.signIn" /></button>
              </div>

              <p class="text-center">
                <a class="btn btn-link" href="javascript:forgotPassword()"><fmt:message key="login.forgotPassword" /></a>
              </p>

              <div class="text-center">
                <span class="txt1">
                 <fmt:message key="login.createAccount" />
                </span>
                <a href="javascript:signUp()" class="txt2 hov1">
                 <fmt:message key="login.signUp" />
                </a>
                </div>

            </form>
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




