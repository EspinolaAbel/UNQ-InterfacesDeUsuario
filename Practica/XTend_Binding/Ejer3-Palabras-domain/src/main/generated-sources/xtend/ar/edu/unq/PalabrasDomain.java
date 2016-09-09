package ar.edu.unq;

import java.awt.Color;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.ObservableUtils;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class PalabrasDomain {
  private String palabra;
  
  private Color color = Color.BLUE;
  
  public void setPalabra(final String palabra) {
    this.palabra = palabra;
    ObservableUtils.firePropertyChanged(this, "palabraInvertida");
    this.isPalindromo();
  }
  
  public String getPalabraInvertida() {
    String _palabra = this.getPalabra();
    StringBuilder _stringBuilder = new StringBuilder(_palabra);
    StringBuilder _reverse = _stringBuilder.reverse();
    return _reverse.toString();
  }
  
  public void isPalindromo() {
    String _palabra = this.getPalabra();
    String _palabraInvertida = this.getPalabraInvertida();
    boolean _equals = _palabra.equals(_palabraInvertida);
    if (_equals) {
      this.color = Color.RED;
    } else {
      this.color = Color.BLUE;
    }
  }
  
  @Pure
  public String getPalabra() {
    return this.palabra;
  }
  
  @Pure
  public Color getColor() {
    return this.color;
  }
  
  public void setColor(final Color color) {
    this.color = color;
  }
}
