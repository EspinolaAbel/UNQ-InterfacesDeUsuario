package ar.unq.edu.aritmetica

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.aritmetica.Aritmetica
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AritmeticaSinBotonWindow extends MainWindow<Aritmetica> {
	
	new() {
		super(new Aritmetica)
	}
	
	override createContents(Panel mainPanel) {
		
		this.title = "Sacar la cuenta"
		
		new Label(mainPanel).text = "Operando 1:"
		new NumericField(mainPanel).value <=> "num1"

		new Label(mainPanel).text = "Operando 2:"
		new NumericField(mainPanel).value <=> "num2"
		
		new Label(mainPanel).text = "Resultado:"
		
		var unLabel = new Label(mainPanel);
		
		unLabel.fireOnPropertyChange("operando1");
		
	}
	
	def static void main(String[] args) {
		new AritmeticaSinBotonWindow().startApplication
	}
	
}