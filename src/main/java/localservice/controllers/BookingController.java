
package localservice.controllers;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import localservice.models.Guest;
import localservice.models.Reservation;
import localservice.models.Room;
import localservice.services.GuestService;
import localservice.services.ReservationService;
import localservice.services.RoomService;

@Controller
public class BookingController extends BaseController {
	
	@Autowired
	private RoomService roomService;
	
	@Autowired
	private GuestService guestService;
	
	@Autowired
	private ReservationService reservationService;
	
	@GetMapping("/booking-step1")
	public String bookingFromMenu(HttpServletRequest request) {
		setModuleInSession(request, "booking", "step1");	
		return "booking";
	}

	@PostMapping("/booking-step1")
	public String bookingStep1(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step1");
		request.getSession().setAttribute("reservationDraft", reservationForm);
		loadAvailableRoomList(request);
		return "booking";
	}
	
	@PostMapping("/booking-step2")
	public String bookingStep2(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step2");
		List<Room> selectedRooms = roomService.findByIds(Arrays.asList(reservationForm.getSelectedRoomIds()).stream().map(Integer::parseInt).collect(Collectors.toList()));
		reservationForm.setRooms(selectedRooms);
		request.getSession().setAttribute("reservationDraft", reservationForm);		
		return "booking";
	}
	
	@PostMapping("/booking-step3")
	public String bookingStep3(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step3");
		//TODO save additional info about reservation
		Reservation reservationDraftInSession = (Reservation) request.getSession().getAttribute("reservationDraft");
		reservationDraftInSession.setPaymentMethod(reservationForm.getPaymentMethod());
		reservationDraftInSession.setMainGuest(saveGuest(reservationForm));		
		reservationDraftInSession.setTotalAmount(reservationService.computeBooking(reservationDraftInSession));
		reservationDraftInSession.setStatus("PENDING"); //TODO make it dynamic
		Reservation reservationSubmitted = reservationService.saveOrUpdate(reservationDraftInSession);
		request.setAttribute("reservationSubmitted", reservationSubmitted);	
		return "booking";
	}
	
	private Guest saveGuest(Reservation reservationForm) {
		Guest guest = new Guest();
		guest.setFirstName(reservationForm.getFirstName());
		guest.setLastName(reservationForm.getLastName());
		guest.setContactNumber(reservationForm.getContactNumber());
		guest.setEmail(reservationForm.getEmail());
		guestService.saveOrUpdate(guest);
		return guest;
	}
	
	private void loadAvailableRoomList(HttpServletRequest request) {
		//TODO get only available rooms
		List<Room> rooms = roomService.findAll();
		request.setAttribute("availableRooms", rooms);
	}
	
	
}
