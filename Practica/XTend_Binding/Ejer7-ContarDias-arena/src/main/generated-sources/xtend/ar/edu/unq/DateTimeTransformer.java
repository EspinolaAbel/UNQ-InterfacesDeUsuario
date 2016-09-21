package ar.edu.unq;

import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.uqbar.arena.bindings.ValueTransformer;

@SuppressWarnings("all")
public class DateTimeTransformer implements ValueTransformer<DateTime, String> {
  private DateTimeFormatter formatter = DateTimeFormat.forPattern("dd/MM/yyyy kk:mm");
  
  public Class<DateTime> getModelType() {
    return DateTime.class;
  }
  
  public Class<String> getViewType() {
    return String.class;
  }
  
  public String modelToView(final DateTime fecha) {
    DateTimeFormatter _forPattern = DateTimeFormat.forPattern("dd/MM/yyyy kk:mm");
    return _forPattern.print(fecha);
  }
  
  public DateTime viewToModel(final String valueFromView) throws IllegalArgumentException {
    return this.formatter.parseDateTime(valueFromView);
  }
}
