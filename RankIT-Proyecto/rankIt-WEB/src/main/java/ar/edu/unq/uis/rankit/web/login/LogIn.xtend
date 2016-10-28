package ar.edu.unq.uis.rankit.web.login

import ar.edu.unq.uis.rankIt.dominio.AdministradorDeUsuarios
import org.eclipse.xtend.lib.annotations.Accessors
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException

@Accessors
class LogIn {
	
	var AdministradorDeUsuarios administradorDeUsuarios
	
	new(AdministradorDeUsuarios administradorUsuarios) {
		this.administradorDeUsuarios = administradorUsuarios
	}
	
	/** Dado el nombre y contraseña de un {@link Usuario} registrado en la aplicación se valida 
	 * a dicho usuario.
	 * @return el usuario con nombre de usuario y password dados.
	 * @throws {@link UsuarioNoEncontradoException} en caso de no existir el usuario con el nombre dado.
	 * @throws {@link ContraseniaDeUsuarioIncorrectaException} en caso que la contraseña dada sea incorrecta. */
	def validarUsuario(String nombreBuscado, String contrasenia) {
		var adminUsuarios = this.administradorDeUsuarios
		var Usuario usuarioEncontrado = adminUsuarios.buscarUsuarioPorNombre(nombreBuscado)
		if(usuarioEncontrado == null)
			throw new UsuarioNoEncontradoException(nombreBuscado)
		if(usuarioEncontrado.contrasenia != contrasenia)
			throw new ContraseniaDeUsuarioIncorrectaException(nombreBuscado)
		return usuarioEncontrado
	}
	
}