<input type="hidden" name="checkIn" value="<fmt:formatDate pattern="M/d/yyyy" value="${sessionScope.reservationDraft.checkIn}"/>" />
<input type="hidden" name="checkOut" value="<fmt:formatDate pattern="M/d/yyyy" value="${sessionScope.reservationDraft.checkOut}"/>" />
<input type="hidden" name="countAdult" value="${sessionScope.reservationDraft.countAdult}" />
<input type="hidden" name="countChildren" value="${sessionScope.reservationDraft.countChildren}" />