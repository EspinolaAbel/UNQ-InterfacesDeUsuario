package ar.unq.edu.aritmetica;

import ar.edu.unq.aritmetica.Aritmetica;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.NumericField;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class AritmeticaSinBotonWindow extends MainWindow<Aritmetica> {
  public AritmeticaSinBotonWindow() {
    super(new Aritmetica());
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
    _label_2.setText("Resultado:");
    Label _label_3 = new Label(mainPanel);
    ObservableValue<Control, ControlBuilder> _value_2 = _label_3.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_2, "resultado");
  }
  
  public static void main(final String[] args) {
    AritmeticaSinBotonWindow _aritmeticaSinBotonWindow = new AritmeticaSinBotonWindow();
    _aritmeticaSinBotonWindow.startApplication();
  }
}
