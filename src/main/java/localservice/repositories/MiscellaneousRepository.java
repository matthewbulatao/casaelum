package localservice.repositories;

import org.springframework.data.repository.CrudRepository;

import localservice.models.Miscellaneous;

public interface MiscellaneousRepository extends CrudRepository<Miscellaneous, Integer>{

	public Miscellaneous findByCode(String code);
}
