package ar.edu.unq.aritmetica

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Aritmetica {
	var Integer num1
	var Integer num2
	var Integer resultado

	def void sumar() {
		resultado = num1 + num2
	}

	def Integer restar() {
		resultado = num1 - num2
	}
	
	def Integer multiplicar() {
		resultado = num1 * num2
	}
	
	def Integer dividir() {
		resultado = num1 / num2
	}
}
