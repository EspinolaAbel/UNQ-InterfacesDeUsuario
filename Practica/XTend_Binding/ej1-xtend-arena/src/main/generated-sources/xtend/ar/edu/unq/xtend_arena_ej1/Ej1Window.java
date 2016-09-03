package ar.edu.unq.xtend_arena_ej1;

import ar.edu.unq.domain_ej1.Ej1Domain;
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
public class Ej1Window extends MainWindow<Ej1Domain> {
  public Ej1Window() {
    super(new Ej1Domain());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Mostrar nombre");
    Label _label = new Label(mainPanel);
    _label.setText("Nombre");
    String n = null;
    String a = null;
    TextBox _textBox = new TextBox(mainPanel);
    final Procedure1<TextBox> _function = new Procedure1<TextBox>() {
      public void apply(final TextBox it) {
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "nombre");
      }
    };
    ObjectExtensions.<TextBox>operator_doubleArrow(_textBox, _function);
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Apellido");
    TextBox _textBox_1 = new TextBox(mainPanel);
    ObservableValue<Control, ControlBuilder> _value = _textBox_1.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value, "apellido");
    String saludo = ((("Hola " + n) + " ") + a);
    new Label(mainPanel);
  }
  
  public static void main(final String[] args) {
    Ej1Window _ej1Window = new Ej1Window();
    _ej1Window.startApplication();
  }
}
