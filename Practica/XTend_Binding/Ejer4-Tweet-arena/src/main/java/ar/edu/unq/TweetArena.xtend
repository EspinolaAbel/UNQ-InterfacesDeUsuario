package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.KeyWordTextArea
import java.awt.Color
import org.uqbar.poo.aop.PropertySupport
import java.util.EventListener
import java.beans.PropertyChangeSupport

//import org.uqbar.arena.widgets.TextBox

class TweetArena extends MainWindow<TweetDomain> {
	
	val PropertyChangeSupport pcs = new PropertyChangeSupport(this);
	
	new() {
		super(new TweetDomain)
	}
	
	override createContents(Panel mainPanel) {
		
		this.setTitle("Editor de Tweet");
		
		new Label(mainPanel).setText("Tweet");
		
		var box = new KeyWordTextArea(mainPanel).setWidth(200).setHeight(100);
		box.bindValueToProperty("tweet");
				
		new Label(mainPanel) => [
			it.bindValueToProperty("caracteresRestantes")
			if(58<10) {
				setForeground(Color.RED)
			}
		];
	}
	
	def static void main(String[] args) {
		new TweetArena().startApplication();
	}	
	
}