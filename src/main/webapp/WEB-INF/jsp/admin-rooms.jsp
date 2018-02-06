<%@include file="header-admin.jsp"%>

<div class="container mar-t-20">
  <h4>Rooms Management | <a href="admin-room-types">Room Types <i class="fa fa-cog" aria-hidden="true"></i></a></h4>  
  <div id="accordion" role="tablist">
    <div class="card">
      <div class="card-header" role="tab" id="headingOne"
        data-toggle="collapse" data-target="#collapseOne"
        data-parent="#accordion">
        <h5 class="mb-0">Manage</h5>
      </div>

      <div id="collapseOne" class="collapse <c:if test="${room.id > 0}">show</c:if>" role="tabpanel"
        aria-labelledby="headingOne" data-parent="#accordion">
        <div class="card-body">
          <form action="admin-rooms-save" class="form-horizontal mar-t-20" method="POST">
            <input type="hidden" name="id" value="${room.id}">
            <div class="form-group row">
              <label class="form-label col-md-2">*Name</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="name" value="${room.name}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Type</label>
              <div class="col-md-5">
                <select class="form-control" name="type" value="${room.type}">
                  <c:forEach var="roomType" items="${roomTypeList}">
                    <option value="${roomType.name}" <c:if test="${room.type == roomType.name}">selected</c:if>>${roomType.name}</option>
                  </c:forEach>
                </select>
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Capacity</label>
              <div class="col-md-5">
                <select class="form-control" name="capacity" value="${room.capacity}">
                  <c:forEach var="i" begin="1" end="20">
                    <option value="${i}" <c:if test="${room.capacity == i}">selected</c:if>>${i}</option>
                  </c:forEach>                  
                </select>
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Rate (&#8369;)</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="rate" value="${room.rate}">
              </div>
            </div>  
            <div class="form-group row">
              <label class="form-label col-md-2">Description</label>
              <div class="col-md-5">
                <textarea rows="3" class="form-control" name="description" value="${room.description}"></textarea>
              </div>
            </div>  
            <div class="form-group row">
              <label class="form-label col-md-2">*Status</label>
              <div class="col-md-5">
                <select class="form-control" name="status" value="${room.status}">
                  <option value="A" <c:if test="${room.status == 'A'}">selected</c:if>>Active</option>
                  <option value="I" <c:if test="${room.status == 'I'}">selected</c:if>>Inactive</option>
                </select>
              </div>
            </div>                
            <div class="form-group row">
              <div class="col-md-7">
                <button href="admin-rooms" class="btn btn-default pull-right mar-l-10">Cancel <i class="fa fa-eraser" aria-hidden="true"></i></button>
                <button type="submit" class="btn btn-primary pull-right">Save <i class="fa fa-floppy-o" aria-hidden="true"></i></button>                
              </div>
            </div>      
          </form>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header" role="tab" id="headingTwo"
        data-toggle="collapse" data-target="#collapseTwo"
        data-parent="#accordion">
        <h5 class="mb-0">List</h5>
      </div>
      <div id="collapseTwo" class="collapse <c:if test="${room == null}">show</c:if>" role="tabpanel"
        aria-labelledby="headingTwo" data-parent="#accordion">        
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="apply-filter">Code</th>
                <th class="apply-filter">Name</th>
                <th class="apply-filter">Type</th>
                <th class="apply-filter">Capacity</th>
                <th class="apply-filter">Rate</th>
                <th class="apply-filter">Status</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="room" items="${roomList}">
                <tr>
                  <td>${room.code}</td>
                  <td>${room.name}</td>
                  <td>${room.type}</td>
                  <td>${room.capacity}</td>
                  <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${room.rate}" /></td>
                  <td>${room.status}</td>   
                  <td>
                    <div class="text-center row">
                      <a href="admin-rooms-edit?code=${room.code}" class="pad-r-10" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                      <form action="admin-rooms-delete" method="POST">
                        <input type="hidden" name="code" value="${room.code}" />
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
    </div>
  </div>
</div>

<%@include file="footer.jsp"%>
