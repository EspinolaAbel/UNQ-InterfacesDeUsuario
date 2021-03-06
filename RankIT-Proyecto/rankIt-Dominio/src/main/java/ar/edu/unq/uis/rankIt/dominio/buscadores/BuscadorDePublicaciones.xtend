package ar.edu.unq.uis.rankIt.dominio.buscadores

import ar.edu.unq.uis.rankIt.dominio.Publicacion
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class BuscadorDePublicaciones{
	var String nombrePublicacionABuscar
	var List<Publicacion> publicaciones
	
	new(List<Publicacion> publicaciones) {
		this.publicaciones = publicaciones
		this.nombrePublicacionABuscar = ""
		this.search()
	}
	
	
	def setNombrePublicacionABuscar(String nombre) {
		this.nombrePublicacionABuscar = nombre.toLowerCase
		this.search()
		ObservableUtils.firePropertyChanged(this,"publicacionesFiltradas")
		
	}
	
	def search() {
		if(nombrePublicacionABuscar == "" ) return publicaciones
		else publicaciones.filter[ publicacion |
			publicacion.nombre.toLowerCase.contains(nombrePublicacionABuscar)
		].toList
	}
	
	def List<Publicacion> getPublicacionesFiltradas(){
		search()
	}
	
}
