package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.Guest;

public interface GuestRepository extends CrudRepository<Guest, Integer>{

}
