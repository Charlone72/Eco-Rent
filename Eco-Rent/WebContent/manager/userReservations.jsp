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

    <title>Eco-Rent - Lista Riservazioni utente</title>

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


      function submitForm(value, name) {

          document.myForm.Command.value = value;
          document.myForm.tabella.value = 'riservazioni';
          document.myForm.key.value = name;
          document.myForm.fk_tabella.value = name;

          myForm.submit();
       }

       function uploadPdf(value, fk_tabella) {

           document.myForm.Command.value = value;
           document.myForm.fk_tabella.value = fk_tabella;
           document.myForm.tabella.value = 'riservazioni';

           myForm.submit();
       }

       function updateForm(value) {

           //var stato = $('#myModal').data('obj');
           var stato = $("#statoModal").val();
           //alert("stato: " + stato);
           $('#myModal').modal('hide');

           //alert("status: " + status);
           //alert("key: " + document.myForm.key.value);//il valore viene settato all'apertura del dialogo
           //alert("Command: " + value);

           document.myForm.Command.value = value;
           document.myForm.Status.value = stato;
           //document.myForm.fk_oggetto.value = ;il valore viene settato all'apertura del dialogo

           myForm.submit();
       }

       function viewObject(sel){
         document.myForm.key.value = sel;
         document.myForm.Command.value = 'viewObject';
         document.myForm.submit();
       }


       function viewObjectReservations(sel){
           document.myForm.key.value = sel;
           document.myForm.Command.value = 'objectReservations';
           document.myForm.submit();
         }

       function newReservation(sel){
           document.myForm.key.value = sel;
           document.myForm.Command.value = 'newReservation';
           document.myForm.submit();
       }


       $(document).ready(function(){
         jQuery('[data-toggle="tooltip"]').tooltip();
       });


       $(document).on("click", ".open-AddDialog", function () {
            var myKeyId = $(this).data('id');
            //alert(myKeyId);
            var myfkObj = $(this).data('obj');

            $(".modal-body #keyId").val( myKeyId );
            $(".modal-body #fkObj").val( myfkObj );
            document.myForm.key.value = myKeyId;
            document.myForm.fk_oggetto.value = myfkObj;

       });


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
                    <span>Lista Manager</span></a>
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
                        <h2 class="h3 mb-0 text-gray-800"><c:out value="${titolo}"/></h2>
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
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
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
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
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
                            <h6 class="m-0 font-weight-bold text-primary">Riservazioni utente: <c:out value="${Utente.nome}"/> <c:out value="${Utente.cognome}"/> <c:out value="${Utente.email}"/></h6>
                        </div>

                        <div class="card-body">

                            <div class="table-responsive">
                              <FORM name="myForm" method="post" action="/ecorent/Manager">
                                <INPUT type="hidden" name="Command" value="">
                                <INPUT type="hidden" name="key" value="?">
                                <INPUT type="hidden" name="Status" value="">
                                <INPUT type="hidden" name="fk_oggetto" value="">
                                <INPUT type="hidden" name="fk_tabella" value="">
                                <INPUT type="hidden" name="tabella" value="">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                      <tr>
                                        <th><B>stato</B></th>
                                        <th><B>fk_oggetto</B></th>
                                        <th><B>data_inizio</B></th>
                                        <th><B>data_fine</B></th>
                                        <th><B>days-months-price</B></th>
                                        <th><B>daysleft</B></th>
                                        <th><B>prezzo_f</B></th>
                                        <th><B>met. pag.</B></th>
                                        <th><B>fatt. num.</B></th>
                                        <th><B>data_pag.</B></th>
                                        <th><B>comandi</B></th>
                                      </tr>
                                    </thead>
                                    <tfoot>
                                      <tr>
                                        <th><B>stato</B></th>
                                        <th><B>fk_oggetto</B></th>
                                        <th><B>data_inizio</B></th>
                                        <th><B>data_fine</B></th>
                                        <th><B>days-months-price</B></th>
                                        <th><B>daysleft</B></th>
                                        <th><B>prezzo_f</B></th>
                                        <th><B>met. pag.</B></th>
                                        <th><B>fatt. num.</B></th>
                                        <th><B>data_pag.</B></th>
                                        <th><B>comandi</B></th>
                                      </tr>
                                    </tfoot>
                                    <tbody>
                                      <c:forEach var="row" items="${reservations}">
                                        <tr>
                                          <td>
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
                                          </td>
                                          <td><c:out value="${row.fk_oggetto}"/></td>
                                          <td><c:out value="${row.data_inizio}"/></td>
                                          <td><c:out value="${row.data_fine}"/></td>
                                          <td><c:out value="${row.days} - "/><fmt:formatNumber type="number" pattern="###.## - " value="${row.months}" /><fmt:formatNumber type="number" pattern="###.## CHF" value="${row.price}" /></td>
                                          <td><c:out value="${row.daysleft}"/></td>
                                          <td><c:out value="${row.final_price}"/></td>
                                          <td><c:out value="${row.metodo_pagamento}"/></td>
                                          <td><c:out value="${row.fattura_num}"/></td>
                                          <td><c:out value="${row.data_pagamento}"/></td>
                                          <td>
                                            <div class="dropdown">
                                              <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Actions
                                                <span class="caret"></span>
                                              </button>
                                              <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                                <li><a href="javascript:submitForm('viewUpdateReservation', '<c:out value="${row.key}"/>');" class="dropdown-item">Aggiorna</a></li>
                                                <li><a href="#" class="dropdown-item open-AddDialog" data-toggle="modal" data-target="#myModal" data-id="<c:out value="${row.key}"/>" data-obj="<c:out value="${row.fk_oggetto}"/>" >Aggiorna stato</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="javascript:uploadPdf('uploadPdf', '<c:out value="${row.key}"/>');" class="dropdown-item">Aggiungi Doc</a></li>
                                                <li><a href="javascript:submitForm('listDocs', '<c:out value="${row.key}"/>');" class="dropdown-item">Lista Doc</a></li>
                                                <li role="separator" class="divider"></li>
                                                <li><a href="javascript:submitForm('deleteReservation', '<c:out value="${row.key}"/>');" class="dropdown-item">Elimina</a></li>
                                              </ul>
                                            </div>
                                          </td>
                                        </tr>
                                      </c:forEach>
                                    </tbody>
                                </table>
                              </FORM>
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
                  <div class="row">
                      <div class="col-md-12">

                      </div>
                  </div>
                  <div class="card-body">
                      <c:if test="${Oggetto ne null}">
                        <div class="my-2"></div>
                        <a href="javascript:newReservation('<c:out value="${Oggetto.key}"/>')" class="btn btn-success btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="fas fa-check"></i>
                            </span>
                            <span class="text">Nuova Riservazione</span>
                        </a>
                        <a href="javascript:viewObject('<c:out value="${Oggetto.key}"/>')" class="btn btn-success btn-icon-split">
                            <span class="icon text-white-50">
                                <i class="fas fa-check"></i>
                            </span>
                            <span class="text">Dettagli Scooter</span>
                        </a>
                        <div class="my-2"></div>
                      </c:if>
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

    <!-- update status Modal-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">Aggiorna stato alla riservazione</h4>
          </div>
          <div class="modal-body">
            <label>Stato riservazione</label>
            <select name="statoModal" id="statoModal" class="select">
               <option value="1">1 - Ris. pendente</option>
               <option value="10">10 - P. Conf. e N.P.</option>
               <option value="11">11 - P. Conf. e P.P.</option>
               <option value="12">12 - P. Conf. e P.T.</option>
               <option value="20">20 - In uso e N.P.</option>
               <option value="21">21 - In uso e P.P.</option>
               <option value="22">22 - In uso e P.T.</option>
               <option value="30">30 - Ricons. e N.P.</option>
               <option value="31">31 - Ricons. e P.P.</option>
               <option value="32">32 - Ricons. e P.T.</option>
            </select>
            <input type="hidden" name="KeyId" id="keyId" value=""/>
            <input type="hidden" name="fk_oggetto" id="fkObj" value="">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="javascript:updateForm('updateStatusReservation')" >Aggiorna</button>

            <!--  <a href="javascript:updateForm('updateStatusReservation', '1')"><button type="button" class="btn btn-primary" >1</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '10')"><button type="button" class="btn btn-primary" >10</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '11')"><button type="button" class="btn btn-primary" >11</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '12')"><button type="button" class="btn btn-primary" >12</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '20')"><button type="button" class="btn btn-primary" >20</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '21')"><button type="button" class="btn btn-primary" >21</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '22')"><button type="button" class="btn btn-primary" >22</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '30')"><button type="button" class="btn btn-primary" >30</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '31')"><button type="button" class="btn btn-primary" >31</button></a>
            <a href="javascript:updateForm('updateStatusReservation', '32')"><button type="button" class="btn btn-primary" >32</button></a>-->
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


</body>

</html>