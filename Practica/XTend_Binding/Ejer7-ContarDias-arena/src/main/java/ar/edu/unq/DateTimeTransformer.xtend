package ar.edu.unq
import org.joda.time.DateTime
import org.uqbar.arena.bindings.ValueTransformer
import org.joda.time.format.DateTimeFormat
import java.lang.IllegalArgumentException
import org.joda.time.format.DateTimeFormatter

class DateTimeTransformer implements ValueTransformer<DateTime, String> {
	
	var DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy kk:mm");
	
	override getModelType() {
		DateTime
	}
	
	override getViewType() {
		String
	}
	
	override modelToView(DateTime fecha) {
		DateTimeFormat.forPattern("dd/MM/yyyy kk:mm").print(fecha)
	}
	
	override viewToModel(String valueFromView) throws IllegalArgumentException {
		formatter.parseDateTime(valueFromView);
	}
	
}