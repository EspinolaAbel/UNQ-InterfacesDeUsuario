package ar.edu.unq.domain_ej1

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Ej1Domain {
	var String nombre = ""
	var String apellido = ""
	var String saludo
	
	def void setApellido(String a) {
		apellido = a
		setSaludo()
	}
	
	def void setNombre(String n) {
		nombre = n
		setSaludo()
	}
	
	def String setSaludo() {
		if(nombre == "" && apellido == "") {
			saludo = "--No hay nadie a quien saludar--"
		}
		else {
			saludo = "Hola "+this.nombre+" "+this.apellido
		}
	}
	
}