package ar.edu.unq;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.uqbar.commons.model.ObservableUtils;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ConversionDomain {
  public void setCelsius(final Double temp) {
    ObservableUtils.firePropertyChanged(this, "fahrenheit");
  }
  
  public void setFahrenheit(final Double temp) {
    ObservableUtils.firePropertyChanged(this, "celsius");
  }
  
  public Double getFahrenheit() {
    Double _celsius = this.getCelsius();
    return Double.valueOf(((_celsius).doubleValue() * 1.96));
  }
  
  public Double getCelsius() {
    Double _fahrenheit = this.getFahrenheit();
    return Double.valueOf(((_fahrenheit).doubleValue() / 1.96));
  }
}
