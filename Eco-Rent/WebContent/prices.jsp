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
    <title>Prices - Eco Rent</title>

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
    <script>
        function submitForm(param) {

          document.myForm.Command.value = param;
          document.myForm.submit();

        }
    </script>


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
        <jsp:param name="param" value="listObjects"/>
      </jsp:include>

      <FORM name="myForm" method="post" action="/ecorent/Controller">
         <INPUT type="hidden" name="Command" value="">
         <INPUT type="hidden" name="key" value="<c:out value="${oggetto.key}"/>">
         <div class="container">

             <div class="row spacer"></div>

             <div class="row">
                <div class="col-md-4">
                  <h2 class="my-4"><fmt:message key="price.title" /></h2>
                </div>
             </div>
             <div class="row">
                <div class="col-md-4">
                  <h5><fmt:message key="price.info" /></h5>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-2">
                  <label><fmt:message key="price.name" /></label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.nome}"/></label>
                </div>
                <div class="col-xs-2">
                  <label><fmt:message key="price.brand" />Marca:</label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.marca}"/></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-2">
                  <label><fmt:message key="price.type" /></label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.tipo}"/></label>
                </div>
                <div class="col-xs-2">
                  <label><fmt:message key="price.desc" /></label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.descrizione}"/></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-2">
                  <label><fmt:message key="price.spec" /></label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.specifiche}"/></label>
                </div>
                <div class="col-xs-2">
                  <label><fmt:message key="price.others" /></label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.varie}"/></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-2">
                  <label><fmt:message key="price.year" />Anno:</label>
                </div>
                <div class="col-xs-4">
                  <label><c:out value="${oggetto.anno}"/></label>
                </div>
             </div>

             <div class="row">
                <div class="col-md-4">
                  <h5><fmt:message key="price.weekPrice" /></h5>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.1day" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g1}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.2days" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g2}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.3days" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g3}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.4days" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g4}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.5days" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g5}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.6days" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g6}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.1week" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.g7}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.moreDays" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.more_g}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-md-4">
                  <h5><fmt:message key="price.monthPrice" /></h5>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.1month" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m1}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.2months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m2}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.3months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m3}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.4months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m4}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.5months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m5}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.6months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m6}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.7months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m7}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.8months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m8}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.9months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m9}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.10months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m10}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.11months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m11}" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:message key="price.12months" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.m12}" /></label>
                </div>
             </div>
             <div class="row">
                <div class="col-xs-3">
                  <label><fmt:message key="price.moreMonths" /></label>
                </div>
                <div class="col-xs-3">
                  <label><fmt:formatNumber type="number" pattern="###.## CHF" value="${prezzi.more_m}" /></label>
                </div>
             </div>

             <div class="row top-buffer"></div>

             <div class="row">

               <div class="col-xs-6 col-md-2">
                 <button type="submit" class="btn btn-info" onclick="javascript:submitForm('viewList')">
                    <span class="glyphicon glyphicon-search"></span> <fmt:message key="price.listS.btn" />
                 </button>
               </div>
               <div class="col-xs-6 col-md-2">
                 <button type="button" class="btn btn-info" name="command" onclick="javascript:submitForm('viewObject')">
                  <span class="glyphicon glyphicon-search"></span><fmt:message key="price.scooter.btn" />
                 </button>
               </div>

             </div>

      </div><!-- end container -->
      <div id="push"></div>
      </FORM>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>


  </body>
</html>