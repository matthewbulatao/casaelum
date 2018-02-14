package localservice.services;

import javax.transaction.Transactional;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import localservice.models.AppUserPrincipal;
import localservice.models.User;
import localservice.repositories.UserRepository;

@Service
@Transactional
public class UserService extends BaseService<User> implements UserDetailsService {

	private final Log logger = LogFactory.getLog(getClass());
	private UserRepository userRepository;

	public UserService(UserRepository userRepository) {
		super(userRepository);
		this.userRepository = userRepository;
	}	
	
	@Override
	public User saveOrUpdate(User user) {
		user.setPassword(new BCryptPasswordEncoder(11).encode(user.getPassword()));
		return super.saveOrUpdate(user);
	}

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user = userRepository.findByUserName(userName);
		if(user == null) {
			throw new UsernameNotFoundException(userName);
		}
		logger.info("User Found: " + user);
		return new AppUserPrincipal(user);
	}
}
