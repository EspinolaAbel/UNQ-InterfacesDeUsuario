package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EditCalificacionRequest implements Request {

	Integer id_calificacion
	Integer puntaje
	String detalle
	
	override isValid() {
		return id_calificacion != null && puntaje != null && detalle != "";
	}

}