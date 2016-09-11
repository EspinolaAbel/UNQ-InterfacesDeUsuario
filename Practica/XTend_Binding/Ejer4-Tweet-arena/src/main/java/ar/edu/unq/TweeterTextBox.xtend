package ar.edu.unq

import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.filters.TextFilter

class TweeterTextBox extends TextBox {
	
	new(Panel container) {
		super(container)
		withFilter(new CaracteresFilter)
		setMultiLine(true)
	}
	
	
}