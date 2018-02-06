<%@include file="header.jsp" %>
      
  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Our Gallery</h4>
    <center>
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          <li data-target="#myCarousel" data-slide-to="2"></li>
          <li data-target="#myCarousel" data-slide-to="3"></li>
          <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="../../images/1.jpg" class="d-block w-100">
            <div class="carousel-caption">
              <h3>Image Name</h3>
              <p>Caption</p>
            </div>
          </div>  
          <div class="carousel-item">
            <img src="../../images/2.jpg" class="d-block w-100">
            <div class="carousel-caption">
              <h3>Image Name</h3>
              <p>Caption</p>
            </div>
          </div>  
          <div class="carousel-item">
            <img src="../../images/3.jpg" class="d-block w-100">
            <div class="carousel-caption">
              <h3>Image Name</h3>
              <p>Caption</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="../../images/4.jpg" class="d-block w-100">
            <div class="carousel-caption">
              <h3>Image Name</h3>
              <p>Caption</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="../../images/5.jpg" class="d-block w-100">
            <div class="carousel-caption">
              <h3>Image Name</h3>
              <p>Caption</p>
            </div>
          </div>
        </div>
      
        <!-- Left and right controls -->
        <a class="carousel-control-prev btn btn-default" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next btn btn-default" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </center>    
  </div>  

<%@include file="footer.jsp" %>