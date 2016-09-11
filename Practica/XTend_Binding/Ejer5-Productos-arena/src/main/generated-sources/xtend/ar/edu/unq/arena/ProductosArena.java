package ar.edu.unq.arena;

import ar.edu.unq.domain.Producto;
import ar.edu.unq.domain.ProductosDomain;
import java.awt.Color;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.PropertyAdapter;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.Selector;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.ListBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class ProductosArena extends MainWindow<ProductosDomain> {
  public ProductosArena(final ProductosDomain model) {
    super(model);
    this.setTitle("Productos y sus precios");
    this.setMinHeight(100);
  }
  
  public void createContents(final Panel mainPanel) {
    Selector<Object> _selector = new Selector<Object>(mainPanel);
    final Procedure1<Selector<Object>> _function = new Procedure1<Selector<Object>>() {
      public void apply(final Selector<Object> it) {
        it.allowNull(false);
        Binding<?, Selector<Object>, ListBuilder<Object>> _bindItemsToProperty = it.bindItemsToProperty("productos");
        PropertyAdapter _propertyAdapter = new PropertyAdapter(Producto.class, "nombre");
        _bindItemsToProperty.setAdapter(_propertyAdapter);
        it.<Object, ControlBuilder>bindValueToProperty("productoSeleccionado");
      }
    };
    ObjectExtensions.<Selector<Object>>operator_doubleArrow(_selector, _function);
    Label _label = new Label(mainPanel);
    _label.setText("Precio");
    Label _label_1 = new Label(mainPanel);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<Object, ControlBuilder>bindValueToProperty("productoSeleccionado.precio");
        it.setBackground(Color.GRAY);
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
  }
  
  public static void main(final String[] args) {
    ProductosDomain _productosDomain = new ProductosDomain();
    ProductosArena _productosArena = new ProductosArena(_productosDomain);
    _productosArena.startApplication();
  }
}
