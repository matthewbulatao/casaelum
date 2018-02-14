package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.User;

public interface UserRepository extends CrudRepository<User, Integer>{
	
	User findByUserName(String userName);

}