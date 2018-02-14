<%@include file="header.jsp" %>
      
  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Our Gallery</h4>
      <center>
      <div class="container mar-b-50">
        <iframe width="665" height="380" src="https://www.youtube.com/embed/tLUu-o0-LmI" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
      </div>   
      <hr>   
      <div id="myCarousel" class="carousel slide mar-b-50 mar-t-20" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <c:forEach var="carImg" items="${carouselImages}" varStatus="loop">
            <li data-target="#myCarousel" data-slide-to="${loop.index}" class="${loop.index == 0 ? 'active' : ''}"></li>            
          </c:forEach>          
        </ol>
      
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <c:forEach var="carImg" items="${carouselImages}" varStatus="loop">
            <div class="carousel-item ${loop.index == 0 ? 'active' : ''}">
              <img src="../../images/carousel/${carImg}" class="d-block w-100">
            </div>  
          </c:forEach>          
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
      <hr>
      <div class="container mar-t-20 mar-b-50">
        <c:forEach var="galImg" items="${galleryImages}">
          <img src="../../images/gallery/${galImg}" class="img-thumbnail" style="width:320px;height:220px;margin:10px;">
        </c:forEach>
      </div> 
    </center>             
  </div>  

<%@include file="footer.jsp" %>