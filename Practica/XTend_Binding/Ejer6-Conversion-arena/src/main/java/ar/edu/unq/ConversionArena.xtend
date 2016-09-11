package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

class ConversionArena extends MainWindow<ConversionDomain>{
	
	new(ConversionDomain model) {
		super(model)
	}
	
	override createContents(Panel mainPanel) {
		new Label(mainPanel).setText("Celsius")
		new TextBox(mainPanel).bindValueToProperty("celsius")

		new Label(mainPanel).setText("Fahrenheit")
		new TextBox(mainPanel).bindValueToProperty("fahrenheit")
	}
	
	def static void main(String[] args) {
		new ConversionArena(new ConversionDomain).startApplication
	}
}