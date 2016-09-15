package ar.edu.unq;

import org.eclipse.xtext.xbase.lib.Exceptions;
import org.joda.time.DateTime;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.uqbar.arena.bindings.ValueTransformer;

@SuppressWarnings("all")
public class DateTimeTransformer implements ValueTransformer<DateTime, String> {
  private DateTime fechaModelo;
  
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
  
  public DateTime viewToModel(final String valueFromView) {
    DateTime _xtrycatchfinallyexpression = null;
    try {
      DateTime _xblockexpression = null;
      {
        DateTime f = this.formatter.parseDateTime(valueFromView);
        System.out.println("Valido");
        _xblockexpression = f;
      }
      _xtrycatchfinallyexpression = _xblockexpression;
    } catch (final Throwable _t) {
      if (_t instanceof Exception) {
        final Exception e = (Exception)_t;
        System.out.println("formato invalido");
        throw new RuntimeException(e);
      } else {
        throw Exceptions.sneakyThrow(_t);
      }
    }
    return _xtrycatchfinallyexpression;
  }
}
