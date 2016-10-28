package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class LogInResponse {
	
	var Integer id;
	
	new(){}
	
	new(Integer idUsuario) {
		this.id = idUsuario
	}
}