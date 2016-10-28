package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CreateCalificacionResponse {
	Integer id_calificacion
	
	new(Integer idCalificacion) {
		this.id_calificacion = idCalificacion
	}
	
}