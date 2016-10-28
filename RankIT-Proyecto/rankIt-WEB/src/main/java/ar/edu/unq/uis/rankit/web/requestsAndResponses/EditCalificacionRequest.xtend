package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class EditCalificacionRequest {
//TODO: Comentado solo para hacerlo andar. Hay reveer los parametros del request.
//	String detalle
//	Integer puntaje
//	Integer idCalificacion 
	String evaluado
	String evaluador
	Integer puntaje
	String detalle
	Integer id
	String tipo
	Integer ratingPromedio
}