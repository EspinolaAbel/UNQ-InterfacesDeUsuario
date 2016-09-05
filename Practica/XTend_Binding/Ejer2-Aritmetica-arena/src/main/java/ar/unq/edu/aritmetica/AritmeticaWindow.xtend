package ar.unq.edu.aritmetica

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.aritmetica.Aritmetica
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button

class AritmeticaWindow extends MainWindow<Aritmetica> {
	
	new() {
		super(new Aritmetica)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Sacar la cuenta"
		
		new Label(mainPanel).text = "Operando 1:"
		new NumericField(mainPanel).value <=> "num1"

		new Label(mainPanel).text = "Operando 2:"
		new NumericField(mainPanel).value <=> "num2"
		
		new Button(mainPanel) => [
			caption = "*"
			onClick[ | 
				this.modelObject.multiplicar
			]
		]
		
		new Label(mainPanel).value <=> "resultado"
		
		
	}
	
	def static void main(String[] args) {
		new AritmeticaWindow().startApplication
	}
	
}
