package ar.edu.unq.uis.rankIt.bootstrap

import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.utils.ApplicationContext
import ar.edu.unq.uis.rankIt.dominio.Publicacion
import ar.edu.unq.uis.rankIt.dominio.Calificacion
import ar.edu.unq.uis.rankIt.dominio.Usuario
import ar.edu.unq.uis.rankIt.dominio.AdministradorGeneral
import org.joda.time.DateTime

class BootstrapRankit  extends CollectionBasedBootstrap {
	
	new(){
		ApplicationContext.instance => [
			configureSingleton(typeof(AdministradorGeneral), new AdministradorGeneral)
			this.adminGral = ApplicationContext.instance.getSingleton(typeof(AdministradorGeneral)) as AdministradorGeneral
		]
	}
	
	override run() {
		this.cargarServicios()
		this.cargarLugares()
		this.cargarCalificaciones()
		this.cargarUsuarios()
	}
	 
	def cargarServicios() {
		this.servicioElNoble.estaHabilitado = false
		this.servicioCablevision.estaHabilitado = false
		this.servicioCinemark.estaHabilitado = false
		this.servicioAYSA.estaHabilitado = true
		this.servicioCorreoArgentino.estaHabilitado = true
		this.servicioEdesur.estaHabilitado = true
		this.servicioFibertel.estaHabilitado = true
		this.servicioMulticanal.estaHabilitado = true
		this.servicioSpeedy.estaHabilitado = true
		this.servicioTelefonica.estaHabilitado = true
		
				 
		adminGral.adminServicios => [
			it.agregar(servicioSpeedy)
			it.agregar(servicioMulticanal)
			it.agregar(servicioTelefonica)
			it.agregar(servicioFibertel)
			it.agregar(servicioAYSA)
			it.agregar(servicioCablevision)
			it.agregar(servicioCorreoArgentino)
			it.agregar(servicioCinemark)
			it.agregar(servicioEdesur)
			it.agregar(servicioElNoble)
		]	
	}
	
	def cargarLugares() {
		this.lugarDisney.estaHabilitado = false
		this.lugarBariloche.estaHabilitado = false
		this.lugarParquePereyra.estaHabilitado = false
		this.lugarBerazategui.estaHabilitado = true
		this.lugarCataratas.estaHabilitado = true
		this.lugarEzpeleta.estaHabilitado = true
		this.lugarParqueDeLaCosta.estaHabilitado = true
		this.lugarPuertoMadero.estaHabilitado = true
		this.lugarQuilmes.estaHabilitado = true
		this.lugarTecnopolis.estaHabilitado = true
		
		
		adminGral.adminLugares => [
			calificacion01.esOfensiva = true
			it.agregar(lugarQuilmes)
			it.agregar(lugarBerazategui)
			it.agregar(lugarEzpeleta)
			it.agregar(lugarBariloche)
			it.agregar(lugarCataratas)
			it.agregar(lugarDisney)
			it.agregar(lugarParqueDeLaCosta)
			it.agregar(lugarParquePereyra)
			it.agregar(lugarPuertoMadero)
			it.agregar(lugarTecnopolis)
		]
	}
	
	/** Con este método creo referencias de todas las listas de {@link Publicacion}es en {@link AdministradorDeCalificaciones}.
	 * NOTA: Referencio a dichas listas en vez de copiarlas a una lista nueva en {@link AdministradorDeCalificaciones}. Esto tiene
	 * 		la ventaja de que en caso de crearse una nueva {@link Publicacion}, como estoy referenciando a la lista que la contiene,
	 * 		también podré acceder a ella desde el {@link AdministradorDeCalificaciones}. */
	def cargarCalificaciones() {
		adminGral.adminCalificaciones => [
			it.servicios = adminGral.adminServicios.publicaciones
			it.lugares	 = adminGral.adminLugares.publicaciones
			
			calificacion01.fecha = new DateTime(2005, 1, 1, 0, 0)
			calificacion02.fecha = new DateTime(2005, 2, 2, 0, 0)
			calificacion03.fecha = new DateTime(2005, 3, 3, 0, 0)
			calificacion04.fecha = new DateTime(2005, 4, 4, 0, 0)
			calificacion05.fecha = new DateTime(2005, 5, 5, 0, 0)
			calificacion06.fecha = new DateTime(2005, 6, 6, 0, 0)
			calificacion07.fecha = new DateTime(2005, 7, 7, 0, 0)
			calificacion08.fecha = new DateTime(2005, 8, 8, 0, 0)
			calificacion09.fecha = new DateTime(2005, 9, 9, 0, 0)
			calificacion10.fecha = new DateTime(2005, 10, 10, 0, 0)
			calificacion11.fecha = new DateTime(2005, 11, 11, 0, 0)
			calificacion12.fecha = new DateTime(2005, 12, 12, 0, 0)
			calificacion13.fecha = new DateTime(2006, 1, 1, 0, 0)
			calificacion14.fecha = new DateTime(2006, 2, 2, 0, 0)
			calificacion15.fecha = new DateTime(2006, 3, 3, 0, 0)
			calificacion16.fecha = new DateTime(2006, 4, 4, 0, 0)
			calificacion17.fecha = new DateTime(2006, 5, 5, 0, 0)
			calificacion18.fecha = new DateTime(2006, 6, 6, 0, 0)
			calificacion19.fecha = new DateTime(2006, 7, 7, 0, 0)
			calificacion20.fecha = new DateTime(2006, 8, 8, 0, 0)
			calificacion21.fecha = new DateTime(2006, 9, 9, 0, 0)
			calificacion22.fecha = new DateTime(2006, 10, 10, 0, 0)
			calificacion23.fecha = new DateTime(2006, 11, 11, 0, 0)
			calificacion24.fecha = new DateTime(2006, 12, 12, 0, 0)
			calificacion25.fecha = new DateTime(2007, 1, 1, 0, 0)
			calificacion26.fecha = new DateTime(2007, 2, 2, 0, 0)
			calificacion27.fecha = new DateTime(2007, 3, 3, 0, 0)
			calificacion28.fecha = new DateTime(2007, 4, 4, 0, 0)
			calificacion29.fecha = new DateTime(2007, 5, 5, 0, 0)
			calificacion30.fecha = new DateTime(2007, 6, 6, 0, 0)
			calificacion31.fecha = new DateTime(2007, 7, 7, 0, 0)
			calificacion32.fecha = new DateTime(2007, 8, 8, 0, 0)
			calificacion33.fecha = new DateTime(2007, 9, 9, 0, 0)
			calificacion34.fecha = new DateTime(2007, 10, 10, 0, 0)
			calificacion35.fecha = new DateTime(2007, 11, 11, 0, 0)
			calificacion36.fecha = new DateTime(2007, 12, 12, 0, 0)
			
			it.agregarCalificacion(calificacion01)
			it.agregarCalificacion(calificacion02)
			it.agregarCalificacion(calificacion03)
			it.agregarCalificacion(calificacion04)
			it.agregarCalificacion(calificacion05)
			it.agregarCalificacion(calificacion06)
			it.agregarCalificacion(calificacion07)
			it.agregarCalificacion(calificacion08)
			it.agregarCalificacion(calificacion09)
			it.agregarCalificacion(calificacion10)
			it.agregarCalificacion(calificacion11)
			it.agregarCalificacion(calificacion12)
			it.agregarCalificacion(calificacion13)
			it.agregarCalificacion(calificacion14)
			it.agregarCalificacion(calificacion15)
			it.agregarCalificacion(calificacion16)
			it.agregarCalificacion(calificacion17)
			it.agregarCalificacion(calificacion18)
			it.agregarCalificacion(calificacion19)
			it.agregarCalificacion(calificacion20)
			it.agregarCalificacion(calificacion21)
			it.agregarCalificacion(calificacion22)
			it.agregarCalificacion(calificacion23)
			it.agregarCalificacion(calificacion24)
			it.agregarCalificacion(calificacion25)
			it.agregarCalificacion(calificacion26)
			it.agregarCalificacion(calificacion27)
			it.agregarCalificacion(calificacion28)
			it.agregarCalificacion(calificacion29)
			it.agregarCalificacion(calificacion30)
			it.agregarCalificacion(calificacion31)
			it.agregarCalificacion(calificacion32)
			it.agregarCalificacion(calificacion33)
			it.agregarCalificacion(calificacion34)
			it.agregarCalificacion(calificacion35)
			it.agregarCalificacion(calificacion36)
		]	
	}
	
	def cargarUsuarios() {	 
		adminGral.adminUsuarios => [
			agregarUsuario(usuarioPepe)
			agregarUsuario(usuarioLuis)
			agregarUsuario(usuarioMarcos) 
		]	
	}


//	SERVICIOS:
	
	//HABILITADOS:
	var servicioFibertel = new Publicacion("Fibertel", "Servicio")
	var servicioSpeedy = new Publicacion("Speedy", "Servicio")
	var servicioMulticanal = new Publicacion("Multicanal", "Servicio")
	var servicioTelefonica = new Publicacion("Telefonica", "Servicio")
	var servicioEdesur = new Publicacion("Edesur", "Servicio")
	//HABILITADOS Y SIN CALIFICACIONES:
	var servicioAYSA = new Publicacion("AYSA-HabSinCalif-", "Servicio")
	var servicioCorreoArgentino = new Publicacion("Correo Argentino-HabSinCalif-", "Servicio")
	//NO HABILITADOS:
	var servicioElNoble = new Publicacion("El Noble-NoHab-", "Servicio")
	var servicioCablevision = new Publicacion("Cablevision-NoHab-", "Servicio")
	var servicioCinemark = new Publicacion("Cinemark-NoHab-", "Servicio")

//	LUGARES:
	
	//HABILITADOS
	var lugarQuilmes = new Publicacion("Quilmes", "Lugar")
	var lugarBerazategui = new Publicacion("Berazategui", "Lugar")
	var lugarEzpeleta = new Publicacion("Ezpeleta", "Lugar")
	var lugarParqueDeLaCosta = new Publicacion("Parque de la Costa", "Lugar")
	var lugarTecnopolis = new Publicacion("Tecnopolis", "Lugar")
	//HABILITADOS Y SIN CALIFICACIONES:	
	var lugarPuertoMadero = new Publicacion("Puerto Madero-HabSinCalif-", "Lugar")
	var lugarCataratas = new Publicacion("Cataratas-HabSinCalif-", "Lugar")
	//NO HABILITADOS
	var lugarDisney = new Publicacion("Disney-NoHab-", "Lugar")
	var lugarBariloche = new Publicacion("Bariloche-NoHab-", "Lugar")
	var lugarParquePereyra = new Publicacion("Parque Pereyra-NoHab-", "Lugar")

//	USUARIOS:

	var usuarioPepe = new Usuario("pepe", Usuario.contraseniaDefault)
	var usuarioLuis = new Usuario("Luis", Usuario.contraseniaDefault)
	var usuarioMarcos = new Usuario("Marcos", Usuario.contraseniaDefault)

//	CALIFICACIONES:
	
	var calificacion01 = new Calificacion(servicioFibertel,		usuarioPepe, 	0, "Este es el detalle para la calificación de una publicacion")
	var calificacion02 = new Calificacion(servicioFibertel,		usuarioLuis, 	1, "Este es el detalle para la calificación de una publicacion")
	var calificacion03 = new Calificacion(servicioFibertel, 	usuarioMarcos, 	2, "Este es el detalle para la calificación de una publicacion")
	var calificacion04 = new Calificacion(servicioSpeedy,		usuarioPepe, 	3, "Este es el detalle para la calificación de una publicacion")
	var calificacion05 = new Calificacion(servicioSpeedy,	 	usuarioLuis, 	4, "Este es el detalle para la calificación de una publicacion")
	var calificacion06 = new Calificacion(servicioMulticanal, 	usuarioMarcos, 	5, "Este es el detalle para la calificación de una publicacion")
	var calificacion07 = new Calificacion(servicioTelefonica,	usuarioPepe, 	6, "Este es el detalle para la calificación de una publicacion")
	var calificacion08 = new Calificacion(servicioTelefonica,	usuarioPepe, 	7, "Este es el detalle para la calificación de una publicacion")
	var calificacion09 = new Calificacion(servicioTelefonica, 	usuarioPepe, 	8, "Este es el detalle para la calificación de una publicacion")
	var calificacion10 = new Calificacion(servicioEdesur, 		usuarioPepe, 	9, "Este es el detalle para la calificación de una publicacion")
	var calificacion11 = new Calificacion(servicioEdesur,		usuarioLuis, 	10, "Este es el detalle para la calificación de una publicacion")
	var calificacion12 = new Calificacion(servicioTelefonica, 	usuarioMarcos, 	1, "Este es el detalle para la calificación de una publicacion")
	var calificacion13 = new Calificacion(servicioElNoble, 		usuarioPepe, 	2, "Este es el detalle para la calificación de una publicacion")
	var calificacion14 = new Calificacion(servicioElNoble, 		usuarioLuis, 	3, "Este es el detalle para la calificación de una publicacion")
	var calificacion15 = new Calificacion(servicioElNoble,		usuarioMarcos, 	4, "Este es el detalle para la calificación de una publicacion")
	var calificacion16 = new Calificacion(servicioCablevision,	usuarioPepe, 	5, "Este es el detalle para la calificación de una publicacion")
	var calificacion17 = new Calificacion(servicioCablevision,	usuarioLuis, 	6, "Este es el detalle para la calificación de una publicacion")
	var calificacion18 = new Calificacion(servicioCinemark, 	usuarioMarcos, 	7, "Este es el detalle para la calificación de una publicacion")
	var calificacion19 = new Calificacion(lugarQuilmes, 		usuarioPepe, 	8, "Este es el detalle para la calificación de una publicacion")
	var calificacion20 = new Calificacion(lugarQuilmes, 		usuarioPepe, 	9, "Este es el detalle para la calificación de una publicacion")
	var calificacion21 = new Calificacion(lugarQuilmes,			usuarioPepe, 	10, "Este es el detalle para la calificación de una publicacion")
	var calificacion22 = new Calificacion(lugarBerazategui,		usuarioPepe, 	0, "Este es el detalle para la calificación de una publicacion")
	var calificacion23 = new Calificacion(lugarBerazategui,		usuarioLuis, 	1, "Este es el detalle para la calificación de una publicacion")
	var calificacion24 = new Calificacion(lugarEzpeleta,		usuarioMarcos, 	2, "Este es el detalle para la calificación de una publicacion")
	var calificacion25 = new Calificacion(lugarParqueDeLaCosta,	usuarioPepe, 	3, "Este es el detalle para la calificación de una publicacion")
	var calificacion26 = new Calificacion(lugarParqueDeLaCosta,	usuarioLuis, 	4, "Este es el detalle para la calificación de una publicacion")
	var calificacion27 = new Calificacion(lugarParqueDeLaCosta,	usuarioMarcos, 	5, "Este es el detalle para la calificación de una publicacion")
	var calificacion28 = new Calificacion(lugarTecnopolis, 		usuarioPepe, 	6, "Este es el detalle para la calificación de una publicacion")
	var calificacion29 = new Calificacion(lugarTecnopolis,		usuarioLuis, 	7, "Este es el detalle para la calificación de una publicacion")
	var calificacion30 = new Calificacion(lugarDisney,			usuarioMarcos, 	8, "Este es el detalle para la calificación de una publicacion")
	var calificacion31 = new Calificacion(lugarBariloche,		usuarioPepe, 	9, "Este es el detalle para la calificación de una publicacion")
	var calificacion32 = new Calificacion(lugarBariloche,		usuarioPepe, 	10, "Este es el detalle para la calificación de una publicacion")
	var calificacion33 = new Calificacion(lugarBariloche,		usuarioLuis, 	0, "Este es el detalle para la calificación de una publicacion")
	var calificacion34 = new Calificacion(lugarParquePereyra,	usuarioMarcos, 	1, "Este es el detalle para la calificación de una publicacion")
	var calificacion35 = new Calificacion(lugarParquePereyra,	usuarioPepe, 	2, "Este es el detalle para la calificación de una publicacion")
	var calificacion36 = new Calificacion(lugarDisney,			usuarioPepe, 	3, "Este es el detalle para la calificación de una publicacion")
	
	
	
	var AdministradorGeneral adminGral

}
