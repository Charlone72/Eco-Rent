<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${sessionScope.lang}">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="eco-rent home, rent scooter, noleggio scooter, affitto scooter, scooter elettrico, motorino elettrico, affitto veicoli elettrici">
    <meta name="author" content="eco-rent">
    <title>Home - Eco Rent</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" type="text/css" href="./css/bootstrap.min.css">

    <link rel="stylesheet" type="text/css" href="./css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="./css/bootstrap-year-calendar.min.css">
    <link rel="stylesheet" type="text/css" href="./css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./css/sticky-footer.css" rel="stylesheet">

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">

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

      .spacer2 {
          margin-top: 15px; /* define margin as you see fit */
      }

      body {
        background: #f9f9fb;
      }

      .view-account {
        background: #FFFFFF;
        margin-top: 20px;
      }

      .view-account .pro-label {
        font-size: 13px;
        padding: 4px 5px;
        position: relative;
        top: -5px;
        margin-left: 10px;
        display: inline-block
      }

      .view-account .side-bar {
        padding-bottom: 30px
      }

      .view-account .side-bar .user-info {
        text-align: center;
        margin-bottom: 15px;
        padding: 30px;
        color: #616670;
        border-bottom: 1px solid #f3f3f3
      }

      .view-account .side-bar .user-info .img-profile {
        width: 120px;
        height: 120px;
        margin-bottom: 15px
      }

      .view-account .side-bar .user-info .meta li {
        margin-bottom: 10px
      }

      .view-account .side-bar .user-info .meta li span {
        display: inline-block;
        width: 100px;
        margin-right: 5px;
        text-align: right
      }

      .view-account .side-bar .user-info .meta li a {
        color: #616670
      }

      .view-account .side-bar .user-info .meta li.activity {
        color: #a2a6af
      }

      .view-account .side-bar .side-menu {
        text-align: center
      }

      .view-account .side-bar .side-menu .nav {
        display: inline-block;
        margin: 0 auto
      }

      .view-account .side-bar .side-menu .nav>li {
        font-size: 14px;
        margin-bottom: 0;
        border-bottom: none;
        display: inline-block;
        float: left;
        margin-right: 15px;
        margin-bottom: 15px
      }

      .view-account .side-bar .side-menu .nav>li:last-child {
        margin-right: 0
      }

      .view-account .side-bar .side-menu .nav>li>a {
        display: inline-block;
        color: #9499a3;
        padding: 5px;
        border-bottom: 2px solid transparent
      }

      .view-account .side-bar .side-menu .nav>li>a:hover {
        color: #616670;
        background: none
      }

      .view-account .side-bar .side-menu .nav>li.active a {
        color: #40babd;
        border-bottom: 2px solid #40babd;
        background: none;
        border-right: none
      }

      .theme-2 .view-account .side-bar .side-menu .nav>li.active a {
        color: #6dbd63;
        border-bottom-color: #6dbd63
      }

      .theme-3 .view-account .side-bar .side-menu .nav>li.active a {
        color: #497cb1;
        border-bottom-color: #497cb1
      }

      .theme-4 .view-account .side-bar .side-menu .nav>li.active a {
        color: #ec6952;
        border-bottom-color: #ec6952
      }

      .view-account .side-bar .side-menu .nav>li .icon {
        display: block;
        font-size: 24px;
        margin-bottom: 5px
      }

      .view-account .content-panel {
        padding: 30px
      }

      .view-account .content-panel .title {
        margin-bottom: 15px;
        margin-top: 0;
        font-size: 18px
      }

      .view-account .content-panel .fieldset-title {
        padding-bottom: 15px;
        border-bottom: 1px solid #eaeaf1;
        margin-bottom: 30px;
        color: #616670;
        font-size: 16px
      }

      .view-account .content-panel .avatar .figure img {
        float: right;
        width: 64px
      }

      .view-account .content-panel .content-header-wrapper {
        position: relative;
        margin-bottom: 30px
      }

      .view-account .content-panel .content-header-wrapper .actions {
        position: absolute;
        right: 0;
        top: 0
      }

      .view-account .content-panel .content-utilities {
        position: relative;
        margin-bottom: 30px
      }

      .view-account .content-panel .content-utilities .btn-group {
        margin-right: 5px;
        margin-bottom: 15px
      }

      .view-account .content-panel .content-utilities .fa {
        font-size: 16px;
        margin-right: 0
      }

      .view-account .content-panel .content-utilities .page-nav {
        position: absolute;
        right: 0;
        top: 0
      }

      .view-account .content-panel .content-utilities .page-nav .btn-group {
        margin-bottom: 0
      }

      .view-account .content-panel .content-utilities .page-nav .indicator {
        color: #a2a6af;
        margin-right: 5px;
        display: inline-block
      }

      .view-account .content-panel .mails-wrapper .mail-item {
        position: relative;
        padding: 10px;
        border-bottom: 1px solid #f3f3f3;
        color: #616670;
        overflow: hidden
      }

      .view-account .content-panel .mails-wrapper .mail-item>div {
        float: left
      }

      .view-account .content-panel .mails-wrapper .mail-item .icheck {
        background-color: #fff
      }

      .view-account .content-panel .mails-wrapper .mail-item:hover {
        background: #f9f9fb
      }

      .view-account .content-panel .mails-wrapper .mail-item:nth-child(even) {
        background: #fcfcfd
      }

      .view-account .content-panel .mails-wrapper .mail-item:nth-child(even):hover
        {
        background: #f9f9fb
      }

      .view-account .content-panel .mails-wrapper .mail-item a {
        color: #616670
      }

      .view-account .content-panel .mails-wrapper .mail-item a:hover {
        color: #494d55;
        text-decoration: none
      }

      .view-account .content-panel .mails-wrapper .mail-item .checkbox-container,
        .view-account .content-panel .mails-wrapper .mail-item .star-container
        {
        display: inline-block;
        margin-right: 5px
      }

      .view-account .content-panel .mails-wrapper .mail-item .star-container .fa
        {
        color: #a2a6af;
        font-size: 16px;
        vertical-align: middle
      }

      .view-account .content-panel .mails-wrapper .mail-item .star-container .fa.fa-star
        {
        color: #f2b542
      }

      .view-account .content-panel .mails-wrapper .mail-item .star-container .fa:hover
        {
        color: #868c97
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-to {
        display: inline-block;
        margin-right: 5px;
        min-width: 120px
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject {
        display: inline-block;
        margin-right: 5px
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label
        {
        margin-right: 5px
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label:last-child
        {
        margin-right: 10px
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a,
        .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label a:hover
        {
        color: #fff
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-1
        {
        background: #f77b6b
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-2
        {
        background: #58bbee
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-3
        {
        background: #f8a13f
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-4
        {
        background: #ea5395
      }

      .view-account .content-panel .mails-wrapper .mail-item .mail-subject .label-color-5
        {
        background: #8a40a7
      }

      .view-account .content-panel .mails-wrapper .mail-item .time-container {
        display: inline-block;
        position: absolute;
        right: 10px;
        top: 10px;
        color: #a2a6af;
        text-align: left
      }

      .view-account .content-panel .mails-wrapper .mail-item .time-container .attachment-container
        {
        display: inline-block;
        color: #a2a6af;
        margin-right: 5px
      }

      .view-account .content-panel .mails-wrapper .mail-item .time-container .time
        {
        display: inline-block;
        text-align: right
      }

      .view-account .content-panel .mails-wrapper .mail-item .time-container .time.today
        {
        font-weight: 700;
        color: #494d55
      }

      .drive-wrapper {
        padding: 15px;
        background: #f5f5f5;
        overflow: hidden
      }

      .drive-wrapper .drive-item {
        width: 130px;
        margin-right: 15px;
        display: inline-block;
        float: left
      }

      .drive-wrapper .drive-item:hover {
        box-shadow: 0 1px 5px rgba(0, 0, 0, .1);
        z-index: 1
      }

      .drive-wrapper .drive-item-inner {
        padding: 15px
      }

      .drive-wrapper .drive-item-title {
        margin-bottom: 15px;
        max-width: 100px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
      }

      .drive-wrapper .drive-item-title a {
        color: #494d55
      }

      .drive-wrapper .drive-item-title a:hover {
        color: #40babd
      }

      .theme-2 .drive-wrapper .drive-item-title a:hover {
        color: #6dbd63
      }

      .theme-3 .drive-wrapper .drive-item-title a:hover {
        color: #497cb1
      }

      .theme-4 .drive-wrapper .drive-item-title a:hover {
        color: #ec6952
      }

      .drive-wrapper .drive-item-thumb {
        width: 100px;
        height: 80px;
        margin: 0 auto;
        color: #616670
      }

      .drive-wrapper .drive-item-thumb a {
        -webkit-opacity: .8;
        -moz-opacity: .8;
        opacity: .8
      }

      .drive-wrapper .drive-item-thumb a:hover {
        -webkit-opacity: 1;
        -moz-opacity: 1;
        opacity: 1
      }

      .drive-wrapper .drive-item-thumb .fa {
        display: inline-block;
        font-size: 36px;
        margin: 0 auto;
        margin-top: 20px
      }

      .drive-wrapper .drive-item-footer .utilities {
        margin-bottom: 0
      }

      .drive-wrapper .drive-item-footer .utilities li:last-child {
        padding-right: 0
      }

      .drive-list-view .name {
        width: 60%
      }

      .drive-list-view .name.truncate {
        max-width: 100px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
      }

      .drive-list-view .type {
        width: 15px
      }

      .drive-list-view .date, .drive-list-view .size {
        max-width: 60px;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis
      }

      .drive-list-view a {
        color: #494d55
      }

      .drive-list-view a:hover {
        color: #40babd
      }

      .theme-2 .drive-list-view a:hover {
        color: #6dbd63
      }

      .theme-3 .drive-list-view a:hover {
        color: #497cb1
      }

      .theme-4 .drive-list-view a:hover {
        color: #ec6952
      }

      .drive-list-view td.date, .drive-list-view td.size {
        color: #a2a6af
      }

      @media ( max-width :767px) {
        .view-account .content-panel .title {
          text-align: center
        }
        .view-account .side-bar .user-info {
          padding: 0
        }
        .view-account .side-bar .user-info .img-profile {
          width: 60px;
          height: 60px
        }
        .view-account .side-bar .user-info .meta li {
          margin-bottom: 5px
        }
        .view-account .content-panel .content-header-wrapper .actions {
          position: static;
          margin-bottom: 30px
        }
        .view-account .content-panel {
          padding: 0
        }
        .view-account .content-panel .content-utilities .page-nav {
          position: static;
          margin-bottom: 15px
        }
        .drive-wrapper .drive-item {
          width: 100px;
          margin-right: 5px;
          float: none
        }
        .drive-wrapper .drive-item-thumb {
          width: auto;
          height: 54px
        }
        .drive-wrapper .drive-item-thumb .fa {
          font-size: 24px;
          padding-top: 0
        }
        .view-account .content-panel .avatar .figure img {
          float: none;
          margin-bottom: 15px
        }
        .view-account .file-uploader {
          margin-bottom: 15px
        }
        .view-account .mail-subject {
          max-width: 100px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis
        }
        .view-account .content-panel .mails-wrapper .mail-item .time-container {
          position: static
        }
        .view-account .content-panel .mails-wrapper .mail-item .time-container .time
          {
          width: auto;
          text-align: left
        }
      }

      @media ( min-width :768px) {
        .view-account .side-bar .user-info {
          padding: 0;
          padding-bottom: 15px
        }
        .view-account .mail-subject .subject {
          max-width: 200px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis
        }
      }

      @media ( min-width :992px) {
        .view-account .content-panel {
          border-left: 1px solid #f3f3f7;
          margin-left: 200px
        }
        .view-account .mail-subject .subject {
          max-width: 280px;
          white-space: nowrap;
          overflow: hidden;
          text-overflow: ellipsis
        }
        .view-account .side-bar {
          position: absolute;
          width: 200px;
          min-height: 600px
        }
        .view-account .side-bar .user-info {
          margin-bottom: 0;
          border-bottom: none;
          padding: 30px
        }
        .view-account .side-bar .user-info .img-profile {
          width: 120px;
          height: 120px
        }
        .view-account .side-bar .side-menu {
          text-align: left
        }
        .view-account .side-bar .side-menu .nav {
          display: block
        }
        .view-account .side-bar .side-menu .nav>li {
          display: block;
          float: none;
          font-size: 14px;
          border-bottom: 1px solid #f3f3f7;
          margin-right: 0;
          margin-bottom: 0
        }
        .view-account .side-bar .side-menu .nav>li>a {
          display: block;
          color: #9499a3;
          padding: 10px 15px;
          padding-left: 30px
        }
        .view-account .side-bar .side-menu .nav>li>a:hover {
          background: #f9f9fb
        }
        .view-account .side-bar .side-menu .nav>li.active a {
          background: #f9f9fb;
          border-right: 4px solid #40babd;
          border-bottom: none
        }
        .theme-2 .view-account .side-bar .side-menu .nav>li.active a {
          border-right-color: #6dbd63
        }
        .theme-3 .view-account .side-bar .side-menu .nav>li.active a {
          border-right-color: #497cb1
        }
        .theme-4 .view-account .side-bar .side-menu .nav>li.active a {
          border-right-color: #ec6952
        }
        .view-account .side-bar .side-menu .nav>li .icon {
          font-size: 24px;
          vertical-align: middle;
          text-align: center;
          width: 40px;
          display: inline-block
        }
      }

      .container-fluid {
         padding: 50px;
      }

    </style>

    <script language="JavaScript">

          function submitForm(value, name) {

              document.myReservation.Command.value = value;
              document.myReservation.key.value = name;

              myReservation.submit();
           }

          function signUp() {
            document.Login.Command.value = "createUser";
            document.Login.submit();
          }

          function forgotPassword() {
            document.Login.Command.value = "forgotPassword";
            document.Login.submit();
          }
    </script>

  </head>
  <body>
    <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="myHome"/>
      </jsp:include>

      <div class="container">

        <div class="row spacer"></div>

        <div class="view-account">
            <section class="module">
                <div class="module-inner">
                    <div class="side-bar">
                        <div class="user-info">
                            <ul class="meta list list-unstyled">
                                <li class="name"><c:out value="${utente.nome} "/> <c:out value="${utente.cognome}"/>
                                </li>
                                <li class="email"><a href="#"><c:out value="${utente.email}"/></a></li>
                            </ul>
                        </div>
                    <nav class="side-menu">
                    <ul class="nav">
                      <li <c:out value='${myFunc:isActive(subMenu, "Profilo")}'/> ><a href="/ecorent/Controller?Command=userMain&subMenu=Profilo"><span class="fa fa-user"></span> Profile</a></li>
                      <li <c:out value='${myFunc:isActive(subMenu, "Riservazioni")}'/> ><a href="/ecorent/Controller?Command=userMain&subMenu=Riservazioni"><span class="fa fa-th"></span> Riservazioni</a></li>
                      <li <c:out value='${myFunc:isActive(subMenu, "Messaggi")}'/> ><a href="/ecorent/Controller?Command=userMain&subMenu=Messaggi"><span class="fa fa-envelope"></span> Messaggi</a></li>
                    </ul>
                  </nav>
                    </div>
                    <div class="content-panel">
  <c:if test="${subMenu eq 'Profilo'}">
                        <h2 class="title"><fmt:message key="userMain.subMenuProfile" /></h2>
                        <c:if test="${newMsg1 ne null}"><p><c:out value="${newMsg1}"/></p></c:if>
                        <c:if test="${newMsg2 ne null}"><p><c:out value="${newMsg2}"/></p></c:if>
                        <c:if test="${newMsg3 ne null}"><p><c:out value="${newMsg3}"/></p></c:if>
                        <form class="form-horizontal" name="myForm" action="/ecorent/Controller">
                        <INPUT type="hidden" name="Command" value="editUserOk">
                            <fieldset class="fieldset">
                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label"><fmt:message key="userMain.name" /></label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="nome" type="text" class="form-control" value="<c:out value="${utente.nome}"/>">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-2 col-sm-3 col-xs-12 control-label"><fmt:message key="userMain.firstNname" /></label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="cognome" type="text" class="form-control" value="<c:out value="${utente.cognome}"/>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label">Email</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="email" type="email" class="form-control" value="<c:out value="${utente.email}"/>" readonly>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label"><fmt:message key="userMain.via" /></label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="via" type="via" class="form-control" value="<c:out value="${utente.via}"/>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label"><fmt:message key="userMain.cap" /></label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="cap" type="cap" class="form-control" value="<c:out value="${utente.cap}"/>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label"><fmt:message key="userMain.domicilio" /></label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="domicilio" type="domicilio" class="form-control" value="<c:out value="${utente.domicilio}"/>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-2  col-sm-3 col-xs-12 control-label">Password</label>
                                    <div class="col-md-10 col-sm-9 col-xs-12">
                                        <input name="password" class="form-control" value="<c:out value="${utente.password}"/>"/>
                                        <p class="help-block"><fmt:message key="userMain.updatePsw" /></p>
                                    </div>
                                </div>
                            </fieldset>

                            <hr>
                            <div class="form-group">
                                <div class="col-md-10 col-sm-9 col-xs-12 col-md-push-2 col-sm-push-3 col-xs-push-0">
                                    <input class="btn btn-primary" type="submit" value="Update Profile">
                                </div>
                            </div>
                        </form>
  </c:if>
  <c:if test="${subMenu eq 'Riservazioni'}">
                        <h2 class="title"><fmt:message key="userMain.subMenuReservation" /></h2>

                        <div class="row spacer2"></div>

                        <div class="row">
                          <ul>
                           <li><img src="pictures/pending.png" alt="Prenotazione pendente" height="16" width="16"> <fmt:message key="userMain.legenda.pending" /></li>
                          </ul>
                        </div>
                        <div class="row">
                          <div class="col-xs-4">
                            <ul>
                             <li><img src="pictures/BookingConfirmedNP.png" alt="Prenotazione confermata - Non Pagata" height="16" width="16"> <fmt:message key="userMain.legenda.10" /></li>
                             <li><img src="pictures/BookingConfirmedPP.png" alt="Prenotazione confermata - Pagata Parzialmente" height="16" width="16"> <fmt:message key="userMain.legenda.11" /></li>
                             <li><img src="pictures/BookingConfirmedPT.png" alt="Prenotazione confermata - Pagata Totalmente" height="16" width="16"> <fmt:message key="userMain.legenda.12" /></li>
                            </ul>
                          </div>
                          <div class="col-xs-4">
                            <ul>
                             <li><img src="pictures/ScooterInUseNP.png" alt="Scooter in uso - Non Pagato" height="16" width="16"> <fmt:message key="userMain.legenda.20" /></li>
                             <li><img src="pictures/ScooterInUsePP.png" alt="Scooter in uso - Pagato Parzialmente" height="16" width="16"> <fmt:message key="userMain.legenda.21" /></li>
                             <li><img src="pictures/ScooterInUsePT.png" alt="Scooter in uso - Pagato Totalmente" height="16" width="16"> <fmt:message key="userMain.legenda.22" /></li>
                            </ul>
                          </div>
                          <div class="col-xs-4">
                            <ul>
                             <li><img src="pictures/ScooterReturnedNP.png" alt="Scooter riconsegnato - Non Pagato" height="16" width="16"> <fmt:message key="userMain.legenda.30" /></li>
                             <li><img src="pictures/ScooterReturnedPP.png" alt="Scooter riconsegnato - Pagato Parzialmente" height="16" width="16"> <fmt:message key="userMain.legenda.31" /></li>
                             <li><img src="pictures/ScooterReturnedPT.png" alt="Scooter riconsegnato - Pagato Totalmente" height="16" width="16"> <fmt:message key="userMain.legenda.32" /></li>
                            </ul>
                          </div>
                        </div>

                        <div class="row spacer2"></div>

                        <div class="row">
                          <div class="col-xs-1">
                            <B><fmt:message key="userMain.state" /></B>
                          </div>
                          <div class="col-xs-2">
                            <B><fmt:message key="userMain.dateFrom" /></B>
                          </div>
                          <div class="col-xs-2">
                            <B><fmt:message key="userMain.dateTo" /></B>
                          </div>
                          <div class="col-xs-1">
                            <B><fmt:message key="userMain.days" /></B>
                          </div>
                          <div class="col-xs-1">
                            <B><fmt:message key="userMain.months" /></B>
                          </div>
                          <div class="col-xs-2">
                            <B><fmt:message key="userMain.price" /></B>
                          </div>
                          <div class="col-xs-2">
                            <B><fmt:message key="userMain.command" /></B>
                          </div>
                        </div>

                        <div class="row spacer2"></div>

    <c:forEach var="row" items="${riservazioni}">

            <div class="row">
              <div class="col-xs-1">
            <c:if test="${row.stato eq 1}">
                <img alt="" src="pictures/pending.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 10}">
                <img alt="" src="pictures/BookingConfirmedNP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 11}">
                <img alt="" src="pictures/BookingConfirmedPP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 12}">
                <img alt="" src="pictures/BookingConfirmedPT.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 20}">
                <img alt="" src="pictures/ScooterInUseNP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 21}">
                <img alt="" src="pictures/ScooterInUsePP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 22}">
                <img alt="" src="pictures/ScooterInUsePT.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 30}">
                <img alt="" src="pictures/ScooterReturnedNP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 31}">
                <img alt="" src="pictures/ScooterReturnedPP.png" height="16" width="16">
            </c:if>
            <c:if test="${row.stato eq 32}">
                <img alt="" src="pictures/ScooterReturnedPT.png" height="16" width="16">
            </c:if>
              </div>
              <div class="col-xs-2"><c:out value="${row.data_inizio}"/></div>
              <div class="col-xs-2"><c:out value="${row.data_fine}"/></div>
              <div class="col-xs-1"><c:out value="${row.days}"/></div>
              <div class="col-xs-1"><c:out value="${row.months}"/></div>
            <c:choose>
                  <c:when test="${row.stato eq 1}">
                      <div class="col-xs-2"><fmt:formatNumber type="number" pattern="###.## CHF" value="${row.price}" /></div>
                  </c:when>
                  <c:otherwise>
                      <div class="col-xs-2"><fmt:formatNumber type="number" pattern="###.## CHF" value="${row.final_price}" /></div>
                  </c:otherwise>
            </c:choose>
            <c:if test="${row.stato eq 1}">
              <div class="col-xs-2"><a href="javascript:submitForm('deleteReservation', '<c:out value="${row.key}"/>');" ><img alt="" src="pictures/delete.png" height="16" width="16"></a></div>
            </c:if>
            </div>

    </c:forEach>

    <FORM name="myReservation" method="post" action="/ecorent/Controller">
          <INPUT type="hidden" name="Command" value="">
          <INPUT type="hidden" name="key" value="">
          <INPUT type="hidden" name="Status" value="">
    </FORM>
  </c:if>
  <c:if test="${subMenu eq 'Messaggi'}">
                        <h2 class="title"><fmt:message key="userMain.subMenuMsg" /></h2>
  </c:if>
                    </div>
                </div>
            </section>
        </div>
    </div>
    <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

  </body>
</html>




