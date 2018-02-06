package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.RoomType;

public interface RoomTypeRepository extends CrudRepository<RoomType, Integer>{
	
}
