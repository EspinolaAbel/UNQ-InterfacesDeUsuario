package ar.edu.unq.uis.rankit.web.data

import ar.edu.unq.uis.rankit.web.requestsAndResponses.LogInRequest
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankit.web.requestsAndResponses.SignUpRequest
import ar.edu.unq.uis.rankit.web.login.LogIn
import ar.edu.unq.uis.rankit.web.signup.SignUp
import ar.edu.unq.uis.rankIt.web.minModelObject.PublicacionMini
import java.util.ArrayList
import java.util.List
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.web.minModelObject.RankingMini
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.web.minModelObject.CalificacionMini
import ar.edu.unq.uis.rankit.web.requestsAndResponses.CreateCalificacionRequest
import ar.edu.unq.uis.rankit.web.requestsAndResponses.EditCalificacionRequest
import ar.edu.unq.uis.rankIt.exceptions.CalificacionCompletadaIncorrectamenteException
import ar.edu.unq.uis.rankit.web.requestsAndResponses.LogInResponse
import ar.edu.unq.uis.rankit.web.requestsAndResponses.CreateCalificacionResponse

class WebDataManager {
	
	AdministradorGeneral adminGral
	LogIn logger
	SignUp signer
	
	new() {
		this.adminGral = this.getAdminGeneral()
		this.logger = new LogIn(adminGral.adminUsuarios)
		this.signer = new SignUp(adminGral.adminUsuarios)
	}
	

	def LogInResponse loguearUsuario(LogInRequest request) {
		var user = this.logger.validarUsuario(request.usuario, request.password)
		return new LogInResponse(user.id)
	}
	

	def void registrarUsuario(SignUpRequest request) {
		this.signer.registrarUsuario(request.usuario, request.password)
	}
	
	

	def getEvaluados() {
		var List<PublicacionMini> miniPublicaciones = new ArrayList<PublicacionMini>
		for(Publicacion each: this.publicacionesHabilitadas())
			miniPublicaciones.add = this.toPublicacionMini(each)
		return miniPublicaciones
	}
	
	
	/** Se responde con la lista del ranking de publicaciones habilitadas ordenadas según su ranking. */
	def getRankingDePublicaciones() {
		var List<Publicacion> publicacionesOrdenadas = 
			this.ordenarPublicacionesPorPromedioDeCalificaciones(this.publicacionesHabilitadas())
		val List<RankingMini> ranking = new ArrayList<RankingMini>

		for (Publicacion each : publicacionesOrdenadas) {
			var Integer rank = publicacionesOrdenadas.indexOf(each) + 1
			var publicacionMini = this.toPublicacionMini(each)
			ranking.add = this.toRankingMini(publicacionMini, rank, each.cantidadDeEvaluaciones)
		}
		return ranking
	}
	
	
	/** Se responde con la lista de {@link RankingMini} ordenada filtrada por los parámetros dados. */
	def getRankingFilteredBy(String nombre, String tipo, String calificaciones, String ranking) {
		var filteredRankingList = new ArrayList<RankingMini>()
		
		var filter = new ParameterFilter()
		var PublicacionMini evaluado
		var Integer cal = filter.toInt(calificaciones)
		var Integer rank = filter.toInt(ranking)
		var boolean superaLosFiltros		

		for(RankingMini each : this.getRankingDePublicaciones()) {
			evaluado = each.evaluado

			superaLosFiltros = 	filter.match(evaluado.nombre, nombre)				&&
								filter.match(evaluado.tipo, tipo)					&&
								filter.isGreaterOrEquals(each.calificaciones, cal)	&&
								filter.isLowerOrEquals(each.ranking, rank)		
			if(superaLosFiltros)
				filteredRankingList.add(each)
		}
		return filteredRankingList
	}
	
	

	def getCalificacionesDelUsuarioConId(Integer idUsuario) {
		var calificacionesDelUsuario = this.adminGral.adminCalificaciones.getCalificacionesDeUsuarioConId(idUsuario)
		var calificacionesMini = new ArrayList<CalificacionMini>()
		for(Calificacion each: calificacionesDelUsuario)
			calificacionesMini.add(this.toCalificacionMini(each))
		return calificacionesMini
	}


	def CreateCalificacionResponse createCalificacion(CreateCalificacionRequest request) {		
		if(request.isValid()) {
			var evaluador = this.adminGeneral.adminUsuarios.buscarUsuarioPorId(request.id_evaluador)
			var evaluado = 	this.publicacionesHabilitadas().findFirst[ each |
								each.id == request.id_evaluado	&&
								each.tipo.equals(request.tipo_evaluado)
							]
			var nuevaCalificacion = new Calificacion(evaluado, evaluador, request.puntaje, request.detalle)
			this.adminGral.adminCalificaciones.agregarCalificacion(nuevaCalificacion)
			return new CreateCalificacionResponse(nuevaCalificacion.id)
		}
		else
			throw new CalificacionCompletadaIncorrectamenteException()
	}
	
	

	def deleteCalificacion(Integer idCalificacion) {
		this.adminGral.adminCalificaciones.eliminarCalificacionPorID(idCalificacion)
	}


	def editCalificacion(EditCalificacionRequest request) {
		if(request.isValid()) {
			var calificacionEncontrada = this.adminGeneral.adminCalificaciones.getCalificacionConId(request.id_calificacion)
				calificacionEncontrada => [
					it.detalle = request.detalle
					it.puntaje = request.puntaje
				]
		}
		else
			throw new CalificacionCompletadaIncorrectamenteException
	}

	/** @return todas las publicaciones que están habilitadas en la aplicación. */
	def publicacionesHabilitadas() {
		val List<Publicacion> publicaciones = new ArrayList<Publicacion>
		publicaciones.addAll = adminGral.adminServicios.publicacionesHabilitadas
		publicaciones.addAll = adminGral.adminLugares.publicacionesHabilitadas
		return publicaciones
	}

	/** Dada una lista de {@link Publicacion}es se retorna la misma lista ordenada por su promedio de 
	 * calificaciones.
	 * La lista estará ordenada de mayor a menor promedio, estando en las primeras ubicaciones aquellas
	 * publicaciones de mayor promedio.
	 * @return todas las publicaciones de la aplicación ordenadas por promedio de calificaciones. */
	def ordenarPublicacionesPorPromedioDeCalificaciones(List<Publicacion> publicaciones) {
		return publicaciones.sortBy[each|each.ratingPromedio].reverse
	}

//TO MINIS:

	/** Dada una {@link PublicacionMini}, su posición en el ranking y su cantidad de calificaciones,
	 *  se retorna un {@link RankingMini} de la publicacion. */
	def toRankingMini(PublicacionMini miniPublicacion, Integer ranking, Integer cantEvaluaciones) {
		var mini = new RankingMini()
		mini.evaluado = miniPublicacion
		mini.ranking = ranking
		mini.calificaciones = cantEvaluaciones
		return mini
	}
	
		
	/** Dada una {@link Publicacion} se retorna una {@link PublicacionMini} de la misma. */
	def toPublicacionMini(Publicacion publicacion) {
		var mini = new PublicacionMini
		mini.id = publicacion.id
		mini.tipo = publicacion.tipo
		mini.nombre = publicacion.nombre
		return mini
	}
	
	
	/** Dada una {@link Calificacion} se retorna una {@link CalificacionMini} de la misma. */
	def toCalificacionMini(Calificacion calificacion) {
		var mini = new CalificacionMini()
		mini.detalle = calificacion.detalle
		mini.puntaje = calificacion.puntaje
		mini.evaluado = calificacion.evaluado.nombre
		mini.evaluador = calificacion.evaluador.nombre
		mini.id = calificacion.id
		mini.tipo = calificacion.evaluado.tipo
		return mini
	}	
	
	
//CARGO EL APPLICATION CONTEXT

	def AdministradorGeneral getAdminGeneral() {
		var AdministradorGeneral adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral))
		return adminGral
	}
	



	def static void main(String[] s) {
		var f = new ParameterFilter()
		println(f.match(1, null))
		println(f.match("", null))
		println(f.match("", "d"))
		println(f.match("d", ""))
		println(f.match("hola", "hola"))
		println(f.match(1,2))
		println(f.match(1,1))
		println(f.toInt(null))
		println(f.toInt("1"))
		println(f.toInt("a"))
	}
}


/** Herramienta de filtrado de parámetros en un request http.
 * Retorna true si:
 	- el 2do parametro es comparable con el 1ro o;
 	- si alguno de ellos es null.
 * PRECONDICIÓN: El 1er parámetro NO es null.
 */
class ParameterFilter {
	
	new() {}
	
	def boolean match(String str1, String str2){
		if(str2!=null) 
			return str1.toLowerCase.matches("(.*)"+str2.toLowerCase+"(.*)")
		else
			return true;
	}
	
	def boolean match(Integer int1, Integer int2){
		if(int2!=null) 
			return int1.equals(int2)
		else
			return true;
	}
	
	def boolean isLowerOrEquals(Integer int1, Integer int2){
		if(int2!=null) 
			return int1 <= int2
		else
			return true;
	}
	
	def boolean isGreaterOrEquals(Integer int1, Integer int2){
		if(int2!=null) 
			return int1 >= int2
		else
			return true;
	}
	
	/** Retorna el valor entero del string dado como parametro.
	 * En caso de en la conversión se lanze una {@link NumberFormatException} se retorna null. */
	def toInt(String str) {
		try {
			return Integer.valueOf(str)
		}
		catch(NumberFormatException e) {
			return null
		}
	}
}