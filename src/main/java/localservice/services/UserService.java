package localservice.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.User;
import localservice.repositories.UserRepository;

@Service
@Transactional
public class UserService extends BaseService<User>{

	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		super(userRepository);
		this.userRepository = userRepository;
	}
	
	
}
