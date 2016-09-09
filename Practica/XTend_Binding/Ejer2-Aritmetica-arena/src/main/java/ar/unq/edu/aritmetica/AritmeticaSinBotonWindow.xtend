package ar.unq.edu.aritmetica

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import ar.edu.unq.aritmetica.AritmeticaSinBoton
import org.uqbar.arena.bindings.NotNullObservable

class AritmeticaSinBotonWindow extends MainWindow<AritmeticaSinBoton> {
	
	new() {
		super(new AritmeticaSinBoton)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Sacar la cuenta"
				
		new Label(mainPanel).text = "Operando 1:"
		new NumericField(mainPanel).value <=> "num1"

		new Label(mainPanel).text = "Operando 2:"
		new NumericField(mainPanel).value <=> "num2"
		
		new Label(mainPanel) => [
			bindVisibleToProperty("puedeOperar")
			text = "Resultado:"
		]
		
		new Label(mainPanel) => [
			bindVisibleToProperty("puedeOperar")		
			value <=> "resultadoOperacion"
		]
	}
	
	def static void main(String[] args) {
		new AritmeticaSinBotonWindow().startApplication
	}
	
}