package localservice.services;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import localservice.models.Reservation;
import localservice.models.Room;
import localservice.repositories.ReservationRepository;

@Service
@Transactional
public class ReservationService extends BaseService<Reservation>{
	
	private ReservationRepository reservationRepository;
	@Autowired
	private ApplicationPropertiesService applicationPropertiesService;

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
}
