package ar.edu.unq.uis.rankIt.dominio

import java.util.List
import java.util.ArrayList
import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Publicacion {
	var String nombre
	var boolean estaHabilitado
	var DateTime fechaDeRegistro
	var List<Calificacion> calificaciones
	var Integer id
	var String tipo
	

	new() {
		fechaDeRegistro = new DateTime
		calificaciones = new ArrayList<Calificacion>
		estaHabilitado = false
		nombre = "--"
	}	

	new(String nombre) {
		this()
		this.nombre = nombre
	}
	
	new(String nombre, String unTipo) {
		this(nombre)
		this.id = id
		this.tipo = unTipo
	}
	
	
	
	new(Integer id, String nombre, String tipo) {
		this(nombre)
		this.id = id
		this.tipo = tipo
	}

	def getCalificaciones() {
		calificaciones
	}
	
	def agregarCalificacion(Calificacion c) {
		calificaciones.add(c)
	} 

	def void eliminarCalificacion(Calificacion c) {
		this.calificaciones.remove(c)
	}

	def int cantidadDeEvaluaciones() {
		calificaciones.size()
	}

	def double ratingPromedio() {
		if(cantidadDeEvaluaciones>0){
			var suma = 0
			for(Calificacion c : this.calificaciones)
				suma += c.puntaje
			return suma/cantidadDeEvaluaciones
		}
		else return 0
	}

}
