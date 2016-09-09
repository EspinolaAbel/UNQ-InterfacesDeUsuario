package ar.edu.unq.domain_ej1

import org.eclipse.xtend.lib.annotations.Accessors
//import org.uqbar.commons.utils.Observable
import org.uqbar.commons.utils.TransactionalAndObservable

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@TransactionalAndObservable
class Ej1Domain {
	var String nombre
	var String apellido
	
	new() {
		this.nombre = ""
		this.apellido = ""
	}
	
	def void setNombre(String nombre) {
		this.nombre = nombre;
		this.saludar();
	}
	
	def void setApellido(String apellido) {
		this.apellido = apellido;
		this.saludar();
	}
	

	def String getSaludo() {
		if(nombre == "" && apellido == "") {
			return "--No hay nadie a quien saludar--"
		}
		else {
			return "Hola "+this.nombre+" "+this.apellido
		}
	}
	
	/** Al llamar a este método se dispara el aviso a todos los objetos observadores anotados
	 * que la propiedad "saludo" a sido actualizada.
	 */
	def void saludar() {
		firePropertyChanged(this, "saludo")
	}
	
}