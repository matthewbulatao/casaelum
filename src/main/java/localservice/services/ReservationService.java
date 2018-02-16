package localservice.services;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import localservice.models.Reservation;
import localservice.models.Room;
import localservice.repositories.ReservationRepository;

@Service
@Transactional
public class ReservationService extends BaseService<Reservation>{
	
	private final Log logger = LogFactory.getLog(getClass());
	
	private ReservationRepository reservationRepository;
	@Autowired
	private ApplicationPropertiesService applicationPropertiesService;
	@Autowired
	private MailService mailService;

	public ReservationService(ReservationRepository reservationRepository) {
		super(reservationRepository);
		this.reservationRepository = reservationRepository;
	}
	
	public double getDownPaymentAmount(double totalAmount) {
		int dpRate = applicationPropertiesService.findLatestConfig().getDownPaymentPercentage();
		double dpAmount = totalAmount * dpRate / 100.0;
		return dpAmount;
	}
	
	public double getSumOfRoomRate(List<Room> selectedRooms) {
		double sumRooms = 0.0;
		for(Room room : selectedRooms) {
			sumRooms += room.getRate();
		}
		return sumRooms;
	}
	
	public Long getNumOfNights(Reservation reservation) {
		LocalDate checkInLocal = reservation.getCheckIn().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate checkOutLocal = reservation.getCheckOut().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		Long nights = ChronoUnit.DAYS.between(checkInLocal, checkOutLocal);
		nights = nights > 0 ? nights : 1;
		return nights;
	}
	
	public double computeBooking(Reservation reservation) {
		double result = 0.0;
		Long nights = getNumOfNights(reservation);
		for(Room room : reservation.getRooms()) {
			result += room.getRate() * nights;
		}
		return result;
	}
	
	public List<Reservation> findAllReservationsToday(){
		Date today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
		return this.reservationRepository.findAllByCheckIn(today);
	}
	
	public List<Reservation> findAllReservationsInBetween(Date checkIn, Date checkOut){
		LocalDate checkInLocal = checkIn.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate checkOutLocal = checkOut.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		checkIn = Date.from(checkInLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
		checkOut = Date.from(checkOutLocal.atStartOfDay(ZoneId.systemDefault()).toInstant());
		return this.reservationRepository.findAllByCheckInAndCheckOut(checkIn, checkOut);
	}
	
	public String generateReferenceId() {
		StringBuilder sb = new StringBuilder();
		String alphabet= "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String s = "";
        Random random = new Random();
        sb.append(String.valueOf(random.nextInt(9)));
        int randomLen = 5;
        for (int i = 0; i < randomLen; i++) {
            char c = alphabet.charAt(random.nextInt(26));
            s+=c;
        } 
        sb.append(s);
        sb.append(String.valueOf(random.nextInt(9)));
        return sb.toString();
	}
	
	public Reservation findOneByReferenceId(String referenceId) {
		return this.reservationRepository.findOneByReferenceId(referenceId);
	}
	
	public double computeBalanceForCheckout(Reservation reservation) {
		return reservation.getTotalAmount() - reservation.getDpAmount(); //add here additional charges (amenities, extras)
	}
	
	public void sendReservationEmail(Reservation reservation) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
			StringBuilder sb = new StringBuilder();
			sb.append("Dear Customer,<br><br>");
			sb.append("Thank you for booking at CASA ELUM Pavilion & Resort<br><br>");
			sb.append("Check-In: " + sdf.format(reservation.getCheckIn()) + "<br>");
			sb.append("Check-Out: " + sdf.format(reservation.getCheckOut()) + "<br>");
			sb.append("Main Guest: " + reservation.getMainGuest().getFullName() + "<br>");
			sb.append("Total Pax: " + reservation.getCountAdult() + " adult(s), "+ reservation.getCountChildren() +" child(ren)<br>");
			sb.append("Rooms: ");
			for (int i = 0; i < reservation.getRooms().size(); i++) {
				Room room = reservation.getRooms().get(i);
				if(i > 0) {
					sb.append(", ");
				}
				sb.append(room.getName());				
			}
			sb.append("<hr>");
			sb.append("Booking Reference: " + reservation.getReferenceId() + "<br>");
			sb.append("Status: " + reservation.getStatus() + "<br>");
			sb.append("Total Amount: " + reservation.getTotalAmount() + "<br>");
			sb.append("Down payment ("+ applicationPropertiesService.findLatestConfig().getDownPaymentPercentage() +"%): " + reservation.getDpAmount());
			this.mailService.sendEmail(reservation.getMainGuest().getEmail(), null, "[TEST] Casa Elum Booking ["+ reservation.getReferenceId() +"]", sb.toString());
		} catch (Exception e) {
			logger.error(e);		
		}
	}
	
	public void sendCheckoutEmail(Reservation reservation) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy");
			StringBuilder sb = new StringBuilder();
			sb.append("Dear Customer,<br><br>");
			sb.append("Thank you for staying with us at CASA ELUM Pavilion & Resort<br><br>");
			sb.append("Check-In: " + sdf.format(reservation.getCheckIn()) + "<br>");
			sb.append("Check-Out: " + sdf.format(reservation.getCheckOut()) + "<br>");
			sb.append("Main Guest: " + reservation.getMainGuest().getFullName() + "<br>");
			sb.append("Total Pax: " + reservation.getCountAdult() + " adult(s), "+ reservation.getCountChildren() +" child(ren)<br>");
			sb.append("Rooms: ");
			for (int i = 0; i < reservation.getRooms().size(); i++) {
				Room room = reservation.getRooms().get(i);
				if(i > 0) {
					sb.append(", ");
				}
				sb.append(room.getName());				
			}
			sb.append("<hr>");
			sb.append("Booking Reference: " + reservation.getReferenceId() + "<br>");
			sb.append("Status: " + reservation.getStatus() + "<br>");
			sb.append("Total Amount: " + reservation.getTotalAmount() + "<br>");
			sb.append("(Less) Down payment ("+ applicationPropertiesService.findLatestConfig().getDownPaymentPercentage() +"%): " + reservation.getDpAmount() + "<br>");
			sb.append("Balance upon checkout: " + reservation.getBalanceUponCheckout());
			this.mailService.sendEmail(reservation.getMainGuest().getEmail(), null, "[TEST] Casa Elum Checkout ["+ reservation.getReferenceId() +"]", sb.toString());
		} catch (Exception e) {
			logger.error(e);		
		}
	}
}
