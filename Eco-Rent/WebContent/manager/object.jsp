<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="myFunc" uri="/WEB-INF/htmlUtility.tld" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${param.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="${param.lang}">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Eco-Rent - Scooter</title>

    <!-- Custom fonts for this template-->
    <link href="./css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./css/sb-admin-2.min.css" rel="stylesheet">

    <script language="JavaScript">

      function submitFormMenu(value) {
        document.myFormMenu.Command.value = value;
        myFormMenu.submit();
      }


      function submitForm(param) {

         document.myForm.Command.value = param;
         document.myForm.submit();

       }

      function submitMyForm(command) {

          document.myForm.Command.value = command;
          myForm.submit();

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

    <style>


      .wrapper {
        display: grid;
        grid-template-columns: 200px 60px 60px 60px 60px 60px;
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

</head>

<body id="page-top">

    <FORM name="myFormMenu" method="post" action="/ecorent/Manager">
        <INPUT type="hidden" name="Command" value="">
    </FORM>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="javascript:submitFormMenu('main')">
                <div class="sidebar-brand-text mx-3">Eco-Rent Admin</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="index.html">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Aggiungi Scooter</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Interface
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Scooters</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Comandi scooter:</h6>
                        <a class="collapse-item" href="javascript:submitFormMenu('listObject')">Lista scooters</a>
                        <a class="collapse-item" href="javascript:submitFormMenu('viewInsertObject')">Aggiungi scooter</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utenti</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Comandi utenti:</h6>
                        <a class="collapse-item" href="javascript:submitFormMenu('userList')">Lista Utenti</a>
                        <a class="collapse-item" href="javascript:submitFormMenu('newUser')">Aggiungi Utente</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseManagers"
                    aria-expanded="true" aria-controls="collapseManagers">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Managers</span>
                </a>
                <div id="collapseManagers" class="collapse" aria-labelledby="headingManagers"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Comandi Manager:</h6>
                        <a class="collapse-item" href="javascript:submitFormMenu('listManager')">Lista Manager</a>
                        <a class="collapse-item" href="javascript:submitFormMenu('viewInsertManager')">Aggiungi Manager</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseRiservazioni"
                    aria-expanded="true" aria-controls="collapseRiservazioni">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Riservazioni</span>
                </a>
                <div id="collapseRiservazioni" class="collapse" aria-labelledby="headingRiservazioni"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Comandi Riservazioni:</h6>
                        <a class="collapse-item" href="javascript:submitFormMenu('reservations')">Lista Riservazioni</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>



        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h2 class="h3 mb-0 text-gray-800">Gestione Scooter</h2>
                    </div>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Alerts Inserire le prenotazioni in scadenza -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                <!-- Counter - Alerts -->
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - Messages -->
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                <!-- Counter - Messages -->
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><c:out value='${sessionScope.manager.nome}'/></span>
                                <img class="img-profile rounded-circle"
                                    src="./pictures/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a>
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <div class="container-fluid">

                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Scooter <c:out value="${Oggetto.nome}"/></h6>
                        </div>
                        <div class="card-body">
                            <FORM name="myForm" method="post" action="/ecorent/Manager">
                              <INPUT type="hidden" name="Command" value="">
                              <INPUT type="hidden" name="key" value="<c:out value="${Oggetto.key}"/>">
                              <INPUT type="hidden" name="fk_tabella" value="<c:out value="${Oggetto.key}"/>">
                              <INPUT type="hidden" name="tabella" value="oggetti">
                            </FORM>

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

                                <h5 class="my-3 text-gray-800">Dettagli scooter</h5>
                                <ul>
                                  <li>Tipo: <c:out value="${Oggetto.tipo}"/></li>
                                  <li>Nome: <c:out value="${Oggetto.nome}"/></li>
                                  <li>Marca: <c:out value="${Oggetto.marca}"/></li>
                                  <li>Specifiche: <c:out value="${Oggetto.specifiche}"/></li>
                                  <li>Varie : <c:out value="${Oggetto.varie}"/></li>
                                  <li>Anno: <c:out value="${Oggetto.anno}"/></li>

                                </ul>
                                <h5 class="my-3 text-gray-800">Guadagni scooter</h5>
                                <h5 class="my-3"><c:out value="${Oggetto.earning}"/></h5>
                                <h5 class="my-3 text-gray-800">Stato scooter</h5>
                                <c:choose>
                                  <c:when test="${Oggetto.funzionante}">
                                    <h5 class="my-3 text-success">Funzionante</h5>
                                  </c:when>
                                  <c:otherwise>
                                    <h5 class="my-3 text-warning" >Non funzionante</h5>
                                  </c:otherwise>
                                </c:choose>

                              </div>

                              <div class="col-md-3">

                                <c:choose>
                                  <c:when test="${OggettoVenduto ne null}">
                                    <h5 class="my-3 text-warning">VENDUTO</h5>
                                    <h5 class="my-3 text-warning">Dettagli vendita</h5>
                                    <ul>
                                      <li>data_vendita: <fmt:formatDate pattern = "dd-MM-yyyy" value = "${OggettoVenduto.data_vendita}" /></li>
                                      <li>metodo_pagamento: <c:out value="${OggettoVenduto.metodo_pagamento}"/></li>
                                      <li>fattura_num: <c:out value="${OggettoVenduto.fattura_num}"/></li>
                                      <li>fk_utente: <c:out value="${OggettoVenduto.fk_utente}"/></li>
                                      <li>prezzo : <c:out value="${OggettoVenduto.prezzo}"/> CHF</li>
                                    </ul>
                                  </c:when>
                                  <c:otherwise>
                                    <h5 class="my-3 text-success" >Flotta Eco-Rent</h5>
                                  </c:otherwise>
                                </c:choose>
                              </div>

                            </div>
                            <!-- /.row -->

                            <div class="row">
                              <h3 class="col-md-6"><SPAN id="descPhoto2"><c:out value="${Oggetto.descrizione}"/></SPAN></h3>




                              <div class="col-md-6 my-3">

                                <div class="wrapper">
                                  <c:choose>
                                    <c:when test="${not empty Documenti}">

                                      <div>
                                        <h5 class="my-3 text-gray-800">Documenti: </h5>
                                      </div>

                                      <c:forEach var="row" items="${Documenti}" varStatus="loopCounter">
                                        <div>
                                          <div class="row"><c:out value="${row.tipo}"/></div>
                                          <div class="row">
                                             <A href='/ecorent/viewPdf?key=<c:out value="${row.key}"/>&' target='_blank'>
                                               <IMG id="pdf" src="pictures/pdf-icon.jpg" width="32" height="32">
                                             </A>
                                          </div>
                                        </div>
                                      </c:forEach>

                                    </c:when>
                                    <c:otherwise>
                                      <h5 class="my-3 text-gray-800">Nessun documento associato </h5>
                                    </c:otherwise>
                                  </c:choose>
                                </div>


                              </div>
                            </div>

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

                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <div class="col-lg-12">

              <div class="card shadow mb-4">
                  <div class="card-header py-3">
                      <h6 class="m-0 font-weight-bold text-primary">Comandi:</h6>
                  </div>
                  <div class="card-body">
                      <div class="my-2"></div>
                      <a href="javascript:submitFormMenu('listObject')" class="btn btn-success btn-icon-split">
                          <span class="text">Lista Scooters</span>
                      </a>
                      <a href="javascript:submitForm('photoManagement')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione foto</span>
                      </a>
                      <a href="javascript:submitForm('priceManagement')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione prezzi</span>
                      </a>
                      <a href="javascript:submitForm('viewUpdateObject')" class="btn btn-success btn-icon-split">
                          <span class="text">Modifica dettagli</span>
                      </a>
                      <a href="javascript:submitForm('objectReservations')" class="btn btn-success btn-icon-split">
                          <span class="text">Riservazioni</span>
                      </a>
                      <a href="javascript:submitForm('deleteObject')" class="btn btn-success btn-icon-split">
                          <span class="text">Elimina oggetto</span>
                      </a>
                      <a href="javascript:submitMyForm('listDocs')" class="btn btn-success btn-icon-split">
                          <span class="text">Lista Documenti</span>
                      </a>
                      <div class="my-2"></div>
                  </div>
              </div>

          </div>



            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Eco-Rent 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Logout</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Seleziona "Logout" se vuoi davvero terminare la tua sessione di lavoro.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal" >Annulla</button>
                    <a class="btn btn-primary" href="javascript:submitFormMenu('logout')">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="./js/jquery.min.js"></script>
    <script src="./js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./js/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./js/Chart.min.js"></script>



</body>

</html>