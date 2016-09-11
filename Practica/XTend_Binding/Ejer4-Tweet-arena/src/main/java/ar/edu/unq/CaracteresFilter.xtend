package ar.edu.unq

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

class CaracteresFilter implements TextFilter {
	
	override accept(TextInputEvent event) {
		event.getPotentialTextResult().length <= 140
	}
	
}