package ar.edu.unq.uis.rankIt.exceptions

class NombreDeUsuarioInvalidoException extends RuntimeException {
	
	new(String message) {
		super(	"El nombre de usuario '"+message+"' ya está siendo utilizado o tiene un formato inválido.")
	}
}