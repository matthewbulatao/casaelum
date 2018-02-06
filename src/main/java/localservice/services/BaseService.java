package localservice.services;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

public abstract class BaseService<T> {
	
	private CrudRepository<T, Integer> repository;

	public BaseService(CrudRepository<T, Integer> repository) {
		this.repository = repository;
	}
	
	public T saveOrUpdate(T model) {
		return this.repository.save(model);
	}
	
	public void delete(T model) {
		this.repository.delete(model);
	}
	
	public T findById(int id) {
		return this.repository.findOne(id);
	}
	
	public List<T> findByIds(List<Integer> ids){
		return (List<T>) this.repository.findAll(ids);
	}
	
	public List<T> findAll(){
		return (List<T>) this.repository.findAll();
	}
}
