package ar.edu.unq
import org.joda.time.DateTime
import org.uqbar.arena.bindings.ValueTransformer
import org.joda.time.format.DateTimeFormat
import org.joda.time.format.DateTimeFormatter
import java.text.SimpleDateFormat
import java.text.DateFormat
import java.text.ParseException

class DateTimeTransformer implements ValueTransformer<DateTime, String> {
	
	var DateTime fechaModelo
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
	
	override viewToModel(String valueFromView) {
		try {
			var f = formatter.parseDateTime(valueFromView);
			System.out.println("Valido")
			f
		}
		catch(Exception e){
			System.out.println("formato invalido")
			throw new RuntimeException(e)
		}
	}
	
}