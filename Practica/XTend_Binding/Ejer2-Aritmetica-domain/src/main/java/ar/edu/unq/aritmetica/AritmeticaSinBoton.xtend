package ar.edu.unq.aritmetica

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.TransactionalAndObservable

import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@TransactionalAndObservable
class AritmeticaSinBoton {
	var Integer num1
	var Integer num2

	def void setNum1(Integer num){
		this.num1 = num;
		this.calcularOperacion()
	}
	
	def void setNum2(Integer num){
		this.num2 = num;
		this.calcularOperacion()
	}

	def Boolean getPuedeOperar() {
		return this.getNum1() != null && this.getNum2() != null	
	}

	def Integer getResultadoOperacion() {
		this.multiplicar()
	}
	
	def void calcularOperacion() {
		firePropertyChanged(this, "puedeOperar")
		if(this.getPuedeOperar())
			firePropertyChanged(this, "resultadoOperacion")
	}

	def Integer multiplicar() {
		return num1 * num2
	}
	
}