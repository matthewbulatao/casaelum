<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri ="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    
    <title>Casa Elum | Pavilion & Resort</title>

    <link href="../../vendor/bootstrap/css/bootstrap.css" rel="stylesheet">
	<link href="../../css/one-page-wonder.css" rel="stylesheet">
	<link href="../../css/bootstrap-datepicker3.css" rel="stylesheet">
    <link href="../../css/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="../../css/style.css" rel="stylesheet">

  </head>

  <body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="/">Casa Elum</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse hidden-print" id="navbarResponsive">
          <ul class="navbar-nav ml-auto" id="mainMenuNav">
            <li class="nav-item <c:if test="${CURRENT_MODULE == null || CURRENT_MODULE == ''}">active</c:if>">
              <a class="nav-link" href="/">Home</a>
            </li>
            <%-- <li class="nav-item <c:if test="${CURRENT_MODULE == 'booking'}">active</c:if>">
              <a class="nav-link" href="booking-step1">Accommodation</a>
            </li> --%>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'rates'}">active</c:if>">
              <a class="nav-link" href="rates">Rates</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'amenities'}">active</c:if>">
              <a class="nav-link" href="amenities">Amenities</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'gallery'}">active</c:if>">
              <a class="nav-link" href="gallery">Gallery</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'location'}">active</c:if>">
              <a class="nav-link" href="location">Location</a>
            </li>
            <li class="nav-item <c:if test="${CURRENT_MODULE == 'contact'}">active</c:if>">
              <a class="nav-link" href="contact">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>     
    