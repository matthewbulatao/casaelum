package localservice.services;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.Reservation;
import localservice.models.Room;
import localservice.repositories.ReservationRepository;

@Service
@Transactional
public class ReservationService extends BaseService<Reservation>{
	
	private ReservationRepository reservationRepository;

	public ReservationService(ReservationRepository reservationRepository) {
		super(reservationRepository);
		this.reservationRepository = reservationRepository;
	}
	
	public double computeBooking(Reservation reservation) {
		double result = 0.0;
		LocalDate checkInLocal = reservation.getCheckIn().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate checkOutLocal = reservation.getCheckOut().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		Long nights = ChronoUnit.DAYS.between(checkInLocal, checkOutLocal);
		nights = nights > 0 ? nights : 1;
		for(Room room : reservation.getRooms()) {
			result += room.getRate() * nights;
		}
		return result;
	}
	
	public List<Reservation> findAllReservationsToday(){
		Date today = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
		return this.reservationRepository.findAllByCheckIn(today);
	}
}
