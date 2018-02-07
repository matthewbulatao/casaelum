<%@include file="header-admin.jsp"%>

<div class="container mar-t-20">
  <h4>Manage Booking</h4>
  <form action="admin-manage-booking-save" method="POST">
    <div class="container row">
      <form class="form-horizontal col-md-12" action="admin-manage-booking-retrieve" method="GET">
        <div class="form-group row col-md-12">        
          <label class="control-label col-md-3 text-right">Booking Reference ID</label>
          <input type="text" class="form-control col-md-5" name="referenceId" value="${savedBooking.referenceId}" />
          <button type="submit" class="btn btn-primary mar-l-10">Search <i class="fa fa-search" aria-hidden="true"></i></button> 
        </div>
      </form>
    </div>
    <div class="<c:if test="${savedBooking == null}">invisible</c:if>">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Main Guest</th>
            <th>Contact</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Adult</th>   
            <th>Child</th>
            <th>Status</th>
            <th>Amount</th>       
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${savedBooking.mainGuest.lastName}, ${savedBooking.mainGuest.firstName}</td>
            <td>${savedBooking.mainGuest.contactNumber}</td>
            <td><fmt:formatDate type="date" value="${savedBooking.checkIn}" /></td>
            <td><fmt:formatDate type="date" value="${savedBooking.checkOut}" /></td>
            <td>${savedBooking.countAdult}</td>
            <td>${savedBooking.countChildren}</td>
            <td>${savedBooking.status}</td>
            <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${savedBooking.totalAmount}" /></td>                               
          </tr>
        </tbody>
      </table>
    </div>
    
    <div id="accordion" role="tablist" class="<c:if test="${savedBooking == null}">invisible</c:if>">
      <div class="card">
        <div class="card-header" role="tab" id="headingOne"
          data-toggle="collapse" data-target="#collapseOne"
          data-parent="#accordion">
          <h5 class="mb-0">Add Amenities</h5>
        </div>
        <div id="collapseOne" class="collapse" role="tabpanel"
          aria-labelledby="headingOne" data-parent="#accordion">
          <div class="card-body">
            <table class="table table-striped">
              <thead>
                <tr>
                  <th class="apply-filter">Code</th>
                  <th class="apply-filter">Name</th>
                  <th class="apply-filter">Rate</th>  
                  <th>&nbsp;</th>              
                </tr>
              </thead>
              <tbody>
                <c:forEach var="miscellaneous" items="${miscellaneousList}">
                  <tr>
                    <td>${miscellaneous.code}</td>
                    <td>${miscellaneous.name}</td>
                    <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${miscellaneous.rate}" /></td>
                    <td>
                      <input type="checkbox" class="form-check-input" name="selectedAmenitiesIds" value="${miscellaneous.id}" />                   
                    </td>               
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </div>  
        
      <div class="card">
        <div class="card-header" role="tab" id="headingTwo"
          data-toggle="collapse" data-target="#collapseTwo"
          data-parent="#accordion">
          <h5 class="mb-0">Add Extra Charges</h5>
        </div>
        <div id="collapseTwo" class="collapse" role="tabpanel"
          aria-labelledby="headingTwo" data-parent="#accordion">
          <div class="card-body">
            <label class="control-label col-md-4">Description of charges</label>
            <input type="text" class="form-control col-md-4" name="extraChargeDescription" />
            <label class="control-label col-md-4">Amount &#8369;</label>
            <input type="text" class="form-control col-md-4" name="extraChargeAmount" />
          </div>
        </div>
      </div>   
      
    </div>
    
    <div class="container mar-t-20 row <c:if test="${savedBooking == null}">invisible</c:if>">
      <form action="admin-manage-booking-checkout" method="GET">
        <input type="hidden" name="referenceIdForCheckout" value="${savedBooking.referenceId}" />
        <button type="submit" class="btn btn-primary">Checkout <i class="fa fa-credit-card-alt" aria-hidden="true"></i></button>
      </form>     
      <button class="btn btn-primary mar-l-10" id="btnPrintBooking">Print Summary <i class="fa fa-print" aria-hidden="true"></i></button>  
      <button class="btn btn-primary mar-l-10" type="submit">Save changes <i class="fa-floppy-o" aria-hidden="true"></i></button>
    </div>
  </form>
  
</div>

<%@include file="footer.jsp"%>
