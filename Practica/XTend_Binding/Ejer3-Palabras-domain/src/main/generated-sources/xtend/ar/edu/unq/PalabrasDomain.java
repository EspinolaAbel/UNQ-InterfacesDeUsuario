package ar.edu.unq;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class PalabrasDomain {
  private String palabra;
  
  private String palabraAlReves;
  
  public void setPalabra(final String palabra) {
    throw new Error("Unresolved compilation problems:"
      + "\nType mismatch: cannot convert from void to String");
  }
  
  public void invertirPalabra(final String aWord) {
    throw new Error("Unresolved compilation problems:"
      + "\nno viable alternative at input \'=\'"
      + "\nThe method pal((Object)=>Integer) is undefined"
      + "\nThe constructor Array() is not visible"
      + "\nInvalid number of arguments. The field palabraAlReves is not applicable for the arguments ((Object)=>Integer)"
      + "\nCannot refer to the non-final variable i inside a lambda expression"
      + "\nCannot refer to the non-final variable i inside a lambda expression"
      + "\nThis expression is not allowed in this context, since it doesn\'t cause any side effects.");
  }
  
  @Pure
  public String getPalabra() {
    return this.palabra;
  }
  
  @Pure
  public String getPalabraAlReves() {
    return this.palabraAlReves;
  }
  
  public void setPalabraAlReves(final String palabraAlReves) {
    this.palabraAlReves = palabraAlReves;
  }
}
