package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import ar.edu.unq.ContarDiasDomain
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ContarDiasArena extends MainWindow<ContarDiasDomain>{
	
	new(ContarDiasDomain model) {
		super(model)
		this.title = "Contar dias."
	}
	
	override createContents(Panel mainPanel) {
		new Label(mainPanel) => [
			text = "Fecha: (dd/MM/yyyy)"
		]
		
		new TextBox(mainPanel).bindValueToProperty("fecha").transformer = new DateTimeTransformer()
		
		new Label(mainPanel).bindValueToProperty("otraFecha").transformer = new DateTimeTransformer()
	}
	
	def static void main(String[] args) {
		new ContarDiasArena(new ContarDiasDomain).startApplication
	}
	
}