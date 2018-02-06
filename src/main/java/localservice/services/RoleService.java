package localservice.services;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.Role;
import localservice.repositories.RoleRepository;

@Service
@Transactional
public class RoleService extends BaseService<Role>{

	private RoleRepository roleRepository;

	public RoleService(RoleRepository roleRepository) {
		super(roleRepository);
		this.roleRepository = roleRepository;
	}
	
	
}
