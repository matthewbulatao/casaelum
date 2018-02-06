<%@include file="header.jsp" %>

  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Additional Services</h4>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Miscellaneous</th>
          <th>Rate</th>
          <th>Description</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="misc" items="${miscellaneousList}">
          <tr>
            <td>${misc.name}</td>
            <c:choose>
              <c:when test="${misc.rate > 0.0}">
                <td>&#8369;  <fmt:formatNumber type="number" pattern="#,###.00" value="${misc.rate}" /></td>
              </c:when>
              <c:otherwise>
                <td>FREE</td> 
              </c:otherwise>
            </c:choose>   
            <td>${misc.description}</td>         
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

<%@include file="footer.jsp" %>