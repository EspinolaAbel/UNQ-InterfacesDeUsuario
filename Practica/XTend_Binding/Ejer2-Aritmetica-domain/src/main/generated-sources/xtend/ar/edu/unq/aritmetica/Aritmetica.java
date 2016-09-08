package ar.edu.unq.aritmetica;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class Aritmetica {
  private Integer num1 = Integer.valueOf(0);
  
  private Integer num2 = Integer.valueOf(0);
  
  private Integer resultado;
  
  public void setNum1(final Integer num) {
    this.num1 = num;
  }
  
  public void setNum2(final Integer num) {
    this.num2 = num;
  }
  
  public int getMultiplicar() {
    return (this.resultado = Integer.valueOf(((this.num1).intValue() * (this.num2).intValue()))).intValue();
  }
  
  @Pure
  public Integer getNum1() {
    return this.num1;
  }
  
  @Pure
  public Integer getNum2() {
    return this.num2;
  }
  
  @Pure
  public Integer getResultado() {
    return this.resultado;
  }
  
  public void setResultado(final Integer resultado) {
    this.resultado = resultado;
  }
}
