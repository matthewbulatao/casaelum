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
import org.springframework.web.bind.annotation.RequestParam;

import localservice.models.ApplicationProperties;
import localservice.models.BookingStatus;
import localservice.models.Miscellaneous;
import localservice.models.Reservation;
import localservice.models.Role;
import localservice.models.Room;
import localservice.models.RoomType;
import localservice.models.User;
import localservice.services.ApplicationPropertiesService;
import localservice.services.MiscellaneousService;
import localservice.services.ReservationService;
import localservice.services.RoleService;
import localservice.services.RoomService;
import localservice.services.RoomTypeService;
import localservice.services.UserService;

@Controller
public class AdminController extends BaseController {
	
	@Autowired
	private RoomService roomService;
	@Autowired
	private RoomTypeService roomTypeService;
	@Autowired
	private MiscellaneousService miscellaneousService;
	@Autowired
	private ApplicationPropertiesService applicationPropertiesService;
	@Autowired
	private ReservationService reservationService;
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	
	@GetMapping("/admin")
	public String adminHome(HttpServletRequest request) {
		request.setAttribute("reservationsTodayCount", reservationService.findAllReservationsToday().size());
		return "admin";
	}
	
	@GetMapping("/admin-manage-booking")
	public String adminManageBooking(HttpServletRequest request) {
		setModuleInSession(request, "admin_manage_booking", null);
		return "admin-manage-booking";
	}
	
	@GetMapping("/admin-manage-booking-retrieve")
	public String adminManageBookingRetrieve(@RequestParam String referenceId, HttpServletRequest request) {
		Reservation reservation = reservationService.findOneByReferenceId(referenceId.trim());
		request.setAttribute("miscellaneousList", miscellaneousService.findAll());
		request.setAttribute("savedBooking", reservation);
		return "admin-manage-booking";
	}
	
	@PostMapping("/admin-manage-booking-save")
	public String adminManageBookingSave(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		Reservation reservation = reservationService.findOneByReferenceId(reservationForm.getReferenceId().trim());
		List<Miscellaneous> amenities = miscellaneousService.findByIds(Arrays.asList(reservationForm.getSelectedAmenitiesIds()).stream().map(Integer::parseInt).collect(Collectors.toList()));
		reservation.setAmenities(amenities);
		reservation.setExtraChargeDescription(reservationForm.getExtraChargeDescription());
		reservation.setExtraChargeAmount(reservationForm.getExtraChargeAmount());
		reservationService.saveOrUpdate(reservation);
		return "redirect:admin-manage-booking";
	}
	
	@PostMapping("/admin-manage-booking-checkout")
	public String adminManageBookingCheckout(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		Reservation reservation = reservationService.findOneByReferenceId(reservationForm.getReferenceId().trim());
		reservation.setStatus(BookingStatus.CHECKED_OUT.toString());
		double balanceAmount = reservationService.computeBalanceForCheckout(reservation);
		reservation.setBalanceUponCheckout(balanceAmount);
		reservationService.saveOrUpdate(reservation);
		request.setAttribute("balanceAmount", balanceAmount);
		request.setAttribute("reservationCheckedOut", reservation);
		reservationService.sendCheckoutEmail(reservation);
		return "checkout-success";
	}
	
	@GetMapping("/admin-room-types")
	public String adminRoomTypes(HttpServletRequest request) {
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "admin-room-types";
	}
	
	@GetMapping("/admin-room-types-edit")
	public String adminRoomTypeEdit(@RequestParam int id, HttpServletRequest request) {
		request.setAttribute("roomType", roomTypeService.findById(id));
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "admin-room-types";
	}
	
	@PostMapping("/admin-room-types-save")
	public String adminRoomTypeSave(@ModelAttribute RoomType roomTypeForm, BindingResult bindingResult, HttpServletRequest request) {
		roomTypeService.saveOrUpdate(roomTypeForm);
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "redirect:admin-room-types";
	}
	
	@PostMapping("/admin-room-types-delete")
	public String adminRoomTypeDelete(@ModelAttribute RoomType roomTypeForm, BindingResult bindingResult, HttpServletRequest request) {
		RoomType roomType = roomTypeService.findById(roomTypeForm.getId());
		roomTypeService.delete(roomType);
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "redirect:admin-room-types";
	}
	
	@GetMapping("/admin-rooms")
	public String adminRooms(HttpServletRequest request) {
		request.setAttribute("roomList", roomService.findAll());
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		setModuleInSession(request, "admin_rooms", null);
		return "admin-rooms";
	}
	
	@GetMapping("/admin-rooms-edit")
	public String editRoom(@RequestParam String code, HttpServletRequest request) {
		Room room = roomService.findByCode(code);
		request.setAttribute("room", room);
		request.setAttribute("roomList", roomService.findAll());
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "admin-rooms";
	}
	
	@PostMapping("/admin-rooms-save")
	public String saveRoom(@ModelAttribute Room roomForm, BindingResult bindingResult, HttpServletRequest request) {
		roomService.saveOrUpdate(roomForm);
		request.setAttribute("roomList", roomService.findAll());
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "redirect:admin-rooms";
	}
	
	@PostMapping("/admin-rooms-delete")
	public String deleteRoom(@ModelAttribute Room roomForm, BindingResult bindingResult, HttpServletRequest request) {
		Room room = roomService.findByCode(roomForm.getCode());
		roomService.delete(room);
		request.setAttribute("roomList", roomService.findAll());
		request.setAttribute("roomTypeList", roomTypeService.findAll());
		return "redirect:admin-rooms";
	}	
	
	@GetMapping("/admin-amenities")
	public String adminAmenities(HttpServletRequest request) {		
		request.setAttribute("miscellaneousList", miscellaneousService.findAll());
		setModuleInSession(request, "admin_amenities", null);
		return "admin-amenities";
	}
	
	@GetMapping("/admin-amenities-edit")
	public String editAmenities(@RequestParam String code, HttpServletRequest request) {
		Miscellaneous misc = miscellaneousService.findByCode(code);
		request.setAttribute("misc", misc);
		request.setAttribute("miscellaneousList", miscellaneousService.findAll());
		return "admin-amenities";
	}
	
	@PostMapping("/admin-amenities-save")
	public String saveAmenities(@ModelAttribute Miscellaneous miscellaneousForm, BindingResult bindingResult, HttpServletRequest request) {
		miscellaneousService.saveOrUpdate(miscellaneousForm);
		request.setAttribute("miscellaneousList", miscellaneousService.findAll());
		return "redirect:admin-amenities";
	}
	
	@PostMapping("/admin-amenities-delete")
	public String deleteAmenities(@ModelAttribute Miscellaneous miscellaneousForm, BindingResult bindingResult, HttpServletRequest request) {
		Miscellaneous misc = miscellaneousService.findByCode(miscellaneousForm.getCode());
		miscellaneousService.delete(misc);
		request.setAttribute("miscellaneousList", miscellaneousService.findAll());
		return "redirect:admin-amenities";
	}	
	
	@GetMapping("/admin-config")
	public String adminConfig(HttpServletRequest request) {
		request.setAttribute("config", applicationPropertiesService.findLatestConfig());
		setModuleInSession(request, "admin_config", null);
		return "admin-config";
	}
	
	@PostMapping("/admin-config-save")
	public String adminConfig(@ModelAttribute ApplicationProperties applicationPropertiesForm, BindingResult bindingResult, HttpServletRequest request) {
		applicationPropertiesService.saveOrUpdate(applicationPropertiesForm);
		request.setAttribute("config", applicationPropertiesService.findLatestConfig());
		return "admin-config";
	}
	
	@GetMapping("/admin-reservations")
	public String adminReservations(HttpServletRequest request) {
		request.setAttribute("reservationList", reservationService.findAll());
		setModuleInSession(request, "admin_reservations", null);
		return "admin-reservations";
	}
	
	@GetMapping("/admin-reservations-edit")
	public String adminReservationsEdit(@RequestParam String referenceId, HttpServletRequest request) {
		Reservation resToEdit = reservationService.findOneByReferenceId(referenceId);
		request.setAttribute("resToEdit", resToEdit);
		request.setAttribute("reservationList", reservationService.findAll());
		setModuleInSession(request, "admin_reservations", null);
		return "admin-reservations";
	}
	
	@PostMapping("/admin-reservations-save")
	public String adminReservationsSave(@ModelAttribute Reservation reservationForm, BindingResult bindingResult, HttpServletRequest request) {
		Reservation resToEdit = reservationService.findOneByReferenceId(reservationForm.getReferenceId());
		resToEdit.setStatus(reservationForm.getStatus());		
		reservationService.saveOrUpdate(resToEdit);
		request.setAttribute("reservationList", reservationService.findAll());
		return "redirect:admin-reservations";
	}
	
	@GetMapping("/admin-reservations-today")
	public String adminReservationsToday(HttpServletRequest request) {
		request.setAttribute("reservationList", reservationService.findAllReservationsToday());
		setModuleInSession(request, "admin_reservations", null);
		return "admin-reservations";
	}
	
	@GetMapping("/admin-profiles")
	public String adminProfiles(HttpServletRequest request) {
		request.setAttribute("roleList", roleService.findAll());
		request.setAttribute("userList", userService.findAll());
		setModuleInSession(request, "admin_profiles", null);
		return "admin-profiles";
	}
	
	@GetMapping("/admin-profiles-edit")
	public String adminProfilesEdit(@RequestParam String id, HttpServletRequest request) {
		User user = userService.findById(Integer.parseInt(id));
		request.setAttribute("user", user);
		request.setAttribute("roleList", roleService.findAll());
		request.setAttribute("userList", userService.findAll());
		return "admin-profiles";
	}
	
	@PostMapping("/admin-profiles-save")
	public String adminProfilesSave(@ModelAttribute User userForm, BindingResult bindingResult, HttpServletRequest request) {
		List<Role> selectedRoles = roleService.findByIds(Arrays.asList(userForm.getSelectedRoleIds()).stream().map(Integer::parseInt).collect(Collectors.toList()));
		userForm.setRoles(selectedRoles);
		userService.saveOrUpdate(userForm);
		request.setAttribute("roleList", roleService.findAll());
		request.setAttribute("userList", userService.findAll());
		return "redirect:admin-profiles";
	}
	
	@PostMapping("/admin-profiles-delete")
	public String adminProfilesDelete(@ModelAttribute User userForm, BindingResult bindingResult, HttpServletRequest request) {
		User user = userService.findById(userForm.getId());
		userService.delete(user);
		request.setAttribute("roleList", roleService.findAll());
		request.setAttribute("userList", userService.findAll());
		return "redirect:admin-profiles";
	}	
	
}
