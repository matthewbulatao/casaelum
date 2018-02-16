package localservice.repositories;

import java.util.Date;
import java.util.List;

import org.jboss.logging.Param;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import localservice.models.Reservation;

public interface ReservationRepository extends CrudRepository<Reservation, Integer>{

	@Query("select r from Reservation r where r.checkIn=?#{[0]}")
	public List<Reservation> findAllByCheckIn(Date checkIn);
	
	@Query("select r from Reservation r where r.status in ('PENDING','CONFIRMED') and (r.checkIn between ?#{[0]} and ?#{[1]} or r.checkOut between ?#{[0]} and ?#{[1]})")
	public List<Reservation> findAllByCheckInAndCheckOut(Date checkIn, Date checkOut);
	
	public Reservation findOneByReferenceId(String referenceId);
}
