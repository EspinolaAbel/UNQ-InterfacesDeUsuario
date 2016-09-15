package ar.edu.unq;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.joda.time.DateTime;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ContarDiasDomain {
  private Integer cantidadDeDias;
  
  private DateTime fecha = new DateTime();
  
  private DateTime otraFecha;
  
  public void setFecha(final DateTime fecha) {
    this.fecha = fecha;
    this.otraFecha = fecha;
  }
  
  @Pure
  public Integer getCantidadDeDias() {
    return this.cantidadDeDias;
  }
  
  public void setCantidadDeDias(final Integer cantidadDeDias) {
    this.cantidadDeDias = cantidadDeDias;
  }
  
  @Pure
  public DateTime getFecha() {
    return this.fecha;
  }
  
  @Pure
  public DateTime getOtraFecha() {
    return this.otraFecha;
  }
  
  public void setOtraFecha(final DateTime otraFecha) {
    this.otraFecha = otraFecha;
  }
}
