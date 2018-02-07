<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    
    <title>Casa Elum | Administration</title>

    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="../../css/one-page-wonder.css" rel="stylesheet">
	<link href="../../css/bootstrap-datepicker3.css" rel="stylesheet">
    <link href="../../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../css/sb-admin-2.css" rel="stylesheet">
    <link href="../../css/excel-bootstrap-table-filter-style.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="admin">Casa Elum | Admin</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse hidden-print" id="navbarResponsive">
          <ul class="navbar-nav ml-auto" id="mainMenuNav">
            <li class="nav-item <c:if test="${CURRENT_MODULE == null || CURRENT_MODULE == ''}">active</c:if>">
              <a class="nav-link" href="admin">Dashboard</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_reservations'}">active</c:if>">
              <a class="nav-link" href="admin-reservations">Reservations</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_manage_booking'}">active</c:if>">
              <a class="nav-link" href="admin-manage-booking">Manage Booking</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_rooms'}">active</c:if>">
              <a class="nav-link" href="admin-rooms">Rooms</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_amenities'}">active</c:if>">
              <a class="nav-link" href="admin-amenities">Amenities</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_profiles'}">active</c:if>">
              <a class="nav-link" href="admin-profiles">Profiles</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_reports'}">active</c:if>">
              <a class="nav-link" href="admin-reports">Reports</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'admin_config'}">active</c:if>">
              <a class="nav-link" href="admin-config">Config</a>
            </li>
            <li class="divider" role="separator"></li>
            <li class="dropdown mar-l-10" style="margin-top:5px;font-size:20px;">
                <a href="#" data-toggle="dropdown"><i class="fa fa-user-circle"></i></a>
                <ul class="dropdown-menu">
                   <li><a href="/logout" class="nav-link" style="color: #3f3f3f;">Sign out</a></li>
                </ul>
            </li>
            <%-- <li class="nav-item>
              <form action="logout" method="POST"><a class="nav-link" href="admin-config">Config</a></form>
            </li> --%>
          </ul>
        </div>
      </div>
    </nav>