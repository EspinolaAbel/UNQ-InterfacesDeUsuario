package ar.edu.unq

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.lang.reflect.Array

@Accessors
@Observable
class PalabrasDomain {
	
	var String palabra;
	var String palabraAlReves;
	
	def void setPalabra(String palabra) {
		this.palabra = palabra;
		this.palabraAlReves = invertirPalabra(palabra);
	}
	
	def invertirPalabra(String aWord) {
		var Integer i;
		var pal = aWord.toCharArray();
		var lap = new Array(6);

		
		for(i=0; i<=aWord.length(); i++) {
			this.palabraAlReves[i] = pal[i];
		}
	}
	
}