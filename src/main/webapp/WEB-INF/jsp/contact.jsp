<%@include file="header.jsp" %>

  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Contact Us</h4>
    <form action="" class="form-horizontal mar-t-20">
      <div class="form-group row">
        <label class="form-label col-md-3">*Full Name</label>
        <div class="col-md-9">
          <input type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="form-label col-md-3">*Email</label>
        <div class="col-md-9">
          <input type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="form-label col-md-3">Contact Number</label>
        <div class="col-md-9">
          <input type="text" class="form-control">
        </div>
      </div>
      <div class="form-group row">
        <label class="form-label col-md-3">*Message</label>
        <div class="col-md-9">
          <textarea rows="5" class="form-control"></textarea>
        </div>
      </div>  
      <div class="form-group row">
        <div class="col-md-3"></div>
        <div class="col-md-9">
          <label class="form-check-label"><input type="checkbox" class="form-check-input big-checkbox" />&nbsp;*I'm not a robot</label>
        </div>
      </div>   
      <div class="form-group row">
        <div class="col-md-12">
          <button href="#" class="btn btn-primary pull-right mar-l-20">Submit <i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
          <button href="#" class="btn btn-default pull-right">Clear <i class="fa fa-eraser" aria-hidden="true"></i></button>
        </div>
      </div>      
    </form>
  </div>

<%@include file="footer.jsp" %>