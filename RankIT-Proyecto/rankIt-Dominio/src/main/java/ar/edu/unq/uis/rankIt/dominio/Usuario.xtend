package ar.edu.unq.uis.rankIt.dominio

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.DateTime

@Accessors
@Observable
class Usuario {
	var String nombre
	var String contrasenia = contraseniaDefault
	var DateTime fechaDeRegistro = new DateTime
	var boolean estaActivo = false
	var boolean estaBaneado = false
	var Integer publicacionesOfensivas = 0
	var Integer id
	var static Integer lastID = 0
	
	public val static String nombreDefault = "NN"
	public val static String contraseniaDefault = "123" 
	
	new() {
		this(nombreDefault, contraseniaDefault)
		this.id = 5
	}
	
	new(String unNombre, String contrasenia) {
		this.nombre = unNombre
		this.estaActivo = false
		this.estaBaneado = false
		this.contrasenia = contrasenia
		this.fechaDeRegistro = new DateTime
		lastID++
		this.id = lastID
	}
	
	
	def void setContrasenia(String nuevaContrasenia){
		this.contrasenia = nuevaContrasenia
	}
	
	
	def void establecerContraseniaDefault() {
		this.setContrasenia(contraseniaDefault)
	}
	
	def void setEstaBaneado(boolean estado) {
		this.estaBaneado = estado
		if(estado)
			estaActivo = false
	}
	
	def void setEstaActivo(boolean estado) {
		this.estaActivo = estado
		if(estado)
			this.estaBaneado = false
	}
			
}
