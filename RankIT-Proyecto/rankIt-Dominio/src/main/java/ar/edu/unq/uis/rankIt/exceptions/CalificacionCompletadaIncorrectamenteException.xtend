package ar.edu.unq.uis.rankIt.exceptions

import org.uqbar.commons.model.UserException

class CalificacionCompletadaIncorrectamenteException extends UserException {
	
	new() {
		super("Existen parámetros incorrectos para la creacion de la calificacion.")
	}

	new(String message) {
		super(message)
	}
	
}