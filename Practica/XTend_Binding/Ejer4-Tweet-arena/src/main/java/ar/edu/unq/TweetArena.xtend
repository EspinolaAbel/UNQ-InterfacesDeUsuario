package ar.edu.unq

import org.uqbar.arena.windows.MainWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.KeyWordTextArea
import org.uqbar.arena.widgets.NumericField
import org.uqbar.lacar.ui.model.ControlBuilder
import org.uqbar.lacar.ui.model.PanelBuilder
import org.uqbar.lacar.ui.model.builder.StyledControlBuilder
import org.uqbar.arena.filters.TextFilter
import org.uqbar.arena.widgets.TextInputEvent

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


//class TextAreaParaTweeter extends KeyWordTextArea {
//	
//	new(Panel container) {
//		super(container)
//	}
//
//	override ControlBuilder createBuilder(PanelBuilder container) {
//		StyledControlBuilder numericField = container.addNumericField(withDecimals);
//		this.withFilter(new NumericFilter());
//		this.configureSkineableBuilder(numericField);
//		return numericField;
//	}
//}


