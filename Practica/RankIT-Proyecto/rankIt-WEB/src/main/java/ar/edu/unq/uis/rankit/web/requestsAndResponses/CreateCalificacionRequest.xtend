package ar.edu.unq.uis.rankit.web.requestsAndResponses

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CreateCalificacionRequest {
//TODO: Comentado solo para hacerlo andar. Hay reveer los parametros del request.
//	Integer idUsuario
//	Integer idEvaluado
//	String nombreEvaluado
//	String detalle
//	Integer puntaje

	String evaluado
	Integer puntaje
	String detalle
	String evaluador
}