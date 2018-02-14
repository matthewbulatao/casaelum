<%@include file="header-admin.jsp"%>

<div class="container mar-t-20">
  <h4>System Users</h4>  
  <div id="accordion" role="tablist">
    <div class="card">
      <div class="card-header" role="tab" id="headingOne"
        data-toggle="collapse" data-target="#collapseOne"
        data-parent="#accordion">
        <h5 class="mb-0">Manage</h5>
      </div>

      <div id="collapseOne" class="collapse <c:if test="${user.id > 0}">show</c:if>" role="tabpanel"
        aria-labelledby="headingOne" data-parent="#accordion">
        <div class="card-body">
          <form action="admin-profiles-save" class="form-horizontal mar-t-20" method="POST">
            <input type="hidden" name="id" value="${user.id}">
            <div class="form-group row">
              <label class="form-label col-md-2">*First Name</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="firstName" value="${user.firstName}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Last Name</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="lastName" value="${user.lastName}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Contact</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="contactNumber" value="${user.contactNumber}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Email</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="email" value="${user.email}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Username</label>
              <div class="col-md-5">
                <input type="text" class="form-control" name="userName" value="${user.userName}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Password</label>
              <div class="col-md-5">
                <input type="password" class="form-control" name="password" value="${user.password}">
              </div>
            </div>
            <div class="form-group row">
              <label class="form-label col-md-2">*Roles</label>
              <div class="col-md-5">
                <c:forEach var="role" items="${roleList}">
                  <c:choose>
                    <c:when test="${user != null}">
                      <c:forEach var="userRole" items="${user.roles}">
                        <c:choose>
                          <c:when test="${userRole.id == role.id}">
                            <label class="form-check-label mar-r-20"><input type="checkbox" class="form-check-input big-checkbox" name="selectedRoleIds" value="${role.id}" checked/>&nbsp;${role.name}</label>      
                          </c:when>
                          <c:otherwise>
                            <label class="form-check-label mar-r-20"><input type="checkbox" class="form-check-input big-checkbox" name="selectedRoleIds" value="${role.id}"/>&nbsp;${role.name}</label>
                          </c:otherwise>
                        </c:choose>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <label class="form-check-label mar-r-20"><input type="checkbox" class="form-check-input big-checkbox" name="selectedRoleIds" value="${role.id}"/>&nbsp;${role.name}</label>
                    </c:otherwise>
                  </c:choose> 
                </c:forEach>                 
              </div>
            </div>              
            <div class="form-group row">
              <label class="form-label col-md-2">*Status</label>
              <div class="col-md-5">
                <select class="form-control" name="status" value="${user.status}">
                  <option value="A" <c:if test="${user.status == 'A'}">selected</c:if>>Active</option>
                  <option value="I" <c:if test="${user.status == 'I'}">selected</c:if>>Inactive</option>
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
      <div id="collapseTwo" class="collapse <c:if test="${user == null}">show</c:if>" role="tabpanel"
        aria-labelledby="headingTwo" data-parent="#accordion">        
        <div class="card-body">
          <table class="table table-striped">
            <thead>
              <tr>
                <th class="apply-filter">First Name</th>
                <th class="apply-filter">Last Name</th>
                <th class="apply-filter">Contact</th>
                <th class="apply-filter">Email</th>
                <th class="apply-filter">Username</th>
                <th class="apply-filter">Roles</th>
                <th class="apply-filter">Status</th>
                <th>&nbsp;</th>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="user" items="${userList}">
                <tr>
                  <td>${user.firstName}</td>
                  <td>${user.lastName}</td>
                  <td>${user.contactNumber}</td>
                  <td>${user.email}</td>
                  <td>${user.userName}</td>
                  <td>
                    <c:forEach var="role" items="${user.roles}">${role.name} </c:forEach>
                  </td>
                  <td>${user.status}</td>
                  <td>
                    <div class="text-center row">
                      <a href="admin-profiles-edit?id=${user.id}" class="pad-r-10" title="Edit"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                      <form action="admin-profiles-delete" method="POST">
                        <input type="hidden" name="id" value="${user.id}" />
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
