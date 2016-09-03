package ar.edu.unq.xtend_arena_ej1

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.domain_ej1.Ej1Domain
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class Ej1Window extends MainWindow<Ej1Domain>{

	new (){
		super(new Ej1Domain);
	}
	
	override createContents(Panel mainPanel) {
		
		title = "Mostrar nombre"
		
		new Label(mainPanel).text = "Nombre";
		
		var String n
		var String a
		
		new TextBox(mainPanel) => [
			value <=> "nombre"
		]
		
		new Label(mainPanel).text = "Apellido";
		
		new TextBox(mainPanel).value <=> "apellido"
		
		var saludo = "Hola "+n+" "+a
		
		new Label(mainPanel)
	}
	

	def static main(String[] args) {
		new Ej1Window().startApplication
	}
}