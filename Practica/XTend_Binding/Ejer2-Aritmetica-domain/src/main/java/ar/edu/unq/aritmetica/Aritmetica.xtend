package ar.edu.unq.aritmetica

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@TransactionalAndObservable
class Aritmetica {
	var Integer num1
	var Integer num2

	new() {
		this.num1 = 0
		this.num2 = 0
	}


	def void setNum1(Integer num){
		this.num1 = num;
	}
	
	def void setNum2(Integer num){
		this.num2 = num;
	}

	def Integer getResultadoOperacion() {
		this.multiplicar()
	}
	
	def void calcularOperacion() {
		firePropertyChanged(this, "resultadoOperacion")
	}

	def Integer multiplicar() {
		return num1 * num2
	}


//	def void sumar() {
//		resultado = num1 + num2
//	}

//	def Integer restar() {
//		resultado = num1 - num2
//	}
	
//	def Integer multiplicar() {
//		resultado = num1 * num2
//		num1 * num2
//	}
	
//	def Integer dividir() {
//		resultado = num1 / num2
//	}
}
