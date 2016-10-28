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
import ar.edu.unq.uis.rankit.web.requestsAndResponses.SignUpRequest
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


//	SERVICIOS USUARIOS:
//	------------------

	@Post("/usuarios")
	def logIn(@Body String body) {
		response.contentType = "application/json"
		try {
			var LogInRequest req = body.fromJson(typeof(LogInRequest))
			var LogInResponse res = this.dataManager.loguearUsuario(req)
			ok(res.toJson)
		} catch (UsuarioNoEncontradoException e) {
			notFound("{ error: \""+e.message+"\" }")
		} catch (ContraseniaDeUsuarioIncorrectaException e) {
			badRequest("{ error: \""+e.message+"\" }")
		}
	}

	
	@Put("/usuarios")
	def signUp(@Body String body) {
		response.contentType = "application/json"
		try {
			var SignUpRequest req =  body.fromJson(typeof(SignUpRequest))
			this.dataManager.registrarUsuario(req)
			ok()
		} catch (NombreDeUsuarioInvalidoException e) {
			badRequest("{ error: \""+e.message+"\" }")
		} catch (ContraseniaDeUsuarioIncorrectaException e) {
			badRequest("{ error: \""+e.message+"\" }")
		}
	}


//	SERVICIOS EVALUADOS:
//	-------------------

	@Get("/evaluados")
	def getEvaluados() {
		response.contentType = "application/json"
		var evaluados = this.dataManager.getEvaluados()
		ok(evaluados.toJson)
	}
	

//	SERVICIOS RANKING:
//	-----------------
	
	@Get("/ranking")
	def getRanking(String nombre, String tipo, String calificaciones, String ranking) {
		response.contentType = "application/json"
		var rankingFiltrado = dataManager.getRankingFilteredBy(nombre,tipo,calificaciones,ranking)
		ok(rankingFiltrado.toJson)
	}


//	SERVICIOS CALIFICACIONES:
//	------------------------

	@Post("/calificaciones")
	def createCalificacion(@Body String body) {
		response.contentType = "application/json"
		try {
			var CreateCalificacionRequest req = body.fromJson(typeof(CreateCalificacionRequest))
			var CreateCalificacionResponse res = this.dataManager.createCalificacion(req)
			ok(res.toJson)
		} catch (CalificacionCompletadaIncorrectamenteException e) {
			badRequest("{ error: \""+e.message+"\" }")
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
			badRequest("{ error: \""+e.message+"\" }")
		} catch (IdDeCalificacionInexistenteException e) {
			notFound("{ error: \""+e.message+"\" }")
		}
	}

	@Delete("/calificaciones")
	def deleteCalificacionById(String id) {
		response.contentType = "application/json"
		try {
			this.dataManager.deleteCalificacion(Integer.valueOf(id))
			ok()
		} catch (NumberFormatException e) {
			badRequest("{ error: \"El id \""+id+"\" no es un identificador válido para una calificación\". }")
		} catch (IdDeCalificacionInexistenteException e) {
			notFound("{ error: \""+e.message+"\" }")
		}
	}
	
	@Get("/calificaciones")
	def getCalificacionesDelUsuario(String id) {
		response.contentType = "application/json"
		var calificacionesDelUsuario = this.dataManager.getCalificacionesDelUsuarioConId(Integer.valueOf(id))
		ok(calificacionesDelUsuario.toJson)
	}
//	
//	def static void main(String[] a) {
//		var String json = "{ id_calificacion: \"1\", detalle:\"deetalle\", puntaje: \"10\" }"
//		var a = json.fromJson(typeof(EditCalificacionRequest))
//	}
}

