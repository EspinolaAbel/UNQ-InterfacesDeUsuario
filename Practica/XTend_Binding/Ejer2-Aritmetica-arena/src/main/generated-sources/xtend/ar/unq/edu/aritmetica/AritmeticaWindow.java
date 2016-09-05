package ar.unq.edu.aritmetica;

import ar.edu.unq.aritmetica.Aritmetica;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.bindings.ObservableValue;
import org.uqbar.arena.widgets.Button;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.NumericField;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.arena.xtend.ArenaXtendExtensions;
import org.uqbar.lacar.ui.model.Action;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class AritmeticaWindow extends MainWindow<Aritmetica> {
  public AritmeticaWindow() {
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
    Button _button = new Button(mainPanel);
    final Procedure1<Button> _function = new Procedure1<Button>() {
      public void apply(final Button it) {
        it.setCaption("*");
        final Action _function = new Action() {
          public void execute() {
            Aritmetica _modelObject = AritmeticaWindow.this.getModelObject();
            _modelObject.multiplicar();
          }
        };
        it.onClick(_function);
      }
    };
    ObjectExtensions.<Button>operator_doubleArrow(_button, _function);
    Label _label_2 = new Label(mainPanel);
    ObservableValue<Control, ControlBuilder> _value_2 = _label_2.<ControlBuilder>value();
    ArenaXtendExtensions.operator_spaceship(_value_2, "resultado");
  }
  
  public static void main(final String[] args) {
    AritmeticaWindow _aritmeticaWindow = new AritmeticaWindow();
    _aritmeticaWindow.startApplication();
  }
}
