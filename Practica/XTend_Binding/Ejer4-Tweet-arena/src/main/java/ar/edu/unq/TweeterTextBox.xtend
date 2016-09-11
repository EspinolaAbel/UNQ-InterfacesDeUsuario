package ar.edu.unq

import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.filters.TextFilter

/**
 * Box de texto creado para Tweeter. Solo permite ingresar hasta 140 caracteres.
 * */
class TweeterTextBox extends TextBox {
	
	new(Panel container) {
		super(container)
		//Agrego filtro que solo permite ingresar hasta 140 caracteres.
		withFilter(new CaracteresFilter)
		//Permite que el textbox tenga más de una línea.
		setMultiLine(true)
	}
	
	
}