<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>
  <title>EcoRent</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

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

  <script>

      $(function(){
          $("#footer").load("footer.html");
      });

      function submitForm(value) {

          document.myForm.Command.value = value;
          document.myForm.submit();
      }


   </script>

   <style>
    .spacer {
       margin-top: 60px; /* define margin as you see fit */
    }

    .spacer2 {
        margin-top: 15px; /* define margin as you see fit */
    }
   </style>
</head>
<body>
  <div id="wrap">
    <!-- Menu -->
    <jsp:include page='navigation.jsp'>
      <jsp:param name="param" value="test"/>
    </jsp:include>

    <div class="container">

      <div class="row spacer"></div>

      <FORM name="myForm" method="post" action="/ecorent/Manager">
        <INPUT type="hidden" name="Command" value="runQuery">
        <div class="container">

          <div class="row spacer"></div>

          <div class="row">
              <div class="col-md-2">
                <label>Messaggio:</label>
              </div>
              <div class="col-md-12">
                <label><c:out value="${result}"/></label>
              </div>
          </div>
           <div class="row">
              <div class="col-md-2">
                <label>Query:</label>
              </div>
              <div class="col-md-12">

                <TEXTAREA rows="5" cols="50" name="query"></TEXTAREA>
              </div>
           </div>

           <div class="row">
              <div class="col-md-4">
                <button type="submit" class="btn btn-info" onclick="javascript:submitForm('runQuery')">
                    <span class="glyphicon glyphicon-search"></span> Run Query
                </button>
              </div>
              <div class="col-md-4">
                <button type="submit" class="btn btn-info" onclick="javascript:submitForm('main')">
                    <span class="glyphicon glyphicon-search"></span> Main
                </button>
              </div>
           </div>

        </div>
      </FORM>
    </div>
    <div id="push"></div>
 </div> <!-- end wrap -->

 <!-- Footer -->
 <div id="footer" />
 <!-- Footer -->

</BODY>
</HTML>
