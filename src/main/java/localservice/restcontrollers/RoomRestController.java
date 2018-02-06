package localservice.restcontrollers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import localservice.models.Room;
import localservice.services.RoomService;

@RestController
@RequestMapping(value="/api/rooms")
public class RoomRestController {

	@Autowired
	private RoomService roomService;
	
	@GetMapping("/get-all")
	public List<Room> getAll(){
		return roomService.findAll();
	}
	
	@GetMapping("/insert-dummy-room")
	public Room insertDummyRoom() {
		Room room = new Room();
		room.setCode("Test Room");
		return this.roomService.saveOrUpdate(room);		
	}
	
	//test
}
