package ar.unq.edu.aritmetica

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.aritmetica.Aritmetica
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.NotNullObservable

class AritmeticaWindow extends MainWindow<Aritmetica> {
	
	new() {
		super(new Aritmetica)
	}
	
	override createContents(Panel mainPanel) {
		
		//Estas varibles observan los números de mi dominio para que no seán null. Si alguno de ellos
		//es null mi botón se deshabilitara. 
		//--Mirar abajo el botón--
		var operando1 = new NotNullObservable("num1");
		var operando2 = new NotNullObservable("num2");
		
		
		this.title = "Sacar la cuenta"
		
		new Label(mainPanel).text = "Operando 1:"
		new NumericField(mainPanel).value <=> "num1"

		new Label(mainPanel).text = "Operando 2:"
		new NumericField(mainPanel).value <=> "num2"
		
		var aButton = new Button(mainPanel) => [
			caption = "*"
			onClick[ | 
				this.modelObject.multiplicar
			]
		]
		
		//Le digo a mi botón que solo estará habilitado cuando num1 y num2 no sean null.
		aButton.bindEnabled(operando1);
		aButton.bindEnabled(operando2);
		
		new Label(mainPanel).bindValueToProperty("resultado");
		
		
	}
	
	def static void main(String[] args) {
		new AritmeticaWindow().startApplication
	}
	
}
