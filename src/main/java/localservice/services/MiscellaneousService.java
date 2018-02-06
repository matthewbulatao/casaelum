package localservice.services;

import javax.transaction.Transactional;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import localservice.models.Miscellaneous;
import localservice.repositories.MiscellaneousRepository;

@Service
@Transactional
public class MiscellaneousService extends BaseService<Miscellaneous>{

	private MiscellaneousRepository miscellaneousRepository;

	public MiscellaneousService(MiscellaneousRepository miscellaneousRepository) {
		super(miscellaneousRepository);
		this.miscellaneousRepository = miscellaneousRepository;
	}
	
	public Miscellaneous saveOrUpdate(Miscellaneous misc) {		
		String code = "MISC_" + StringUtils.substring(misc.getName(), 0, 4).toUpperCase();		
		misc.setCode(code);
		return super.saveOrUpdate(misc);
	}	

	public Miscellaneous findByCode(String code) {
		return this.miscellaneousRepository.findByCode(code);
	}
	
	
}
