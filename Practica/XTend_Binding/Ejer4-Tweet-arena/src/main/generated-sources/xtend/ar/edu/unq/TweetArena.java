package ar.edu.unq;

import ar.edu.unq.TweetDomain;
import ar.edu.unq.TweeterTextBox;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class TweetArena extends MainWindow<TweetDomain> {
  public TweetArena() {
    super(new TweetDomain());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Editor de Tweet");
    Label _label = new Label(mainPanel);
    _label.setText("Tweet");
    TweeterTextBox _tweeterTextBox = new TweeterTextBox(mainPanel);
    Control _setWidth = _tweeterTextBox.setWidth(200);
    Control box = _setWidth.setHeight(100);
    box.<Object, ControlBuilder>bindValueToProperty("tweet");
    Label _label_1 = new Label(mainPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<Object, ControlBuilder>bindValueToProperty("caracteresRestantes");
        it.<ControlBuilder, Object, Object>bindForegroundToProperty("color");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
  }
  
  public static void main(final String[] args) {
    TweetArena _tweetArena = new TweetArena();
    _tweetArena.startApplication();
  }
}
