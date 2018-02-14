<%@include file="header-admin.jsp" %>

  <div class="container generic-panel mar-t-20 pad-b-30">
    <div class="row mar-b-20">
      <div class="col-md-6">
        <h4>Reservations</h4>
      </div>
      <div class="col-md-6 text-right">
        <button class="btn btn-primary mar-r-10" id="btnPrintReservations">Print <i class="fa fa-print" aria-hidden="true"></i></button>
        <a href="admin-reservations" class="btn btn-primary">Refresh <i class="fa fa-refresh" aria-hidden="true"></i></a>
      </div>
    </div>
    <table class="table table-striped">
      <thead>
        <tr>
          <th class="apply-filter">REF ID</th>
          <th class="apply-filter">Main Guest</th>
          <th class="apply-filter">Contact</th>
          <th class="apply-filter">Check In</th>
          <th class="apply-filter">Check Out</th>
          <th class="apply-filter">Adult</th>   
          <th class="apply-filter">Child</th>
          <th class="apply-filter">Status</th>
          <th class="apply-filter">Amount</th>       
        </tr>
      </thead>
      <tbody>
        <c:forEach var="reservation" items="${reservationList}">
          <tr>
            <td>${reservation.referenceId}</td>
            <td>${reservation.mainGuest.lastName}, ${reservation.mainGuest.firstName}</td>
            <td>${reservation.mainGuest.contactNumber}</td>
            <td><fmt:formatDate type="date" value="${reservation.checkIn}" /></td>
            <td><fmt:formatDate type="date" value="${reservation.checkOut}" /></td>
            <td>${reservation.countAdult}</td>
            <td>${reservation.countChildren}</td>
            <td>${reservation.status}</td>
            <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${reservation.totalAmount}" /></td>                               
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

<%@include file="footer.jsp" %>