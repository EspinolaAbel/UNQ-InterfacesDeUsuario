package ar.edu.unq;

import ar.edu.unq.TweetDomain;
import java.awt.Color;
import java.beans.PropertyChangeSupport;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.KeyWordTextArea;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class TweetArena extends MainWindow<TweetDomain> {
  private final PropertyChangeSupport pcs = new PropertyChangeSupport(this);
  
  public TweetArena() {
    super(new TweetDomain());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Editor de Tweet");
    Label _label = new Label(mainPanel);
    _label.setText("Tweet");
    KeyWordTextArea _keyWordTextArea = new KeyWordTextArea(mainPanel);
    Control _setWidth = _keyWordTextArea.setWidth(200);
    Control box = _setWidth.setHeight(100);
    box.<Object, ControlBuilder>bindValueToProperty("tweet");
    Label _label_1 = new Label(mainPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<Object, ControlBuilder>bindValueToProperty("caracteresRestantes");
        if ((58 < 10)) {
          it.setForeground(Color.RED);
        }
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function);
  }
  
  public static void main(final String[] args) {
    TweetArena _tweetArena = new TweetArena();
    _tweetArena.startApplication();
  }
}
