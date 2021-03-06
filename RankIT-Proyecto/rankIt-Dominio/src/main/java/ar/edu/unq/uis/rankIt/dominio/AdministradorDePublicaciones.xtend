package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AdministradorDePublicaciones {
	List<Publicacion> publicaciones = new ArrayList<Publicacion>
	var int registroId
	var String tipo
	
	new() {
		super()
		registroId = 0
	}
	
	/** Se agrega una nueva publicación a la lista de publicaciones de este administrador.
	 * Es responsabilidad de este administrador generar un nuevo id único para la publicación dada.
	 * Dado que este administrador administra un tipo específico de publicaciones, también es responsabilidad de este administrador setearle
	 * el tipo de publicación a todas las publicaciones agregadas a la lista. */
	def agregar(Publicacion p){
		p.id = generarNuevoId
		p.tipo = this.tipo
		publicaciones.add(p)
	}
	
	def inscriptos() {
		publicaciones.size
	}
	
	def habilitados() {
		return this.publicacionesHabilitadas.size
	}

	def deshabilitados() {
		inscriptos - habilitados
	}
	
	def borrar(Publicacion p) {
		publicaciones.remove(p)
	}
	
	/** Este método genera un nuevo id para una nueva publicación.
	 * Este método solo debe ser llamado cuando se crea una nueva publicación. */
	private def int generarNuevoId() {
		this.registroId++
		return this.registroId
	}
		
	def Publicacion buscarPublicacionPorNombre(String unNombre) {
		for(Publicacion p: publicaciones){
			if(p.nombre.equals(unNombre))
				return p
			
		} 
		return null
	}
	
	def List<Publicacion> publicacionesHabilitadas() {
		return publicaciones.filter[it.estaHabilitado].toList
	}
	
}