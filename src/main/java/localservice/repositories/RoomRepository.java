package localservice.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import localservice.models.Room;

public interface RoomRepository extends CrudRepository<Room, Integer>{

	public List<Room> findByType(String type);
	public List<Room> findByCode(String code);
	public Room findOneByCode(String code);
}
