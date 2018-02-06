package localservice.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.Guest;
import localservice.repositories.GuestRepository;

@Service
@Transactional
public class GuestService extends BaseService<Guest>{

	private GuestRepository guestRepository;

	public GuestService(GuestRepository guestRepository) {
		super(guestRepository);
		this.guestRepository = guestRepository;
	}
	
	
}
