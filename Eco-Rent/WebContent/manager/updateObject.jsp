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

    <title>Eco-Rent - aggiorna scooter</title>

    <!-- Custom fonts for this template-->
    <link href="./css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./css/sb-admin-2.min.css" rel="stylesheet">

    <style>
      .glyphicon-calendar
        {
            font-size: 15pt;
        }
        .input-group
        {
            width: 180px;
            margin-top:30px;
        }
    </style>

    <script>


      function submitFormMenu(value) {
        document.myFormMenu.Command.value = value;
        myFormMenu.submit();
      }


      function submitForm(value, name) {

          document.myForm.Command.value = value;
          //document.myForm.Manager.value = name;

          myForm.submit();
      }

      function changeFunc() {

        var selectBox = document.getElementById("selectBox");
        var selectedValue = selectBox.options[selectBox.selectedIndex].value;

        if (selectedValue=="true"){
          document.getElementById("fkc").style.display = "block";
          document.getElementById("datepicker").style.display = "block";
          document.getElementById("mp").style.display = "block";
          document.getElementById("fn").style.display = "block";
          document.getElementById("prezzo").style.display = "block";
          document.getElementById("fkcL").style.display = "block";
          document.getElementById("dvL").style.display = "block";
          document.getElementById("mpL").style.display = "block";
          document.getElementById("fnL").style.display = "block";
          document.getElementById("prezzoL").style.display = "block";
        }else {
          document.getElementById("fkc").style.display = "none";
          document.getElementById("datepicker").style.display = "none";
          document.getElementById("mp").style.display = "none";
          document.getElementById("fn").style.display = "none";
          document.getElementById("prezzo").style.display = "none";
          document.getElementById("fkcL").style.display = "none";
          document.getElementById("dvL").style.display = "none";
          document.getElementById("mpL").style.display = "none";
          document.getElementById("fnL").style.display = "none";
          document.getElementById("prezzoL").style.display = "none";
        }
      }

    </script>



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
                    <span>Aggiorna scooter</span></a>
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
                        <h2 class="h3 mb-0 text-gray-800">Aggiorna Dettagli</h2>
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
                            <h6 class="m-0 font-weight-bold text-primary">Scooter <c:out value="${oggetto.nome}"/></h6>
                        </div>
                        <div class="card-body">

                            <FORM name="myForm" action="/ecorent/Manager">
                              <INPUT type="hidden" name="key" value="<c:out value="${oggetto.key}"/>">
                              <INPUT type="hidden" name="Command" value="">

                              <div class="row">
                                  <div class="col-md-4">
                                    <label> </label>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-2">
                                    <label>Nome:</label>
                                  </div>
                                  <div class="col-md-3">
                                    <INPUT type="text" size="32" name="nome" value="<c:out value="${oggetto.nome}"/>">
                                  </div>
                                  <c:choose>
                                    <c:when test="${OggettoVenduto ne null}">
                                      <div id="fkcL" class="col-md-2" style="display: block;">
                                        <label>E-Mail cliente(fk_utente):</label>
                                      </div>
                                      <div id="fkc" class="col-md-3" style="display: block;">
                                        <INPUT type="text" size="45" name="fk_utente" value="<c:out value="${OggettoVenduto.fk_utente}"/>" >
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div id="fkcL" class="col-md-2" style="display: none;">
                                        <label>E-Mail cliente(fk_utente):</label>
                                      </div>
                                      <div id="fkc" class="col-md-3" style="display: none;">
                                      <INPUT type="text" size="45" name="fk_utente">
                                    </div>
                                    </c:otherwise>
                                  </c:choose>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Marca:</label>
                                  </div>
                                  <div class="col-md-3">
                                    <INPUT type="text" name="marca" value="<c:out value="${oggetto.marca}"/>">
                                  </div>
                                  <c:choose>
                                    <c:when test="${OggettoVenduto ne null}">
                                      <div id="dvL" class="col-md-2" style="display: block;">
                                        <label>Data vendita:</label>
                                      </div>
                                      <!--  <div id="datepicker" class="input-group date" data-date-format="yyyy-mm-dd" value="<c:out value="${OggettoVenduto.data_vendita}"/>">
                                        <input class="form-control" name="data_vendita" type="text"  />
                                        <span class="fa fa-calendar input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                      </div>-->
                                      <div id="dv" class="col-md-3">
                                        <input id="datepicker" width="276" name='data_vendita' data-date-format="dd-mm-yyyy"/>
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div id="dvL" class="col-md-2" style="display: none;">
                                        <label>Data vendita:</label>
                                      </div>
                                      <div id="dv" class="col-md-3">
                                        <input id="datepicker" width="276" name='data_vendita' data-date-format="dd-mm-yyyy" style="display: none;"/>
                                      </div>
                                      <!--<div class='input-group date' id='datepicker'  data-date-format="dd-mm-yyyy">
                                          <input type='text' class="form-control" name='data_vendita'/>
                                          <span class="input-group-addon">
                                              <span class="glyphicon glyphicon-calendar"></span>
                                          </span>
                                      </div>
                                      <div id="dv" style="display: none;" class="col-md-3">
                                        <INPUT type="text" size="10" name="data_vendita">
                                      </div>-->
                                    </c:otherwise>
                                  </c:choose>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Tipo:</label>
                                  </div>
                                  <div class="col-md-3">
                                    <INPUT type="text" name="tipo" size="32" value="<c:out value="${oggetto.tipo}"/>">
                                  </div>
                                  <c:choose>
                                    <c:when test="${OggettoVenduto ne null}">
                                      <div id="mpL" class="col-md-2" style="display: block;">
                                        <label>Metodo pagamento:</label>
                                      </div>
                                      <div id="mp" class="col-md-3" style="display: block;">
                                        <INPUT type="text" size="32" name="metodo_pagamento" value="<c:out value="${OggettoVenduto.metodo_pagamento}"/>" >
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div id="mpL" class="col-md-2" style="display: none;">
                                        <label>Metodo pagamento:</label>
                                      </div>
                                      <div id="mp" class="col-md-3" style="display: none;">
                                      <INPUT type="text" size="32" name="metodo_pagamento">
                                    </div>
                                    </c:otherwise>
                                  </c:choose>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Anno:</label>
                                  </div>
                                  <div class="col-md-3">
                                    <INPUT type="text" name="anno" size="4" value="<c:out value="${oggetto.anno}"/>">
                                  </div>
                                  <c:choose>
                                    <c:when test="${OggettoVenduto ne null}">
                                      <div id="fnL" class="col-md-2" style="display: block;">
                                        <label>Fattura numero:</label>
                                      </div>
                                      <div id="fn" class="col-md-3" style="display: block;">
                                        <INPUT type="text" size="32" name="fattura_numero" value="<c:out value="${OggettoVenduto.fattura_num}"/>" >
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div id="fnL" class="col-md-2" style="display: none;">
                                        <label>Fattura numero:</label>
                                      </div>
                                      <div id="fn" style="display: none;" class="col-md-3">
                                        <INPUT type="text" size="32" name="fattura_numero">
                                      </div>
                                    </c:otherwise>
                                  </c:choose>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Funzinante:</label>
                                  </div>
                                  <div class="col-md-3">
                                    <select name="funzionante" class="select">
                                         <option value="true" <c:out value='${myFunc:isSelected(oggetto.funzionante, true)}'/>>Funzionante</option>
                                         <option value="false" <c:out value='${myFunc:isSelected(oggetto.funzionante, false)}'/>>Non funzionante</option>
                                    </select>
                                  </div>
                                  <c:choose>
                                    <c:when test="${OggettoVenduto ne null}">
                                      <div id="prezzoL" class="col-md-2" style="display: block;">
                                        <label>Prezzo:</label>
                                      </div>
                                      <div id="prezzo" class="col-md-3" style="display: block;">
                                        <INPUT type="text" size="32" name="prezzo" value="<c:out value="${OggettoVenduto.prezzo}"/> CHF" >
                                      </div>
                                    </c:when>
                                    <c:otherwise>
                                      <div id="prezzoL" class="col-md-2" style="display: none;">
                                        <label>Prezzo:</label>
                                      </div>
                                      <div id="prezzo" style="display: none;" class="col-md-3">
                                        <INPUT type="text" size="32" name="prezzo">
                                      </div>
                                    </c:otherwise>
                                  </c:choose>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Flotta scooters/venduto:</label>
                                  </div>
                                  <div class="col-md-2">
                                    <select id="selectBox" name="venduto" class="select" onchange="changeFunc();">
                                         <option value="false" <c:out value='${myFunc:isSelected(oggetto.venduto, false)}'/>>Flotta scooters</option>
                                         <option value="true" <c:out value='${myFunc:isSelected(oggetto.venduto, true)}'/>>Venduto</option>
                                    </select>
                                  </div>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Descrizione:</label>
                                  </div>
                                  <div class="col-md-2">
                                    <TEXTAREA rows="3" cols="30" name="descrizione"><c:out value="${oggetto.descrizione}"/></TEXTAREA>
                                  </div>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Specifiche:</label>
                                  </div>
                                  <div class="col-md-2">
                                    <TEXTAREA rows="3" cols="30" name="specifiche"><c:out value="${oggetto.specifiche}"/></TEXTAREA>
                                  </div>
                               </div>
                               <div class="row">
                                  <div class="col-md-2">
                                    <label>Varie:</label>
                                  </div>
                                  <div class="col-md-2">
                                    <TEXTAREA rows="3" cols="30" name="varie"><c:out value="${oggetto.varie}"/></TEXTAREA>
                                  </div>
                               </div>
                               <div class="row">
                                    <div class="col-md-3">
                                      <a href="javascript:submitForm('updateObject')" class="btn btn-success btn-icon-split">
                                          <span class="icon text-white-50">
                                              <i class="fas fa-check"></i>
                                          </span>
                                          <span class="text">Aggiorna Dettagli</span>
                                      </a>
                                    </div>

                               </div>
                            </FORM>

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
                      <a href="javascript:submitForm('viewObject')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione Scooter</span>
                      </a>
                      <a href="javascript:submitForm('photoManagement')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione foto</span>
                      </a>
                      <a href="javascript:submitForm('priceManagement')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione prezzi</span>
                      </a>
                      <a href="javascript:submitForm('objectReservations')" class="btn btn-success btn-icon-split">
                          <span class="text">Riservazioni</span>
                      </a>
                      <a href="javascript:submitForm('deleteObject')" class="btn btn-success btn-icon-split">
                          <span class="text">Elimina oggetto</span>
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

    <script src="./js/bootstrap-datepicker.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./js/Chart.min.js"></script>
    <script src="./js/jquery.dataTables.min.js"></script>
    <script src="./js/dataTables.bootstrap4.js"></script>
    <!-- Page level plugins -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.css" rel="stylesheet" type="text/css" />

    <script>

    <c:choose>
      <c:when test="${OggettoVenduto ne null}">

        var date = '<fmt:formatDate pattern = "dd-MM-yyyy" value = "${OggettoVenduto.data_vendita}" />';
      </c:when>
      <c:otherwise>
        var date = new Date();
      </c:otherwise>
    </c:choose>

      $(function () {
        $("#datepicker").datepicker({
              autoclose: true,
              todayHighlight: true
        }).datepicker('update', date);
      });

    </script>


</body>

</html>