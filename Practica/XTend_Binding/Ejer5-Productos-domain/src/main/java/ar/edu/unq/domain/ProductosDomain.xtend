package ar.edu.unq.domain

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class ProductosDomain {
	
	var Producto productoSeleccionado
	
	def getProductos() {
		#[new Producto("Celular",2000),new Producto("Notebook",10000),new Producto("Led",32000)]
	}
}

@Accessors
@Observable
class Producto {
	var String nombre
	var Integer precio
	
	new(String nombre, Integer precio) {
		this.nombre = nombre
		this.precio = precio
	}
}