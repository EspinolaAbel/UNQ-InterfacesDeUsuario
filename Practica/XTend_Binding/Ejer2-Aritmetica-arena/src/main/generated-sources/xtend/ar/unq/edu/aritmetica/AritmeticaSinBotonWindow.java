package ar.unq.edu.aritmetica;

import ar.edu.unq.aritmetica.AritmeticaSinBoton;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.NumericField;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class AritmeticaSinBotonWindow extends MainWindow<AritmeticaSinBoton> {
  public AritmeticaSinBotonWindow() {
    super(new AritmeticaSinBoton());
  }
  
  public void createContents(final Panel mainPanel) {
    this.setTitle("Sacar la cuenta");
    Label _label = new Label(mainPanel);
    _label.setText("Operando 1:");
    NumericField _numericField = new NumericField(mainPanel);
    ObservableValue<Control, ControlBuilder> _value = _numericField.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value, "num1");
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Operando 2:");
    NumericField _numericField_1 = new NumericField(mainPanel);
    ObservableValue<Control, ControlBuilder> _value_1 = _numericField_1.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_1, "num2");
    Label _label_2 = new Label(mainPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<ControlBuilder>bindVisibleToProperty("puedeOperar");
        it.setText("Resultado:");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_2, _function);
    Label _label_3 = new Label(mainPanel);
    final Procedure1<Label> _function_1 = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.<ControlBuilder>bindVisibleToProperty("puedeOperar");
        ObservableValue<Control, ControlBuilder> _value = it.<ControlBuilder>value();
        ArenaXtendExtensions.operator_spaceship(_value, "resultadoOperacion");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label_3, _function_1);
  }
  
  public static void main(final String[] args) {
    AritmeticaSinBotonWindow _aritmeticaSinBotonWindow = new AritmeticaSinBotonWindow();
    _aritmeticaSinBotonWindow.startApplication();
  }
}
