package ar.edu.unq.arena

import org.uqbar.arena.windows.MainWindow
import ar.edu.unq.domain.ProductosDomain
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.bindings.PropertyAdapter
import ar.edu.unq.domain.Producto
import java.awt.Color

class ProductosArena extends MainWindow<ProductosDomain> {
	
	new(ProductosDomain model) {
		super(model)
		this.setTitle("Productos y sus precios")
		this.setMinHeight(100)
	}
	
	override createContents(Panel mainPanel) {
		new Selector(mainPanel) => [
			allowNull(false)
			bindItemsToProperty("productos").setAdapter(new PropertyAdapter(Producto, "nombre"))
			bindValueToProperty("productoSeleccionado")
		]
		
		new Label(mainPanel).setText("Precio")
		
		new Label(mainPanel) => [
			it.bindValueToProperty("productoSeleccionado.precio")
			it.setBackground(Color.GRAY)
		]
	}
	
	def static void main(String[] args) {
		new ProductosArena(new ProductosDomain).startApplication
	}
}