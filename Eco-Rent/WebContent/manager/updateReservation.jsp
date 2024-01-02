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

    <title>Eco-Rent - update Reservation</title>

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


      function objectReservations(sel){
          document.myForm.key.value = sel;
          document.myForm.Command.value = 'objectReservations';
          document.myForm.submit();
      }

      function submitForm(value) {

          document.myForm.Command.value = value;
          document.myForm.submit();
      }

      function viewObject(value) {

          document.myForm.Command.value = 'viewObject';
          document.myForm.key.value = value;
          document.myForm.submit();
      }

      function submitDoc(value, fk_tabella) {

        document.myForm.Command.value = value;
        document.myForm.fk_tabella.value = fk_tabella;
        document.myForm.tabella.value = 'riservazioni';

        myForm.submit();
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
                    <span>Aggiorna Riservazione</span></a>
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
                        <h2 class="h3 mb-0 text-gray-800">Aggionra Riservazione</h2>
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
                            <h6 class="m-0 font-weight-bold text-primary">Riservazione - Scooter: <c:out value="${Oggetto.nome}" /></h6>
                        </div>
                        <div class="card-body">

                            <FORM name="myForm" method="post" action="/ecorent/Manager">
                              <INPUT type="hidden" name="Command" value="">
                              <INPUT type="hidden" name="tabella" value="">
                              <INPUT type="hidden" name="fk_tabella" value="">

                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>key</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="key" name="key" value="<c:out value="${Riservazione.key}" />" readonly/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>fk_ogg:</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="fk_oggetto" name="fk_oggetto" value="<c:out value="${Riservazione.fk_oggetto}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>fk_usr:</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="fk_utente" name="fk_utente" value="<c:out value="${Riservazione.fk_utente}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>stato:</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <select name="stato" class="select">
                                         <option value="1" <c:out value='${myFunc:isSelected(Riservazione.stato, 1)}'/>>1 - Ris. pendente</option>
                                         <option value="10" <c:out value='${myFunc:isSelected(Riservazione.stato, 10)}'/>>10 - P. Conf. e N.P.</option>
                                         <option value="11" <c:out value='${myFunc:isSelected(Riservazione.stato, 11)}'/>>11 - P. Conf. e P.P.</option>
                                         <option value="12" <c:out value='${myFunc:isSelected(Riservazione.stato, 12)}'/>>12 - P. Conf. e P.T.</option>
                                         <option value="20" <c:out value='${myFunc:isSelected(Riservazione.stato, 20)}'/>>20 - In uso e N.P.</option>
                                         <option value="21" <c:out value='${myFunc:isSelected(Riservazione.stato, 21)}'/>>21 - In uso e P.P.</option>
                                         <option value="22" <c:out value='${myFunc:isSelected(Riservazione.stato, 22)}'/>>22 - In uso e P.T.</option>
                                         <option value="30" <c:out value='${myFunc:isSelected(Riservazione.stato, 30)}'/>>30 - Ricons. e N.P.</option>
                                         <option value="31" <c:out value='${myFunc:isSelected(Riservazione.stato, 31)}'/>>31 - Ricons. e P.P.</option>
                                         <option value="32" <c:out value='${myFunc:isSelected(Riservazione.stato, 32)}'/>>32 - Ricons. e P.T.</option>
                                      </select>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>data_inizio</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <!-- <input type="text" class="text" id="data_inizio" name="data_inizio" value="<c:out value="${Riservazione.data_inizio}"/>"/> -->
                                      <input id="datepickerDI" width="276" name='data_inizio' data-date-format="dd-mm-yyyy"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>data_fine</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input id="datepickerDF" width="276" name='data_fine' data-date-format="dd-mm-yyyy"/>
                                      <!-- <input type="text" class="text" id="data_fine" name="data_fine" value="<c:out value="${Riservazione.data_fine}"/>"/>-->
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>prezzo_finale</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="prezzo_finale" name="prezzo_finale" value="<c:out value="${Riservazione.final_price}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>metodo_pagamento</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="metodo_pagamento" name="metodo_pagamento" value="<c:out value="${Riservazione.metodo_pagamento}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>fattura_num</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="fattura_num" name="fattura_num" value="<c:out value="${Riservazione.fattura_num}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>da_km</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="da_km" name="da_km" value="<c:out value="${Riservazione.da_km}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>a_km</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="a_km" name="a_km" value="<c:out value="${Riservazione.a_km}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>procurato</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="procurato" name="procurato" value="<c:out value="${Riservazione.procurato}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>note</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="note" name="note" value="<c:out value="${Riservazione.note}"/>"/>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-6 col-sm-4">
                                      <label>data_pagamento</label>
                                    </div>
                                    <div class="col-6 col-sm-4">
                                      <input type="text" class="text" id="data_fine" name="data_pagamento" value="<c:out value="${Riservazione.data_pagamento}"/>"/>
                                    </div>
                                 </div>


                                 <div class="row">

                                 </div>

                                 <div class="row">
                                    <div class="col-md-2">
                                      <button class="btn btn-success" onclick="javascript:submitForm('updateReservation')">
                                          Update
                                      </button>
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
                      <a href="javascript:submitFormMenu('listManager')" class="btn btn-success btn-icon-split">
                          <span class="text">Lista Managers</span>
                      </a>
                      <a href="javascript:viewObject('<c:out value="${Riservazione.fk_oggetto}"/>')" class="btn btn-success btn-icon-split">
                          <span class="text">Gestione Oggetto</span>
                      </a>
                      <a href="javascript:objectReservations('<c:out value="${Riservazione.fk_oggetto}"/>')" class="btn btn-success btn-icon-split">
                          <span class="text">Lista Riservazioni Oggetto</span>
                      </a>
                      <a href="javascript:submitForm('reservations')" class="btn btn-success btn-icon-split">
                          <span class="text">Lista Riservazioni</span>
                      </a>
                      <a href="javascript:submitDoc('uploadPdf', '<c:out value="${Riservazione.key}" />');" class="btn btn-success btn-icon-split">
                        <span class="text">Aggiungi Doc</span>
                      </a>
                      <a href="javascript:submitDoc('listDocs', '<c:out value="${Riservazione.key}" />');" class="btn btn-success btn-icon-split">
                        <span class="text">Lista Doc</span>
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
        <c:when test="${Riservazione ne null}">

          var dateI = '<fmt:formatDate pattern = "dd-MM-yyyy" value = "${Riservazione.data_inizio}" />';
          var dateF = '<fmt:formatDate pattern = "dd-MM-yyyy" value = "${Riservazione.data_fine}" />';
        </c:when>
        <c:otherwise>
          var dateI = new Date();
          var dateF = new Date();
        </c:otherwise>
      </c:choose>

      $(function () {
        $("#datepickerDI").datepicker({
              autoclose: true,
              todayHighlight: true
        }).datepicker('update', dateI);

        $("#datepickerDF").datepicker({
            autoclose: true,
            todayHighlight: true
        }).datepicker('update', dateF);
      });

    </script>


</body>

</html>