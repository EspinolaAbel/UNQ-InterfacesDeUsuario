package ar.edu.unq.uis.rankit.web.controller

import ar.edu.unq.uis.rankIt.exceptions.CalificacionCompletadaIncorrectamenteException
import ar.edu.unq.uis.rankIt.exceptions.ContraseniaDeUsuarioIncorrectaException
import ar.edu.unq.uis.rankIt.exceptions.IdDeCalificacionInexistenteException
import ar.edu.unq.uis.rankIt.exceptions.NombreDeUsuarioInvalidoException
import ar.edu.unq.uis.rankIt.exceptions.UsuarioNoEncontradoException
import ar.edu.unq.uis.rankit.web.data.WebDataManager
import ar.edu.unq.uis.rankit.web.requestsAndResponses.CreateCalificacionRequest
import ar.edu.unq.uis.rankit.web.requestsAndResponses.EditCalificacionRequest
import ar.edu.unq.uis.rankit.web.requestsAndResponses.LogInRequest
import ar.edu.unq.uis.rankit.web.requestsAndResponses.LogInResponse
import ar.edu.unq.uis.rankit.web.requestsAndResponses.SignInRequest
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.json.JSONUtils
import ar.edu.unq.uis.rankit.web.requestsAndResponses.CreateCalificacionResponse

@Controller
class ControllerManager {
	extension JSONUtils = new JSONUtils

	val WebDataManager dataManager

	new() {
		this.dataManager = new WebDataManager()
	}

	// /////////////////////////////////////////////////////////////////////
	// ///////////////// USUARIOS /////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	
	// ingresar
	@Post("/usuarios")
	def signIn(@Body String body) {
		response.contentType = "application/json"
		try {
			var LogInRequest req = body.fromJson(typeof(LogInRequest))
			var user = this.dataManager.loguearUsuario(req)
			var LogInResponse res = new LogInResponse(user.id)
			ok(res.toJson)
		} catch (UsuarioNoEncontradoException e) {
			notFound(e.message)
		} catch (ContraseniaDeUsuarioIncorrectaException e) {
			badRequest(e.message)
		}
	}

	// ////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	// registrarse 
	@Put("/usuarios")
	def signUp(@Body String body) {
		response.contentType = "application/json"
		try {
			var SignInRequest req =  body.fromJson(typeof(SignInRequest))
			this.dataManager.registrarUsuario(req)
			ok()
		} catch (NombreDeUsuarioInvalidoException e) {
			badRequest(e.message)
		}
	}

	// /////////////////////////////////////////////////////////////////////
	// ///////////////// EVALUADOS ////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	
	@Get("/evaluados")
	def getEvaluados() {
		response.contentType = "application/json"
		var evaluados = this.dataManager.getEvaluados()
		ok(evaluados.toJson)
	}

	// /////////////////////////////////////////////////////////////////////
	// ///////////////// RANKING //////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	
	// devuelve los lugares y servicios con nombre, de tipo, con igual o mayor cantidad de calificaciones y ranking
	@Get("/ranking")
	def getRanking(String nombre, String tipo, String calificaciones, String ranking) {
		response.contentType = "application/json"
		var rankingFiltrado = dataManager.getRankingFilteredBy(nombre,tipo,calificaciones,ranking)
		ok(rankingFiltrado.toJson)
	}

	// /////////////////////////////////////////////////////////////////////
	// ///////////////// CALIFICACIONES ///////////////////////////////////
	// ///////////////////////////////////////////////////////////////////
	
	// Tiene que ser por ID
	@Get("/calificaciones")
	def getCalificacionesDelUsuario(String id) {
		response.contentType = "application/json"
		var calificacionesDelUsuario = this.dataManager.getCalificacionesDelUsuarioConId(Integer.valueOf(id))
		ok(calificacionesDelUsuario.toJson)
	}


	@Delete("/calificaciones")
	def deleteCalificacionById(String id) {
		response.contentType = "application/json"
		try {
			this.dataManager.deleteCalificacion(Integer.valueOf(id))
			ok()
		} catch (NumberFormatException e) {
			badRequest("El id \""+id+"\" no es un identificador válido para una calificación.")
		} catch (IdDeCalificacionInexistenteException e) {
			notFound(e.message)
		}
	}

	@Post("/calificaciones")
	def createCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var CreateCalificacionRequest req = body.fromJson(typeof(CreateCalificacionRequest))
			var idCalificacion = this.dataManager.createCalificacion(req)
			var CreateCalificacionResponse res = new CreateCalificacionResponse
			res.idCalificacion = idCalificacion
			ok(res.toJson)
		} catch (CalificacionCompletadaIncorrectamenteException e) {
			badRequest(e.message)
		}
	}

	@Put("/calificaciones")
	def editCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var EditCalificacionRequest req = body.fromJson(typeof(EditCalificacionRequest))
			this.dataManager.editCalificacion(req)
			ok()
		} catch (CalificacionCompletadaIncorrectamenteException e) {
			badRequest(e.message)
		} catch (IdDeCalificacionInexistenteException e) {
			notFound(e.message)
		}
	}

}

