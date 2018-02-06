package localservice.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.RoomType;
import localservice.repositories.RoomTypeRepository;

@Service
@Transactional
public class RoomTypeService extends BaseService<RoomType> {

	public RoomTypeService(RoomTypeRepository roomTypeRepository) {
		super(roomTypeRepository);		
	}
	
}
