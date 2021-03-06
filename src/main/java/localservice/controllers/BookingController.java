
package localservice.controllers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import localservice.models.BookingStatus;
import localservice.models.Consts;
import localservice.models.Guest;
import localservice.models.Reservation;
import localservice.models.Room;
import localservice.services.ApplicationPropertiesService;
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
	
	@Autowired
	private ApplicationPropertiesService applicationPropertiesService;
	
	@GetMapping("/booking-step1")
	public String bookingFromMenu(HttpServletRequest request) {
		setModuleInSession(request, "booking", "step1");	
		return "booking";
	}

	@PostMapping("/booking-step1")
	public String bookingStep1(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step1");
		request.getSession().setAttribute("reservationDraft", reservationForm);
		loadAvailableRoomList(request, reservationForm);
		return "booking";
	}
	
	@PostMapping("/booking-step2")
	public String bookingStep2(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step2");
		List<Room> selectedRooms = roomService.findByIds(Arrays.asList(reservationForm.getSelectedRoomIds()).stream().map(Integer::parseInt).collect(Collectors.toList()));
		reservationForm.setRooms(selectedRooms);
		double totalAmount = reservationService.computeBooking(reservationForm);
		reservationForm.setTotalAmount(totalAmount);
		request.getSession().setAttribute("sumOfRoomRate", reservationService.getSumOfRoomRate(selectedRooms));	
		request.getSession().setAttribute("numOfNights", reservationService.getNumOfNights(reservationForm));
		request.getSession().setAttribute("dpAmount", reservationService.getDownPaymentAmount(totalAmount));
		request.getSession().setAttribute("dpRate", applicationPropertiesService.findLatestConfig().getDownPaymentPercentage());
		request.getSession().setAttribute("reservationDraft", reservationForm);		
		return "booking";
	}
	
	@PostMapping("/booking-step3")
	public String bookingStep3(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		setModuleInSession(request, "booking", "step3");		
		Reservation reservationDraftInSession = (Reservation) request.getSession().getAttribute("reservationDraft");
		double dpAmount = reservationService.getDownPaymentAmount(reservationDraftInSession.getTotalAmount());
		request.getSession().setAttribute("sumOfRoomRate", reservationService.getSumOfRoomRate(reservationDraftInSession.getRooms()));	
		request.getSession().setAttribute("numOfNights", reservationService.getNumOfNights(reservationDraftInSession));
		request.getSession().setAttribute("dpAmount", dpAmount);
		request.getSession().setAttribute("dpRate", applicationPropertiesService.findLatestConfig().getDownPaymentPercentage());
		
		reservationDraftInSession.setDpAmount(dpAmount);
		reservationDraftInSession.setReferenceId(reservationService.generateReferenceId());
		reservationDraftInSession.setPaymentMethod(reservationForm.getPaymentMethod());
		reservationDraftInSession.setMainGuest(saveGuest(reservationForm));
		if(StringUtils.equalsIgnoreCase(Consts.PAYMENT_METHOD_BANK, reservationForm.getPaymentMethod())) {
			reservationDraftInSession.setStatus(BookingStatus.PENDING.toString());
		}else if(StringUtils.equalsIgnoreCase(Consts.PAYMENT_METHOD_PAYPAL, reservationForm.getPaymentMethod())) {
			reservationDraftInSession.setStatus(BookingStatus.CONFIRMED.toString());
		}		
		Reservation reservationSubmitted = reservationService.saveOrUpdate(reservationDraftInSession);
		reservationService.sendReservationEmail(reservationSubmitted);
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
	
	private void loadAvailableRoomList(HttpServletRequest request, Reservation reservationForm) {
		List<Room> rooms = roomService.findAll();
		request.setAttribute("availableRooms", rooms);
		List<Reservation> reservationsInBetween = reservationService.findAllReservationsInBetween(reservationForm.getCheckIn(), reservationForm.getCheckOut());
		request.setAttribute("reservationsInBetween", reservationsInBetween);
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		for(Room room : rooms) {
			for(Reservation reservation : reservationsInBetween) {
				if(reservation.getRooms().contains(room)) {
					if(room.getConflicts() == null) {
						room.setConflicts(new ArrayList<>());
					}
					room.getConflicts().add("Reserved from " + sdf.format(reservation.getCheckIn()) + " to " + sdf.format(reservation.getCheckOut()));
				}
			}
		}
	}
	
	
}
