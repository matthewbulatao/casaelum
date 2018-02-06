package localservice.restcontrollers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import localservice.models.Consts;
import localservice.services.ApplicationPropertiesService;

@RestController
@RequestMapping(value="/api/common")
public class CommonRestController {
	
	@Autowired
	private ApplicationPropertiesService applicationPropertiesService;

	@GetMapping("/get-current-module")
	public String getCurrentModule(HttpServletRequest request) {
		return (String) request.getSession().getAttribute(Consts.CURRENT_MODULE);
	}
	
	@GetMapping("/get-latest-config")
	public String getLatestConfig() {
		return applicationPropertiesService.findLatestConfig().toString();
	}
}
