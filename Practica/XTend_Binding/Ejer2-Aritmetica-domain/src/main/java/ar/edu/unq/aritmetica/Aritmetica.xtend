package ar.edu.unq.aritmetica

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Aritmetica {
	var Integer num1 = 0
	var Integer num2 = 0
	var Integer resultado

	def void setNum1(Integer num){
		this.num1 = num;
//		getMultiplicar();
	}
	
	def void setNum2(Integer num){
		this.num2 = num;
//		getMultiplicar();
	}

//	def void sumar() {
//		resultado = num1 + num2
//	}

//	def Integer restar() {
//		resultado = num1 - num2
//	}
	
	def int getMultiplicar() {
		resultado = num1 * num2
	}
	
//	def Integer multiplicar() {
//		resultado = num1 * num2
//		num1 * num2
//	}
	
//	def Integer dividir() {
//		resultado = num1 / num2
//	}
}
