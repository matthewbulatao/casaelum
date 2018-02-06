<%@include file="header.jsp" %>

  <div class="container generic-panel mar-t-20 pad-b-30">
    <h4>Day Tour Rates (Walk-In)</h4>
    <table class="table table-striped">
      <tbody>
        <tr>
          <td class="wid-30">Entrance Fee (Adult, 9 y/o and above)</td>
          <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${config.entranceFeeAdult}" /></td>                   
        </tr>
        <tr>
          <td class="wid-30">Entrance Fee (Child, 8 y/o and below)</td>
          <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${config.entranceFeeChild}" /></td>                   
        </tr>
      </tbody>
    </table>
    <br>
    <h4>Room Rates</h4>
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Name</th>
          <th>Type</th>
          <th>Capacity</th>
          <th>Rate</th>          
        </tr>
      </thead>
      <tbody>
        <c:forEach var="room" items="${roomList}">
          <tr>
            <td>${room.name}</td>
            <td>${room.type}</td>
            <td>${room.capacity}</td>
            <td>&#8369; <fmt:formatNumber type="number" pattern="#,###.00" value="${room.rate}" /></td>                        
          </tr>
        </c:forEach>
      </tbody>
    </table>
  </div>

<%@include file="footer.jsp" %>