package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class PalabrasWindow extends MainWindow<PalabrasDomain>{
	
	new() {
		super(new PalabrasDomain)
		this.title = "Inversor de palabras"
	}
	
	override createContents(Panel mainPanel) {
		
		
		new Label(mainPanel).text = "Frase"
		
		new TextBox(mainPanel) => [
			width = 250
			value <=> "palabra"
		]
		
		new Label(mainPanel) => [ 
			it.bindForegroundToProperty("color")
			value <=> "palabraInvertida"
		]
	}
	
	def static void main(String[] args) {
		new PalabrasWindow().startApplication()
	}
	
}