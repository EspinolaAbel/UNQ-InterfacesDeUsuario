package ar.edu.unq

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import static org.uqbar.commons.model.ObservableUtils.*
import java.awt.Color

@Accessors
@Observable
class TweetDomain {
	val Integer maxCaracteres = 140;
	
	var String tweet
	var Integer caracteresRestantes
	var Color color
	
	new() {
		tweet = ""
		caracteresRestantes = this.maxCaracteres;
		color = Color.BLACK
	}
	
	def void setTweet(String tweet) {
		this.tweet = tweet;
		this.caracteresRestantes = this.maxCaracteres - this.tweet.length();
		this.isMenosDeCincoCaracteresRestantes()
	}

	
	def isMenosDeCincoCaracteresRestantes() {
		if(this.caracteresRestantes < 5)
			this.color = Color.RED
		else
			this.color = Color.BLACK
	}
}