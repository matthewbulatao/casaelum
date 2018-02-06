package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.Role;

public interface RoleRepository extends CrudRepository<Role, Integer> {

}