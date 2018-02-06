<%@include file="header-admin.jsp"%>

<div class="container mar-t-20">
  <h4>Rooms Types</h4>
  <div class="container row">
    <form class="form-horizontal col-md-12" action="admin-room-types-save" method="POST">
      <input type="hidden" name="id" value="${roomType == null ? 0 : roomType.id}">
      <div class="form-group row col-md-12">        
        <input type="text" class="form-control col-md-5" name="name" value="${roomType.name}">
        <button type="submit" class="btn btn-primary mar-l-10">Save <i class="fa fa-floppy-o" aria-hidden="true"></i></button> 
      </div>
    </form>
  </div>
  <div class="container">
    <table class="table table-striped">
      <thead>
        <tr>
          <th class="apply-filter">Name</th>    
          <th>&nbsp;</th>      
        </tr>
      </thead>
      <tbody>
        <c:forEach var="roomType" items="${roomTypeList}">
          <tr>
            <td>${roomType.name}</td>
            <td>
              <div class="text-center row">
                <a href="admin-room-types-edit?id=${roomType.id}" class="pad-r-10" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                <form action="admin-room-types-delete" method="POST">
                  <input type="hidden" name="id" value="${roomType.id}" />
                  <a href="#" title="Delete" class="delete-icon"><i class="fa fa-trash" aria-hidden="true"></i></a>
                </form>                      
              </div>                    
            </td>               
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>
  
</div>

<%@include file="footer.jsp"%>
