<%@include file="header-admin.jsp" %>

<div class="container mar-t-20">    
  <div>
    <div class="container checkin-panel-booking">
      <div class="row">
        <div class="col-md-12">
          <h4>Checkout Summary</h4>
        </div>        
      </div>    
      <div class="row">
        <div class="col-md-6 mar-t-20">
          <div>
            <span class="booking-summary-header">Schedule</span>
            <table class="table table-responsive">
              <tr>
                <td class="booking-summary-field">Check-in Date</td>
                <td><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${reservationCheckedOut.checkIn}" /></td>
              </tr>
              <tr>
                <td class="booking-summary-field">Check-out Date</td>
                <td><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${reservationCheckedOut.checkOut}" /></td>
              </tr>
            </table>
          </div>
          <div class="mar-t-20">
            <span class="booking-summary-header">Guests</span>
            <table class="table table-responsive">
              <tr>
                <td class="booking-summary-field">Main Guest</td>
                <td>${reservationCheckedOut.mainGuest.fullName}</td>
              </tr>
              <tr>
                  <td class="booking-summary-field">Total Pax</td>
                  <td>${reservationCheckedOut.countAdult} ${reservationCheckedOut.countAdult > 0 ? 'adults' : 'adult'}, ${reservationCheckedOut.countChildren} ${reservationCheckedOut.countChildren > 0 ? 'children' : 'child'}</td>
              </tr>                  
            </table>
          </div>
          <div class="mar-t-20">
            <span class="booking-summary-header">Reserved Room(s)</span>
            <table class="table table-responsive">
              <c:forEach var="room" items="${reservationCheckedOut.rooms}">
                <tr><td>${room.name}</td></tr> 
              </c:forEach>                             
            </table>
          </div>
        </div>
        <div class="col-md-6 mar-t-20">
          <span class="pull-right text-right">
            Booking Reference
            <br>
            <span id="bookingRefNumber">${reservationCheckedOut.referenceId}</span>
            <br>
            Status
            <br>
            <span id="bookingStatus">${reservationCheckedOut.status}</span>
            <br>
            Room(s) Charge = &#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${reservationCheckedOut.totalAmount}" />
            <br>
            (less) Reservation Fee = <b>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${reservationCheckedOut.dpAmount}" /></b>
            <br>
            <hr>
            Balance upon checkout = <b>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${balanceAmount}" /></b>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-12" style="margin-bottom:80px;">
      <button class="btn btn-primary pull-right mar-t-20 hidden-print" style="margin-right:-15px;" id="btnPrintBooking">Print Summary <i class="fa fa-print" aria-hidden="true"></i></button>
    </div>
  </div>
  
</div>

<%@include file="footer.jsp" %>