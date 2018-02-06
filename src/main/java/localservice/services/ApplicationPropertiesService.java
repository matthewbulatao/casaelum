package localservice.services;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import localservice.models.ApplicationProperties;
import localservice.repositories.ApplicationPropertiesRepository;

@Service
@Transactional
public class ApplicationPropertiesService extends BaseService<ApplicationProperties>{

	private ApplicationPropertiesRepository applicationPropertiesRepository;

	public ApplicationPropertiesService(ApplicationPropertiesRepository applicationPropertiesRepository) {
		super(applicationPropertiesRepository);
		this.applicationPropertiesRepository = applicationPropertiesRepository;
	}	
	
	public ApplicationProperties saveOrUpdate(ApplicationProperties applicationProperties) {
		applicationProperties.setChangeDate(new Date());
		return super.saveOrUpdate(applicationProperties);
	}

	public ApplicationProperties findLatestConfig() {
		return super.findAll().get(0);		
	}	
	
}
