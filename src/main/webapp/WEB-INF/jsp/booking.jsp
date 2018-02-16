<%@include file="header.jsp" %>

<div class="container mar-t-20">
  <div class="container checkin-panel-booking <c:if test="${CURRENT_SUBMODULE == 'step3'}">invisible</c:if>">
    <form class="row">            
      <div class="col-md-3 inner-addon right-addon">
        <!-- <i class="fa fa-calendar icon-calendar" aria-hidden="true"></i> -->
        <label class="control-label">Check-In (<b><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${sessionScope.reservationDraft.checkIn}"/></b>)</label>
        <%-- <input type="text" class="form-control datepicker disabled" placeholder="Check-in" value="<fmt:formatDate pattern="M/d/yyyy" value="${sessionScope.reservationDraft.checkIn}"/>" disabled="disabled"/> --%>              
      </div>   
      <div class="col-md-3 inner-addon right-addon">
        <!-- <i class="fa fa-calendar icon-calendar" aria-hidden="true"></i> -->
        <label class="control-label">Check-Out (<b><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${sessionScope.reservationDraft.checkOut}"/></b>)</label>
        <%-- <input type="text" class="form-control datepicker disabled" placeholder="Check-out" value="<fmt:formatDate pattern="M/d/yyyy" value="${sessionScope.reservationDraft.checkOut}"/>" disabled="disabled"/> --%>               
      </div>         
      <div class="col-md-3 inner-addon right-addon">
        <!-- <i class="fa fa-plus-circle fa-second" aria-hidden="true" id="iconMath_add_Adult"></i>
        <i class="fa fa-minus-circle" aria-hidden="true" id="iconMath_minus_Adult"></i> -->
        <label class="control-label">Adult Count (<b>${sessionScope.reservationDraft.countAdult}</b>)</label>
        <%-- <input type="text" class="form-control input-numeric disabled" placeholder="Adult" name="countAdult" value="${sessionScope.reservationDraft.countAdult}" disabled="disabled"/> --%>               
      </div>
      <div class="col-md-3 inner-addon right-addon">
        <!-- <i class="fa fa-plus-circle fa-second" aria-hidden="true" id="iconMath_add_Children"></i>
        <i class="fa fa-minus-circle" aria-hidden="true" id="iconMath_minus_Children"></i> -->
        <label class="control-label">Child Count (<b>${sessionScope.reservationDraft.countChildren}</b>)</label>
        <%-- <input type="text" class="form-control input-numeric disabled" placeholder="Child" name="countChildren" value="${sessionScope.reservationDraft.countChildren}" disabled="disabled"/> --%>               
      </div>        
    </form>
  </div>
  
  <ol class="breadcrumb" id="stepsPanel">
    <li><button class="btn btn-default <c:if test="${CURRENT_SUBMODULE == 'step1'}">booking-tab-active</c:if>" type="button"><span class="badge">1</span> Select Room</button><i class="fa fa-chevron-right bc-separator" aria-hidden="true"></i></li>
    <li><button class="btn btn-default <c:if test="${CURRENT_SUBMODULE == 'step2'}">booking-tab-active</c:if>" type="button"><span class="badge">2</span> Payment Details</button><i class="fa fa-chevron-right bc-separator" aria-hidden="true"></i></li>
    <li><button class="btn btn-default <c:if test="${CURRENT_SUBMODULE == 'step3'}">booking-tab-active</c:if>" type="button"><span class="badge">3</span> Confirmation</button></li>        
  </ol>
  
  <div id="selectRoomTab" class="<c:if test="${CURRENT_SUBMODULE != 'step1'}">invisible</c:if>">
    <form action="booking-step2" method="POST">
      
      <%@include file="hidden-booking-info.jsp" %>
      
      <div class="list-group">
        <c:forEach var="room" items="${availableRooms}">
          <div class="list-group-item">
            <div class="media">
              <!-- <div class="media-left">
                <a href="#">
                  <img src="http://placehold.it/180x150" alt="" class="media-object">
                </a>
              </div> -->
              <div class="media-body mar-l-20">
                <h4 class="media-heading">${room.name}</h4>
                <p>${room.type}</p>
                <p>${room.description}</p>  
                <c:if test="${room.conflicts != null}">
                  <ul>
                    <c:forEach var="conflict" items="${room.conflicts}">
                      <li style="color:red;"><i>${conflict}</i></li>
                    </c:forEach>
                  </ul>
                </c:if>              
              </div>
              <div class="media-right mar-l-20">
                <h4>&#8369; <fmt:formatNumber type="number" pattern="#,###" value="${room.rate}" /></h4>
                <label class="form-check-label"><input type="checkbox" class="form-check-input big-checkbox ${room.conflicts != null ? 'disabled' : ''}" name="selectedRoomIds" value="${room.id}" ${room.conflicts != null ? 'disabled' : ''} />&nbsp;Select Room</label>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
      <div class="col-md-12" style="margin-bottom:80px;">
        <button type="submit" class="btn btn-primary pull-right mar-t-20 mar-l-10" style="margin-right:-15px;" id="btnProceedToPayment">Proceed to Payment <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button>
        <a href="/" class="btn btn-primary pull-right mar-t-20 mar-r-10">Cancel <i class="fa fa-undo" aria-hidden="true"></i></a>
      </div>
    </form>    
  </div>

  <div id="paymentTab" class="<c:if test="${CURRENT_SUBMODULE != 'step2'}">invisible</c:if>">
    <form action="booking-step3" method="POST" id="formPayment">
    
      <%@include file="hidden-booking-info.jsp" %>
          
      <div class="container checkin-panel-booking">
        <h4>Personal Information</h4>
        <div class="form-horizontal mar-t-20">
          <div class="form-group row">
            <div class="col-md-1"></div>
            <label class="form-label col-md-2">*Email</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="email">
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-1"></div>
            <label class="form-label col-md-2">*First Name</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="firstName">
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-1"></div>
            <label class="form-label col-md-2">*Last Name</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="lastName">
            </div>
          </div>
          <div class="form-group row">
            <div class="col-md-1"></div>
            <label class="form-label col-md-2">*Contact Number</label>
            <div class="col-md-5">
              <input type="text" class="form-control" name="contactNumber">
            </div>
          </div>          
        </div>
      </div>
      <div class="container">
        <h4>Payment Method</h4>
      </div>      
      <div class="container checkin-panel-booking mar-t-20">        
        <div class="form-horizontal mar-t-20">
          <div class="form-group row">
             
            <div class="col-md-6">
              <div class="col-md-12 row mar-b-20">
                <label class="radio-inline col-md-6"><input type="radio" name="paymentMethod" value="BANK_DEPOSIT" checked> Bank Deposit <i class="fa fa-university" aria-hidden="true"></i></label>
                <label class="radio-inline col-md-6"><input type="radio" name="paymentMethod" value="PAYPAL"> Paypal <i class="fa fa-paypal" aria-hidden="true"></i></label>
              </div>
              <hr>
              <div class="container">
                <span><b>For Bank Deposit</b>: Bank details and instructions will be sent to you by email, 
                your reservation will be on PENDING status until your payment is confirmed
                <br>
                <b>For PayPal</b>: Your reservation will be CONFIRMED upon successful payment transaction
                </span>
              </div>              
            </div>
            <!-- <div class="col-md-6">
              <div id="paypal-button" class="pull-right"></div>
            </div> -->
            <input type="hidden" id="dpAmountForPaypal" value="${dpAmount}"/>
            <div class="col-md-6">
              <span class="pull-right text-right">
                Room(s) Rate = &#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${sumOfRoomRate}" />
                <br>
                x
                <br>
                Night(s) = ${numOfNights}
                <br>
                <hr>
                Total Amount = &#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${reservationDraft.totalAmount}" />
                <br>
                <hr>
                Reservation (${dpRate}%) = <b>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${dpAmount}" /></b>
              </span>
            </div>
          </div>
        </div>
      </div>
      <div class="col-md-12" style="margin-bottom:80px;">
        <button type="submit" class="btn btn-primary pull-right mar-t-20" style="margin-right:-15px;" id="btnProceedConfirm">Proceed to Confirmation <i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
      </div>
    </form>    
  </div>
  
  <div id="confirmationTab" class="<c:if test="${CURRENT_SUBMODULE != 'step3'}">invisible</c:if>">
    <div class="container checkin-panel-booking">
      <div class="row">
        <div class="col-md-12">
          <h4>Transaction Summary</h4>
        </div>        
      </div>    
      <div class="row">
        <div class="col-md-6 mar-t-20">
          <div>
            <span class="booking-summary-header">Schedule</span>
            <table class="table table-responsive">
              <tr>
                <td class="booking-summary-field">Check-in Date</td>
                <td><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${reservationSubmitted.checkIn}" /></td>
              </tr>
              <tr>
                <td class="booking-summary-field">Check-out Date</td>
                <td><fmt:formatDate type="date" dateStyle="long" timeStyle="long" value="${reservationSubmitted.checkOut}" /></td>
              </tr>
            </table>
          </div>
          <div class="mar-t-20">
            <span class="booking-summary-header">Guests</span>
            <table class="table table-responsive">
              <tr>
                <td class="booking-summary-field">Main Guest</td>
                <td>${reservationSubmitted.mainGuest.fullName}</td>
              </tr>
              <tr>
                  <td class="booking-summary-field">Total Pax</td>
                  <td>${reservationSubmitted.countAdult} ${reservationSubmitted.countAdult > 0 ? 'adults' : 'adult'}, ${reservationSubmitted.countChildren} ${reservationSubmitted.countChildren > 0 ? 'children' : 'child'}</td>
              </tr>                  
            </table>
          </div>
          <div class="mar-t-20">
            <span class="booking-summary-header">Reserved Room(s)</span>
            <table class="table table-responsive">
              <c:forEach var="room" items="${reservationSubmitted.rooms}">
                <tr><td>${room.name}</td></tr> 
              </c:forEach>                             
            </table>
          </div>
        </div>
        <div class="col-md-6 mar-t-20">
          <span class="pull-right text-right">
            Booking Reference
            <br>
            <span id="bookingRefNumber">${reservationSubmitted.referenceId}</span>
            <br>
            Status
            <br>
            <span id="bookingStatus">${reservationSubmitted.status}</span>
            <br>
            Room(s) Rate = &#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${sumOfRoomRate}" />
            <br>
            x
            <br>
            Night(s) = ${numOfNights}
            <br>
            Total Amount = &#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${reservationDraft.totalAmount}" />
            <br>
            Reservation (${dpRate}%) = <b>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${dpAmount}" /></b>
          </span>
        </div>
      </div>
    </div>
    <div class="col-md-12" style="margin-bottom:80px;">
      <button class="btn btn-primary pull-right mar-t-20 hidden-print" style="margin-right:-15px;" id="btnPrintBooking">Print Confirmation <i class="fa fa-print" aria-hidden="true"></i></button>
    </div>
  </div>
  
</div>

<%@include file="footer.jsp" %>