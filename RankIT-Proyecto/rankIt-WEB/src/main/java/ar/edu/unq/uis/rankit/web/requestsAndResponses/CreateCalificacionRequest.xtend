package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CreateCalificacionRequest implements Request {

	Integer id_evaluador
	Integer id_evaluado
	String tipo_evaluado
	Integer puntaje
	String detalle
	
	override isValid() {
		return 	id_evaluador != null && id_evaluado != null && tipo_evaluado != "" &&
				puntaje != null && detalle != "";
	}

}