package localservice.controllers;

import javax.servlet.http.HttpServletRequest;

import localservice.models.Consts;

public class BaseController {

	protected void setModuleInSession(HttpServletRequest request, String module, String submodule) {
		if(module != null) {
			request.getSession().setAttribute(Consts.CURRENT_MODULE, module);
		}
		if(submodule != null) {
			request.getSession().setAttribute(Consts.CURRENT_SUBMODULE, submodule);
		}
	}
}
