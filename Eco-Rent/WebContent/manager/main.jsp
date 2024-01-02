<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
<fmt:setBundle basename="messages"/>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Eco-Rent - Main</title>

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

      function submitForm(value) {
          document.myFormMenu.Command.value = value;
          myFormMenu.submit();
        }

      function viewObject(sel){
          document.myForm.key.value = sel;
          document.myForm.Command.value = 'viewObject';
          document.myForm.submit();
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
                <a class="nav-link" href="#">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Main</span></a>
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
                        <h2 class="h3 mb-0 text-gray-800">Dashboard</h2>
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
                                        <c:set var="today" value="<%=new java.util.Date()%>" />
                                        <div class="small text-gray-500"><fmt:formatDate pattern = "dd-MM-yyyy" value = "${today}" /></div>
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->


                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                            <a href="javascript:submitForm('objectsFree')">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Scooters disponibili</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${objectsFree.size()}"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>


                        <!-- Earnings (Monthly) Card Example -->

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                            <a href="javascript:submitForm('objectsNotFree')">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                Scooters affittati</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${objectsNotFree.size()}"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </div>
                        </div>


                        <!-- Earnings (Monthly) Card Example -->

                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                            <a href="javascript:submitForm('resPending')">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Scooters affittati in scadenza (5 giorni)
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800"><c:out value="${resPending.size()}"/></div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                                </a>
                            </div>
                        </div>


                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                Richieste di Riservazione</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value="${resRequest.size()}"/></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Content Row -->

                    <div class="row">

                        <!-- Pie Chart -->
                          <div class="col-xl-4 col-lg-5">
                              <div class="card shadow mb-4">
                                  <!-- Card Header - Dropdown -->
                                  <div
                                      class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                      <h6 class="m-0 font-weight-bold text-primary">Numero di scooters per categoria  </h6>
                                      <div class="dropdown no-arrow">
                                          <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                          </a>
                                          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                              aria-labelledby="dropdownMenuLink">
                                              <div class="dropdown-header">Dropdown Header:</div>
                                              <a class="dropdown-item" href="#">Action</a>
                                              <a class="dropdown-item" href="#">Another action</a>
                                              <div class="dropdown-divider"></div>
                                              <a class="dropdown-item" href="#">Something else here</a>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- Card Body -->
                                  <div class="card-body">
                                      <div class="chart-pie pt-4 pb-2">
                                          <canvas id="myPieChart1"></canvas>
                                      </div>
                                      <div class="mt-4 text-center small">
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-primary"></i> Senza patente
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-success"></i> Cat M
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-info"></i> Cat A1
                                          </span>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- Pie Chart -->
                          <div class="col-xl-4 col-lg-5">
                              <div class="card shadow mb-4">
                                  <!-- Card Header - Dropdown -->
                                  <div
                                      class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                      <h6 class="m-0 font-weight-bold text-primary"><a href="javascript:submitForm('earningByCategory')">Guadagni per categoria</a>  </h6>
                                      <div class="dropdown no-arrow">
                                          <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                          </a>
                                          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                              aria-labelledby="dropdownMenuLink">
                                              <div class="dropdown-header">Dropdown Header:</div>
                                              <a class="dropdown-item" href="#">Action</a>
                                              <a class="dropdown-item" href="#">Another action</a>
                                              <div class="dropdown-divider"></div>
                                              <a class="dropdown-item" href="#">Something else here</a>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- Card Body -->
                                  <div class="card-body">
                                      <div class="chart-pie pt-4 pb-2">
                                          <canvas id="myPieChart2"></canvas>
                                      </div>
                                      <div class="mt-4 text-center small">
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-primary"></i> Senza patente
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-success"></i> Cat M
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-info"></i> Cat A1
                                          </span>
                                      </div>
                                  </div>
                              </div>
                          </div>

                          <!-- Pie Chart -->
                          <div class="col-xl-4 col-lg-5">
                              <div class="card shadow mb-4">
                                  <!-- Card Header - Dropdown -->
                                  <div
                                      class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                      <h6 class="m-0 font-weight-bold text-primary">Scooters <a href="javascript:submitForm('objectsNotFree')">affittati</a> / <a href="javascript:submitForm('objectsFree')">disponibili</a> / <a href="javascript:submitForm('objectsNotWorking')">fuori uso</a></h6>
                                      <div class="dropdown no-arrow">
                                          <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                              <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                          </a>
                                          <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                              aria-labelledby="dropdownMenuLink">
                                              <div class="dropdown-header">Dropdown Header:</div>
                                              <a class="dropdown-item" href="#">Action</a>
                                              <a class="dropdown-item" href="#">Another action</a>
                                              <div class="dropdown-divider"></div>
                                              <a class="dropdown-item" href="#">Something else here</a>
                                          </div>
                                      </div>
                                  </div>
                                  <!-- Card Body -->
                                  <div class="card-body">
                                      <div class="chart-pie pt-4 pb-2">
                                          <canvas id="myPieChart3"></canvas>
                                      </div>
                                      <div class="mt-4 text-center small">
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-primary"></i> Disponibili
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-success"></i> Affittati
                                          </span>
                                          <span class="mr-2">
                                              <i class="fas fa-circle text-info"></i> Fuori uso
                                          </span>
                                      </div>
                                  </div>
                              </div>
                          </div>
                      </div>


                    <!-- Content Row -->

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

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
    <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/bootstrap-datepicker.min.js" integrity="sha512-YD3Dj60zNZO5CHgEkDxrgA8P9p58Iuvl5eiO3RkoGOJQ6IWuU+AmQ0ZRK0/xoFS4ji+7CrLnY1RXSMbSaS4f+w==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker.min.css" integrity="sha512-DXCdWA+kptZRnpCPCPM6k3+sF//B3EpGLQJZ7Euj0MWf8Z+ImdJO1wcg4nIeFLSH3ChNQrChUNEuR8TUPYrVHA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/css/datepicker3.min.css" integrity="sha512-e/VbwhU6ngdCrXrWO4/tPs3rX+tRBGwRpYQR9pcrlYV5tyUAvI+LjZcKMbcgouLtDs+UAV+NxX9GpCFIWSdTtQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.1/js/locales/bootstrap-datepicker.it-CH.min.js" integrity="sha512-s9/ZeCF3oQBNCh1rGHXC6Hmt15P9b2BSZ7XeZWSliQrHxd+Q1KDIH6cgaDlieMJuwZ7BALVai7wNatX+QAVHKw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->

    <script>


      var ctx1 = document.getElementById("myPieChart1");
      var myPieChart1 = new Chart(ctx1, {
        type: 'doughnut',
        data: {
          labels: ["Senza patente", "Cat M", "Cat A1"],
          datasets: [{
            data: [15, 1, 1],
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: false
          },
          cutoutPercentage: 80,
        },
      });

      var ctx2 = document.getElementById("myPieChart2");
      var myPieChart2 = new Chart(ctx2, {
        type: 'doughnut',
        data: {
          labels: ["Senza patente", "Cat M", "Cat A1"],
          datasets: [{
            data: [<c:out value="${earning25}"/>, <c:out value="${earning30}"/>, <c:out value="${earning45}"/>],
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: false
          },
          cutoutPercentage: 80,
        },
      });

      var ctx3 = document.getElementById("myPieChart3");
      var myPieChart3 = new Chart(ctx3, {
        type: 'doughnut',
        data: {
          labels: ["Disponibili", "Affittati", "Fuori uso"],
          datasets: [{
            data: [<c:out value="${objectsFree.size()}"/>, <c:out value="${objectsNotFree.size()}"/>, <c:out value="${objectsNotWorking.size()}"/>],
            backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
            hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          }],
        },
        options: {
          maintainAspectRatio: false,
          tooltips: {
            backgroundColor: "rgb(255,255,255)",
            bodyFontColor: "#858796",
            borderColor: '#dddfeb',
            borderWidth: 1,
            xPadding: 15,
            yPadding: 15,
            displayColors: false,
            caretPadding: 10,
          },
          legend: {
            display: false
          },
          cutoutPercentage: 80,
        },
      });

      $(document).ready(function() {
        $('#dataTable').DataTable();
      });



    </script>

</body>

</html>