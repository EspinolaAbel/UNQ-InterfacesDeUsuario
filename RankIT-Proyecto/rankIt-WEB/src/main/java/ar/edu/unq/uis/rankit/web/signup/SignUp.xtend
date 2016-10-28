package ar.edu.unq.uis.rankit.web.signup

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException

class SignUp {
	
	val AdministradorDeUsuarios administradorDeUsuarios
	
	new(AdministradorDeUsuarios admin) {
		this.administradorDeUsuarios = admin
	}
	
	def registrarUsuario(String nombreUsuario, String password) {
		if (!this.contraseniaDeUsuarioValida(password))
			throw new ContraseniaDeUsuarioIncorrectaException(nombreUsuario)
		if (!this.nombreDeUsuarioValido(nombreUsuario))
			throw new NombreDeUsuarioInvalidoException(nombreUsuario)
		var usuarioNuevo = new Usuario(nombreUsuario, password)
		this.administradorDeUsuarios.agregarUsuario(usuarioNuevo)
		return usuarioNuevo
	}
	
	def nombreDeUsuarioValido(String nombre) {
		return	(nombre != "")		&&
				(this.administradorDeUsuarios.buscarUsuarioPorNombre(nombre) == null)
	}
	
	def contraseniaDeUsuarioValida(String password) {
		return (password != "")
	}
	
}