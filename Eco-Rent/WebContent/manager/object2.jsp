<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>
  <meta name="Description" content="Eco-Rent">
  <meta name="Keywords" content="bici elettriche, biciclette, ecologia, kibe, rent, affitto">
  <meta name="Revisit-after" content="14 days">
  <meta name="Robots" content="all">
  <meta name="category" content="shop">
  <meta name="author" content="Carlo Martinenghi">
  <title>EcoRent</title>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

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

  <style>
    body {
      padding-top: 70px;
    }

    @media (min-width: 992px) {
      body {
        padding-top: 56px;
      }
    }

    .header-font {
      font-family: "Josefin Slab","Helvetica Neue",Helvetica,Arial,sans-serif;
      color: #fd1506;
    }
    .fa-facebook{
        color:#3b5998;
    }
    .fa-linkedin{
        color:#0077B5;
    }
    .fa-twitter{
        color:#4099FF;
    }
    .fa-google{
        color:#d34836;
    }
    .bg-primary {
     background-color: #000 !important;
    }

    .bg-circle
    {
      display: inline-block;
      width: 60px;
      height: 60px;
      padding: 14px 4px;
      color: #ececec;
      text-align: center;
      border-radius: 50%;
    }

    .bg-circle-outline
    {
      width: 50px;
      height: 50px;
      color:smoke;
      padding: 8px 2px;
      border: 2px solid;
      border-color: smoke;
      border-radius: 50%;
    }


    .bg-circle a, a:hover, .media a:focus
    {
      text-decoration: none !important;
      outline: none;
      color: #ececec;
    }
    .bg-circle-outline a, a:hover, .media a:focus
    {
      text-decoration: none !important;
      outline: none;
      color: #ececec;
    }
    .footer {
      background: #EDEFF1;
      height: auto;
      padding-bottom: 30px;
      position: relative;
      width: 100%;
      border-bottom: 1px solid #CCCCCC;
      border-top: 1px solid #DDDDDD;
    }
    .footer p {
      margin: 0;
    }
    .footer img {
      max-width: 100%;
    }
    .footer h3 {
      border-bottom: 1px solid #BAC1C8;
      color: #54697E;
      font-size: 18px;
      font-weight: 600;
      line-height: 27px;
      padding: 40px 0 10px;
      text-transform: uppercase;
    }
    .footer ul {
      font-size: 13px;
      list-style-type: none;
      margin-left: 0;
      padding-left: 0;
      margin-top: 15px;
      color: #7F8C8D;
    }
    .footer ul li a {
      padding: 0 0 5px 0;
      display: block;
    }
    .footer a {
      color: #78828D
    }

    .verticalhorizontal {
          display: table-cell;
          height: 400px;
          text-align: center;
          width: 565px;
          vertical-align: middle;
          margin: 0;
          padding: 0;
    }

    .spacer {
        margin-top: 40px; /* define margin as you see fit */
    }

    .spacer2 {
        margin-top: 15px; /* define margin as you see fit */
    }

  </style>

  <script>

    $(function(){
        $("#footer").load("footer.html");
    });

    function submitForm(param) {

      document.myForm.Command.value = param;
      document.myForm.submit();

    }

    function viewPhotoWithElem(link, num, elemId){

        var d = document.getElementById(elemId);
        d.className += " selected";
        document.getElementById('divFoto2').style.display = "block";
        document.getElementById('Photo2').src = link;
        //document.all.descPhoto2.innerText = descrizione[num];
        document.getElementById('realPhoto2').href = link + "&type=foto";

    }

  </script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

  <div id="wrap">
    <!-- Menu -->
    <jsp:include page='navigation.jsp'>
      <jsp:param name="param" value="test"/>
    </jsp:include>

    <!-- Begin page content -->
    <div class="container">

      <div class="row spacer"></div>

      <FORM name="myForm" method="post" action="/ecorent/Manager">
        <INPUT type="hidden" name="Command" value="">
        <INPUT type="hidden" name="key" value="<c:out value="${Oggetto.key}"/>">
      </FORM>

      <div class="row">
        <div class="col-md-6">
          <!-- Portfolio Item Heading -->
          <h1 class="my-4"><c:out value="${Oggetto.nome}"/></h1>
        </div>
        <div class="col-md-6">
          <h6 class="my-4"><c:out value="${Oggetto.descrizione}"/></h6>
        </div>
      </div>

      <!-- Portfolio Item Row -->
      <div class="row">

        <div class="col-md-6" style="border: black solid 0px; margin: 0;padding: 2;">
          <div id="divFoto2" class="verticalhorizontal">
             <A href='/ecorent/view?fk_ogg=<c:out value="${Oggetto.key}"/>&num=1&' target='_blank' name='realPhoto2' id='realPhoto2' >
               <IMG id="Photo2" src="/ecorent/view?fk_ogg=<c:out value="${Oggetto.key}"/>&num=1&" width="100%" height="100%"
                style="border: gray solid 1px">
             </A>
          </div>
        </div>

        <div class="col-md-3">

          <h5 class="my-3">Dettagli oggetto</h5>
          <ul>
            <li>Tipo: <c:out value="${Oggetto.tipo}"/></li>
            <li>Nome: <c:out value="${Oggetto.nome}"/></li>
            <li>Marca: <c:out value="${Oggetto.marca}"/></li>
            <li>Specifiche: <c:out value="${Oggetto.specifiche}"/></li>
            <li>Varie : <c:out value="${Oggetto.varie}"/></li>
            <li>Anno: <c:out value="${Oggetto.anno}"/></li>

          </ul>
        </div>

      </div>
      <!-- /.row -->

      <!-- Related Projects Row -->
      <h3 class="my-4"><SPAN id="descPhoto2"><c:out value="${Oggetto.descrizione}"/></SPAN></h3>

      <div class="row">


<c:if test="${not empty foto.listaFoto}">
  <c:forEach var="row" items="${foto.listaFoto}" varStatus="loopCounter">
      <c:set var="url" value="/ecorent/view?fk_ogg=${row.fk_oggetto}&num=${row.numero}" scope="request" />
      <c:set var="link" value="/ecorent/view?fk_ogg=${row.fk_oggetto}&num=${row.numero}" scope="request" />
      <c:set var="strID" value="carousel-thumb-${loopCounter}" scope="request" />


        <div class="col-md-2 col-sm-4 mb-4">
          <A id="carousel-thumb-<c:out value="${loopCounter}"/>" href='javascript:viewPhotoWithElem("<c:out value="${url}"/>", <c:out value="${row.numero}"/>, "<c:out value="${strID}"/>")'>
               <IMG class="img-fluid" src="<c:out value="${url}"/>" width="160" height="120" style="border: gray solid 1px" alt="<c:out value="${row.descrizione}"/>">
          </A>
        </div>
  </c:forEach>
</c:if>
      </div>
      <!-- /.row -->

      <div class="row">

        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-info" name="listaO" onclick="javascript:submitForm('main')">
            <span class="glyphicon glyphicon-search"></span>Ritorna home
          </button>
        </div>
        <div class="col-md-2">
          <button type="submit" class="btn btn-info" onclick="javascript:submitForm('listObject')">
              <span class="glyphicon glyphicon-search"></span> Lista oggetti
          </button>
        </div>
        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-info" name="gestioneF" onclick="javascript:submitForm('photoManagement')">
            <span class="glyphicon glyphicon-search"></span>Gestione foto
          </button>
        </div>
        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-info" name="gestioneF" onclick="javascript:submitForm('priceManagement')">
            <span class="glyphicon glyphicon-search"></span>Gestione prezzi
          </button>
        </div>
        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-info" name="modificaO" onclick="javascript:submitForm('viewUpdateObject')">
            <span class="glyphicon glyphicon-search"></span>Modifica oggetto
          </button>
        </div>
        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-info" name="objectR" onclick="javascript:submitForm('objectReservations')">
            <span class="glyphicon glyphicon-search"></span>Riservazioni
          </button>
        </div>
        <div class="col-md-2 col-sm-4 mb-4">
          <button type="button" class="btn btn-danger" name="eliminaO" onclick="javascript:submitForm('deleteObject')">
            <span class="glyphicon glyphicon-search"></span>Elimina oggetto
          </button>
        </div>

    </div>
    <!-- /.container -->
  </div>
  <div id="push"></div>
 </div> <!-- end wrap -->

 <!-- Footer -->
 <div id="footer" />
 <!-- Footer -->

</body>
</html>
