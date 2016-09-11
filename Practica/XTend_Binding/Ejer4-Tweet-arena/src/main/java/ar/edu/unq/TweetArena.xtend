package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label


class TweetArena extends MainWindow<TweetDomain> {
	
	new() {
		super(new TweetDomain)
	}
	
	override createContents(Panel mainPanel) {
		
		this.setTitle("Editor de Tweet");
		
		new Label(mainPanel).setText("Tweet");
		
		var box = new TweeterTextBox(mainPanel).setWidth(200).setHeight(100);
		box.bindValueToProperty("tweet");
				
		new Label(mainPanel) => [
			it.bindValueToProperty("caracteresRestantes")
			it.bindForegroundToProperty("color")
		]
	}
	
	def static void main(String[] args) {
		new TweetArena().startApplication();
	}	
	
}


