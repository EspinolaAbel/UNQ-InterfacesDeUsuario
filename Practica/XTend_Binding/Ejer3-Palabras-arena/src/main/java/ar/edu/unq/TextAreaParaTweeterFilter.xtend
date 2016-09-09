package ar.edu.unq

import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

public class TextAreaParaTweeterFilter implements TextFilter {
	
	override accept(TextInputEvent event) {
		return event.getPotentialTextResult().matches("[0-9,.]*");
	}
	
}