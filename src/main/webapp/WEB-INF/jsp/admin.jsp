<%@include file="header-admin.jsp"%>

<div class="container generic-panel mar-t-20">
  <h4>Dashboard</h4>
  <div class="row mar-l-20 mar-t-20 pad-b-30">
    <div class="col-lg-3 col-md-6">
      <div class="card card-yellow">
        <div class="card-heading">
          <div class="card-body row">
            <div class="col-md-4">
              <i class="fa fa-calendar-check-o fa-5x"></i>
            </div>
            <div class="col-md-8 text-right">
              <div class="huge">${reservationsTodayCount}</div>
              <div>Bookings today</div>
            </div>
          </div>
        </div>
        <a href="admin-reservations-today">
          <div class="card-footer">
            <span class="pull-left">View Details</span> <span
              class="pull-right"><i
              class="fa fa-arrow-circle-right"></i></span>
            <div class="clearfix"></div>
          </div>
        </a>
      </div>
    </div>
    <!-- <div class="col-lg-3 col-md-6">
      <div class="card card-green">
        <div class="card-heading">
          <div class="card-body row">
            <div class="col-md-4">
              <i class="fa fa-tasks fa-5x"></i>
            </div>
            <div class="col-md-8 text-right">
              <div class="huge">14</div>
              <div>New Bookings</div>
            </div>
          </div>
        </div>
        <a href="#">
          <div class="card-footer">
            <span class="pull-left">View Details</span> <span
              class="pull-right"><i
              class="fa fa-arrow-circle-right"></i></span>
            <div class="clearfix"></div>
          </div>
        </a>
      </div>
    </div> -->    
  </div>
</div>

<%@include file="footer.jsp"%>