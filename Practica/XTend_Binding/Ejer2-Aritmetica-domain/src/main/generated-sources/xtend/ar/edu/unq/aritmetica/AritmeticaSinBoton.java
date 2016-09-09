package ar.edu.unq.aritmetica;

import com.google.common.base.Objects;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.model.ObservableUtils;
import org.uqbar.commons.utils.TransactionalAndObservable;

@Accessors
@TransactionalAndObservable
@SuppressWarnings("all")
public class AritmeticaSinBoton {
  private Integer num1;
  
  private Integer num2;
  
  public void setNum1(final Integer num) {
    this.num1 = num;
    this.calcularOperacion();
  }
  
  public void setNum2(final Integer num) {
    this.num2 = num;
    this.calcularOperacion();
  }
  
  public Boolean getPuedeOperar() {
    boolean _and = false;
    Integer _num1 = this.getNum1();
    boolean _notEquals = (!Objects.equal(_num1, null));
    if (!_notEquals) {
      _and = false;
    } else {
      Integer _num2 = this.getNum2();
      boolean _notEquals_1 = (!Objects.equal(_num2, null));
      _and = _notEquals_1;
    }
    return Boolean.valueOf(_and);
  }
  
  public Integer getResultadoOperacion() {
    return this.multiplicar();
  }
  
  public void calcularOperacion() {
    ObservableUtils.firePropertyChanged(this, "puedeOperar");
    Boolean _puedeOperar = this.getPuedeOperar();
    if ((_puedeOperar).booleanValue()) {
      ObservableUtils.firePropertyChanged(this, "resultadoOperacion");
    }
  }
  
  public Integer multiplicar() {
    return Integer.valueOf(((this.num1).intValue() * (this.num2).intValue()));
  }
  
  @Pure
  public Integer getNum1() {
    return this.num1;
  }
  
  @Pure
  public Integer getNum2() {
    return this.num2;
  }
}
