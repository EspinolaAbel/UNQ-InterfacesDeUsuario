package ar.edu.unq

import org.joda.time.DateTime
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.joda.time.Interval

@Accessors
@Observable
class ContarDiasDomain {
	var Integer cantidadDeDias
	var DateTime fecha = new DateTime()
	var DateTime otraFecha 
	
	def void setFecha(DateTime fecha) {
		this.fecha = fecha
		this.otraFecha = fecha
	}
	

}