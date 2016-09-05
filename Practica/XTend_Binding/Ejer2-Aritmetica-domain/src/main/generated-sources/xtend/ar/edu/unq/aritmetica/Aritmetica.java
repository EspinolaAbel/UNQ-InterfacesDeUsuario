package ar.edu.unq.aritmetica;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class Aritmetica {
  private Integer num1;
  
  private Integer num2;
  
  private Integer resultado;
  
  public void sumar() {
    this.resultado = Integer.valueOf(((this.num1).intValue() + (this.num2).intValue()));
  }
  
  public Integer restar() {
    return this.resultado = Integer.valueOf(((this.num1).intValue() - (this.num2).intValue()));
  }
  
  public Integer multiplicar() {
    return this.resultado = Integer.valueOf(((this.num1).intValue() * (this.num2).intValue()));
  }
  
  public Integer dividir() {
    return this.resultado = Integer.valueOf(((this.num1).intValue() / (this.num2).intValue()));
  }
  
  @Pure
  public Integer getNum1() {
    return this.num1;
  }
  
  public void setNum1(final Integer num1) {
    this.num1 = num1;
  }
  
  @Pure
  public Integer getNum2() {
    return this.num2;
  }
  
  public void setNum2(final Integer num2) {
    this.num2 = num2;
  }
  
  @Pure
  public Integer getResultado() {
    return this.resultado;
  }
  
  public void setResultado(final Integer resultado) {
    this.resultado = resultado;
  }
}
