<%@include file="header-admin.jsp"%>

<div class="container mar-t-20">
  <h4>System Properties</h4>
  <div class="container row mar-t-20">
    <form class="form-horizontal col-md-12" action="admin-config-save" method="POST">
      <input type="hidden" name="id" value="${config.id}">
      <div class="form-group row">     
        <label class="form-label col-md-4">Entrance Rate (Adult)</label>   
        <input type="text" class="form-control col-md-3" name="entranceFeeAdult" value="${config.entranceFeeAdult}">         
      </div>
      <div class="form-group row">     
        <label class="form-label col-md-4">Entrance Rate (Child)</label>   
        <input type="text" class="form-control col-md-3" name="entranceFeeChild" value="${config.entranceFeeChild}">         
      </div>
      <div class="form-group row">     
        <label class="form-label col-md-4">Maximum Guest per Booking (Adult)</label>   
        <input type="text" class="form-control col-md-3" name="maxAdultPerBooking" value="${config.maxAdultPerBooking}">         
      </div>
      <div class="form-group row">     
        <label class="form-label col-md-4">Maximum Guest per Booking (Child)</label>   
        <input type="text" class="form-control col-md-3" name="maxChildrenPerBooking" value="${config.maxChildrenPerBooking}">         
      </div>
      <div class="form-group row">
        <button type="submit" class="btn btn-primary mar-l-10">Save <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
      </div>
    </form>
  </div>  
  
</div>

<%@include file="footer.jsp"%>
