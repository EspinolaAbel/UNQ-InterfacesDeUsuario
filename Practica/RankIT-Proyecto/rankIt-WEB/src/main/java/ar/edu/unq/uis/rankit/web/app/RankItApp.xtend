package ar.edu.unq.uis.rankit.web.app

import org.uqbar.xtrest.api.XTRest
import ar.edu.unq.uis.rankIt.bootstrap.BootstrapRankit
import ar.edu.unq.uis.rankit.web.controller.ControllerManager

class RankItApp {

	def static void main(String[] args) {

		var bootstrap = new BootstrapRankit()
		bootstrap.run()
		
		XTRest.startInstance(new ControllerManager(), 9000)
	}
}