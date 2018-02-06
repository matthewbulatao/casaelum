<%@include file="header-admin.jsp" %>

  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Reservations</h4>
    <table class="table table-striped">
      <thead>
        <tr>
          <th class="apply-filter">Reference ID</th>
          <th class="apply-filter">Main Guest</th>
          <th class="apply-filter">Check In</th>
          <th class="apply-filter">Check Out</th>
          <th class="apply-filter">Adults</th>   
          <th class="apply-filter">Children</th>
          <th class="apply-filter">Status</th>
          <th class="apply-filter">Total Amount</th>       
        </tr>
      </thead>
      <tbody>
        <c:forEach var="reservation" items="${reservationList}">
          <tr>
            <%-- <td>${reservation.referenceId}</td> --%>
            <td>[BOOKING-REF-ID]</td>
            <td>[MAIN-GUEST]</td>
            <td>${reservation.checkIn}</td>
            <td>${reservation.checkOut}</td>
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