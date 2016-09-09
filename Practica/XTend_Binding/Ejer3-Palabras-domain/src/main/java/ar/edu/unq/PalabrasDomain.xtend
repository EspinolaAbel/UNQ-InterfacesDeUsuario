package ar.edu.unq

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*
import java.awt.Color

@Accessors
@Observable
class PalabrasDomain {
	
	var String palabra;
	var Color color = Color.BLUE;
	
	def void setPalabra(String palabra) {
		this.palabra = palabra;
		firePropertyChanged(this, "palabraInvertida")
		this.isPalindromo()
	}
	
	def getPalabraInvertida() {
		return new StringBuilder(this.getPalabra()).reverse().toString
	}
	
	def void isPalindromo() {
		if(this.getPalabra().equals(this.getPalabraInvertida))
			this.color = Color.RED
		else
			this.color = Color.BLUE
	}
	
	
}