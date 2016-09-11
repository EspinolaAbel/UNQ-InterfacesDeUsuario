package ar.edu.unq.domain;

import ar.edu.unq.domain.Producto;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class ProductosDomain {
  private Producto productoSeleccionado;
  
  public List<Producto> getProductos() {
    Producto _producto = new Producto("Celular", Integer.valueOf(2000));
    Producto _producto_1 = new Producto("Notebook", Integer.valueOf(10000));
    Producto _producto_2 = new Producto("Led", Integer.valueOf(32000));
    return Collections.<Producto>unmodifiableList(CollectionLiterals.<Producto>newArrayList(_producto, _producto_1, _producto_2));
  }
  
  @Pure
  public Producto getProductoSeleccionado() {
    return this.productoSeleccionado;
  }
  
  public void setProductoSeleccionado(final Producto productoSeleccionado) {
    this.productoSeleccionado = productoSeleccionado;
  }
}
