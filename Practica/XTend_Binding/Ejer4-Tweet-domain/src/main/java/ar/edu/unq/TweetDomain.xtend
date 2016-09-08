package ar.edu.unq

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class TweetDomain {
	val Integer maxCaracteres = 140;
	
	var String tweet = "";
	var Integer caracteresRestantes = this.maxCaracteres;
	
	def void setTweet(String tweet) {
		this.tweet = tweet;
		this.caracteresRestantes = this.maxCaracteres - this.tweet.length();
	}
}