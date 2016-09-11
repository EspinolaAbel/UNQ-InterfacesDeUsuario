package ar.edu.unq

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*

@Accessors
@Observable
class ConversionDomain {
	var Double celsius
	var Double fahrenheit
	
	def void setCelsius(Double temp) {
		this.celsius = temp
		this.fahrenheit = this.celsius * 1.96
	}

	def void setFahrenheit(Double temp) {
		this.fahrenheit = temp
		this.celsius = this.fahrenheit / 1.96
	}
	
}