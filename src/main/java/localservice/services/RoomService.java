package localservice.services;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import localservice.models.Room;
import localservice.repositories.RoomRepository;

@Service
@Transactional
public class RoomService extends BaseService<Room> {

	private RoomRepository roomRepository;

	public RoomService(RoomRepository roomRepository) {
		super(roomRepository);
		this.roomRepository = roomRepository;
	}
	
	public Room saveOrUpdate(Room room) {		
		String code = generateCode(room);
		room.setCode(code);
		return super.saveOrUpdate(room);
	}
	
	private String generateCode(Room room) {
		String code = StringUtils.EMPTY;
		int counter = 0;
		do {
			counter++;
			int countSameType = this.roomRepository.findByType(room.getType()).size();
			code = String.valueOf(room.getCapacity()) + room.getType().substring(0, 3) + (countSameType + counter);
		}while(this.roomRepository.findByCode(code).size() > 0); //loop if code already exists			
		return code;
	}
	
	public Room findByCode(String code) {
		return this.roomRepository.findOneByCode(code);
	}	
	
}
