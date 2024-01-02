<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<fmt:setLocale value="${sessionScope.lang}" />
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

  <style type="text/css">
    .spacer {
        margin-top: 40px; /* define margin as you see fit */
    }
  </style>

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


      //calendar:
      function editEvent(event) {

        $('#event-modal input[name="event-start-date"]').datepicker({ format: 'dd/mm/yyyy' });
        $('#event-modal input[name="event-end-date"]').datepicker({ format: 'dd/mm/yyyy' });

        $('#event-modal input[name="event-index"]').val(event ? event.id : '');
        $('#event-modal input[name="event-name"]').val(event ? event.name : '<c:out value="${utente.email}"/>');
        $('#event-modal input[name="event-location"]').val(event ? event.location : '');
        $('#event-modal input[name="event-start-date"]').datepicker('update', event ? event.startDate : '');
        $('#event-modal input[name="event-end-date"]').datepicker('update', event ? event.endDate : '');
        $('#event-modal').modal();
      }

      function deleteEvent(event) {
          var dataSource = $('#calendar').data('calendar').getDataSource();

          for(var i in dataSource) {
              if(dataSource[i].id == event.id) {
                  dataSource.splice(i, 1);
                  break;
              }
          }

          $('#calendar').data('calendar').setDataSource(dataSource);
      }

      function saveEvent() {
          var event = {
              id: $('#event-modal input[name="event-index"]').val(),
              name: $('#event-modal input[name="event-name"]').val(),
              location: $('#event-modal input[name="event-location"]').val(),
              startDate: $('#event-modal input[name="event-start-date"]').datepicker('getDate'),
              endDate: $('#event-modal input[name="event-end-date"]').datepicker('getDate')
          }

          var dataSource = $('#calendar').data('calendar').getDataSource();

          if(event.id) {
            //alert("if");
            document.myForm.data_inizio.value = event.startDate;
            document.myForm.data_fine.value = event.endDate;
            document.myForm.fk_utente.value = event.name;
            alert(document.myForm.fk_utente.value);
            document.myForm.submit();
          }
          else
          {
            //alert("else");
            document.myForm.data_inizio.value = event.startDate;
            document.myForm.data_fine.value = event.endDate;
<c:if test="${utente eq null}">
            document.myForm.fk_utente.value = event.name;
</c:if>
            document.myForm.submit();
          }

          $('#calendar').data('calendar').setDataSource(dataSource);
          $('#event-modal').modal('hide');
      }

      function saveEventBAK() {
          var event = {
              id: $('#event-modal input[name="event-index"]').val(),
              name: $('#event-modal input[name="event-name"]').val(),
              location: $('#event-modal input[name="event-location"]').val(),
              startDate: $('#event-modal input[name="event-start-date"]').datepicker('getDate'),
              endDate: $('#event-modal input[name="event-end-date"]').datepicker('getDate')
          }

          var dataSource = $('#calendar').data('calendar').getDataSource();

          if(event.id) {
              for(var i in dataSource) {
                  if(dataSource[i].id == event.id) {
                      dataSource[i].name = event.name;
                      dataSource[i].location = event.location;
                      dataSource[i].startDate = event.startDate;
                      dataSource[i].endDate = event.endDate;
                  }
              }
          }
          else
          {
              var newId = 0;
              for(var i in dataSource) {
                  if(dataSource[i].id > newId) {
                      newId = dataSource[i].id;
                  }
              }

              newId++;
              event.id = newId;

              dataSource.push(event);
          }

          $('#calendar').data('calendar').setDataSource(dataSource);
          $('#event-modal').modal('hide');
      }

      $(function() {
          var currentYear = new Date().getFullYear();

          $('#calendar').calendar({
              enableContextMenu: true,
              autoclose: true,
              language: "it",
              enableRangeSelection: true,
              contextMenuItems:[
                  {
                      text: 'Update',
                      click: editEvent
                  },
                  {
                      text: 'Delete',
                      click: deleteEvent
                  }
              ],
              selectRange: function(e) {
                  editEvent({ startDate: e.startDate, endDate: e.endDate });
              },
              mouseOnDay: function(e) {
                  if(e.events.length > 0) {
                      var content = '';

                      for(var i in e.events) {
                          content += '<div class="event-tooltip-content">'
                                          + '<div class="event-name" style="color:' + e.events[i].color + '">' + e.events[i].name + '</div>'
                                          + '<div class="event-location">' + e.events[i].location + '</div>'
                                      + '</div>';
                      }

                      $(e.element).popover({
                          trigger: 'manual',
                          container: 'body',
                          html:true,
                          content: content
                      });

                      $(e.element).popover('show');
                  }
              },
              mouseOutDay: function(e) {
                  if(e.events.length > 0) {
                      $(e.element).popover('hide');
                  }
              },
              dayContextMenu: function(e) {
                  $(e.element).popover('hide');
              },
              dataSource: [

         <c:set var="separator" value="" scope="request" />
         <c:forEach var="row" items="${Riservazioni}" varStatus="loopCounter">
         <c:out value="${separator}"/>

                {
                      id: <c:out value="${row.key}"/>,
                      name: '<c:out value="${row.fk_utente}"/>',
                      location: '<c:out value="${row.fk_oggetto}"/>',
                      startDate: new Date(<fmt:formatDate pattern="yyyy" value="${row.data_inizio}" />, <c:out value="${row.mese_inizio}"/>, <fmt:formatDate pattern="dd" value="${row.data_inizio}" />),
                      endDate: new Date(<fmt:formatDate pattern="yyyy" value="${row.data_fine}" />, <c:out value="${row.mese_fine}"/>, <fmt:formatDate pattern="dd" value="${row.data_fine}" />)
                }
                <c:set var="separator" value="," scope="request" />
         </c:forEach>
              ]
          });

          $('#save-event').click(function() {
            saveEvent();
          });
      });


    </script>

    <link rel="stylesheet" type="text/css" href="./css/myNavStyle.css">

</head>
<body>

  <div id="wrap">
      <!-- Menu -->
      <jsp:include page='navigation.jsp'>
        <jsp:param name="param" value="calendar"/>
      </jsp:include>


      <div class="container">

        <div class="row spacer"></div>

        <h3><fmt:message key="label.welcome" /></h3>
        <p>Riservazione -scooter: <c:out value="${Oggetto.nome}"/></p>
        <div id="calendar"></div>

        <!-- Modal -->
        <div class="modal modal-fade in" id="event-modal" style="display: none; padding-right: 17px;">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">
                  Scooter: <c:out value="${Oggetto.nome}"/>
                </h4>
              </div>
              <div class="modal-body">
                <input type="hidden" name="event-index" value="">
                <form class="form-horizontal">


<c:choose>
    <c:when test="${utente ne null}">
                  <div class="form-group">
                        <label for="min-date" class="col-sm-4 control-label">E-mail:</label>
                        <div class="col-sm-7">
                            <label class="col-sm- control-label"><c:out value="${utente.email}"/></label>
                        </div>
                  </div>
    </c:when>
    <c:otherwise>
                  <div class="form-group">
                        <label for="min-date" class="col-sm-4 control-label">E-mail:</label>
                        <div class="col-sm-7">
                            <input name="event-name" type="text" class="form-control" value="">
                        </div>
                  </div>
    </c:otherwise>
</c:choose>
                  <div class="form-group">
                    <label for="min-date" class="col-sm-4 control-label">Dates</label>
                    <div class="col-sm-7">
                      <div class="input-group input-daterange" data-provide="datepicker">
                        <input name="event-start-date" type="text" class="form-control" value="2019-04-05">
                        <span class="input-group-addon">to</span>
                        <input name="event-end-date" type="text" class="form-control" value="2019-04-19">
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-primary" id="save-event">
                  Save
                </button>
              </div>
            </div>
          </div>
        </div>

        <FORM name="myForm" method="post" action="/ecorent/Controller">
              <INPUT type="hidden" name="Command" value="setRiservazione">
<c:if test="${utente ne null}">
              <INPUT type="hidden" name="fk_utente" value="<c:out value="${utente.email}"/>">
</c:if>

              <INPUT type="hidden" name="fk_oggetto" value="<c:out value="${Oggetto.key}"/>">
              <INPUT type="hidden" name="stato" value="1">
              <INPUT type="hidden" name="data_inizio" value="">
              <INPUT type="hidden" name="data_fine" value="">
        </FORM>

      </div><!-- end container -->
      <div id="push"></div>
    </div> <!-- end wrap -->

    <div id="footer">
     <%@include  file="footer.html" %>
    </div>

</body>
</html>
