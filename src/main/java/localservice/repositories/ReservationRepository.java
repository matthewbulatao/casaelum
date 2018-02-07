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
	
	public Reservation findOneByReferenceId(String referenceId);
}
