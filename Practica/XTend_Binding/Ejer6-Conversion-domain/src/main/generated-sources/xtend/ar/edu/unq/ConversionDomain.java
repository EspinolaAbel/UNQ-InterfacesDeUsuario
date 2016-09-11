package ar.edu.unq;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ConversionDomain {
  private Double celsius;
  
  private Double fahrenheit;
  
  public void setCelsius(final Double temp) {
    this.celsius = temp;
    this.fahrenheit = Double.valueOf(((this.celsius).doubleValue() * 1.96));
  }
  
  public void setFahrenheit(final Double temp) {
    this.fahrenheit = temp;
    this.celsius = Double.valueOf(((this.fahrenheit).doubleValue() / 1.96));
  }
  
  @Pure
  public Double getCelsius() {
    return this.celsius;
  }
  
  @Pure
  public Double getFahrenheit() {
    return this.fahrenheit;
  }
}
