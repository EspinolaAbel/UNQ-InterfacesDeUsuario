package ar.edu.unq;

import ar.edu.unq.PalabrasDomain;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class PalabrasWindow extends MainWindow<PalabrasDomain> {
  public PalabrasWindow() {
    super(new PalabrasDomain());
    this.setTitle("Inversor de palabras");
  }
  
  public void createContents(final Panel mainPanel) {
    Label _label = new Label(mainPanel);
    _label.setText("Frase");
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        it.setWidth(250);
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "palabra");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Label _label_1 = new Label(mainPanel);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<ControlBuilder, Object, Object>bindForegroundToProperty("color");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "palabraInvertida");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_1, _function_1);
  }
  
  public static void main(final String[] args) {
    PalabrasWindow _palabrasWindow = new PalabrasWindow();
    _palabrasWindow.startApplication();
  }
}
