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
      .spacer {
       margin-top: 80px; /* define margin as you see fit */
    }

    .spacer2 {
        margin-top: 15px; /* define margin as you see fit */
    }

    label{margin-left: 20px;}

    #datepicker{width:190px; margin: 0 20px 20px 20px;}
    #datepicker > span:hover{cursor: pointer;}

    #datepicker2{width:180px; margin: 0 20px 20px 20px;}
    #datepicker2 > span:hover{cursor: pointer;}

    #startdate_datepicker{width:180px; margin: 0 20px 20px 20px;}
    #startdate_datepicker > span:hover{cursor: pointer;}

  </style>

  <script>

    $(function(){
        $("#footer").load("footer.html");
    });

    function controlTextField(form) {
      if(form.dataFirma.value == ""){
        alert("Inserire la data , è un campo obbligatorio!");
        form.dataFirma.focus();
        return false;
      }
      if(form.tipo.value == ""){
        alert("Inserire il tipo, è un campo obbligatorio!");
        form.tipo.focus();
        return false;
      }
      if(form.document.value == ""){
        alert("Selezionare un documento, è un campo obbligatorio!");
        form.document.focus();
        return false;
      }

      return true;

    }



    $(function () {
      $("#datepicker").datepicker({
            autoclose: true,
            locale: 'it',
            todayHighlight: true
      }).datepicker('update', new Date());
    });

    $(function () {
        $("#datepicker2").datepicker({
              autoclose: true,
              todayHighlight: true
        }).datepicker('update', new Date());
      });

    $(function () {
        $("#startdate_datepicker").datepicker({
              autoclose: true,
              todayHighlight: true
        }).datepicker('update', new Date());
      });


    function submitMyForm(command) {

        document.myForm.Command.value = command;
        myForm.submit();

    }

    function viewObjReservations(command, key) {

        document.myForm.Command.value = command;
        document.myForm.key.value = key;
        myForm.submit();

    }




  </script>

</head>
<BODY>

  <div id="wrap">
    <!-- Menu -->
    <jsp:include page='navigation.jsp'>
      <jsp:param name="param" value="test"/>
    </jsp:include>

    <div class="container">

      <div class="row spacer"></div>

      <FORM ENCTYPE="multipart/form-data" METHOD=POST action="/ecorent/UploaderPdf" name="myFormUp" onSubmit="return controlTextField(this);">
        <INPUT type="hidden" name="Command" value="<c:out value="${Command}"/>">
        <INPUT type="hidden" name="fk_riservazione" value="<c:out value="${Riservazione.key}"/>">
    <c:choose>
      <c:when test="${Documento eq null}">
        <INPUT type="hidden" name="key" value="">

        <TABLE border="0" width="55%">
          <TBODY>
            <TR>
              <TD colspan="2" height="35" width="144">Data</TD>

              <TD height="35" width="256">

                <div class="form-group">
                    <div class='input-group date' id='datepicker'  data-date-format="dd-mm-yyyy">
                        <input type='text' class="form-control" name='dataFirma'/>
                        <span class="input-group-addon">
                            <span class="glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                </div>

                <!--  <div id="datepicker" class="input-group date" data-date-format="dd-mm-yyyy">
                  <input class="form-control" name="dataFirma" type="text"  />
                  <span class="fa fa-calendar input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                </div>-->

              </TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="36">Tipo*</TD>
              <TD height="36" width="256"><INPUT type="TEXT" name="tipo" value=""></TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="36">Doc*</TD>
              <TD height="36" width="256"><INPUT type="FILE" name="document"></TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="48"><INPUT type="submit"
                name="Submit" value="Carica Documento" class="btn btn-success"></TD>
              <TD height="48" width="256">

              </TD>
            </TR>
          </TBODY>
        </TABLE>
      </c:when>
      <c:otherwise>
        <!--  <INPUT type="hidden" name="key" value="<c:out value="${Documento.key}"/>">-->

        <TABLE border="0" width="55%">
          <TBODY>
            <TR>
              <TD colspan="2" width="144" height="36">Key</TD>
              <TD height="36" width="256"><INPUT type="TEXT" name="key" value="<c:out value="${Documento.key}"/>" readonly></TD>
            </TR>
            <TR>
              <TD colspan="2" height="35" width="144">Data</TD>

              <TD height="35" width="256">
                <div id="datepicker" class="input-group date" data-date-format="dd-mm-yyyy" value="<c:out value="${Documento.dataFirma}"/>">
                  <input class="form-control" name="dataFirma" type="text"  />
                  <span class="fa fa-calendar input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                </div>

                </TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="36">Tipo*</TD>
              <TD height="36" width="256"><INPUT type="TEXT" name="tipo" value="<c:out value="${Documento.tipo}"/>"></TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="36">Doc*</TD>
              <TD height="36" width="256"><INPUT type="FILE" name="document"></TD>
            </TR>
            <TR>
              <TD colspan="2" width="144" height="48"><INPUT type="submit"
                name="Submit" value="Carica Documento" class="btn btn-success"></TD>
              <TD height="48" width="256">

              </TD>
            </TR>
          </TBODY>
        </TABLE>
      </c:otherwise>
    </c:choose>
      </FORM>

      <FORM METHOD=POST action="/ecorent/Manager" name="myForm">
        <INPUT type="hidden" name="Command" value="viewObject">
        <INPUT type="hidden" name="key" value="<c:out value="${Riservazione.key}"/>">
      </FORM>


      <button type="submit" class="btn btn-info" name="gestioneF" onclick="javascript:viewObjReservations('objectReservations', '<c:out value="${FkOgg}"/>')">
          <span class="glyphicon glyphicon-search"></span>Lista Riservazioni
      </button>
      <button type="submit" class="btn btn-info" name="gestioneF" onclick="javascript:submitMyForm('listDocs')">
          <span class="glyphicon glyphicon-search"></span>Lista Documenti
      </button>
      <button type="submit" class="btn btn-info" name="gestioneF" onclick="javascript:submitMyForm('main')">
          <span class="glyphicon glyphicon-search"></span>Main
      </button>

    </div>
    <div id="push"></div>
 </div> <!-- end wrap -->

 <!-- Footer -->
 <div id="footer" />
 <!-- Footer -->
</BODY>
</HTML>
