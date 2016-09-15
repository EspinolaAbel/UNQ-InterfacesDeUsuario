package ar.edu.unq;

import ar.edu.unq.ContarDiasDomain;
import ar.edu.unq.DateTimeTransformer;
import org.eclipse.xtext.xbase.lib.ObjectExtensions;
import org.eclipse.xtext.xbase.lib.Procedures.Procedure1;
import org.uqbar.arena.widgets.Control;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;
import org.uqbar.lacar.ui.model.bindings.Binding;

@SuppressWarnings("all")
public class ContarDiasArena extends MainWindow<ContarDiasDomain> {
  public ContarDiasArena(final ContarDiasDomain model) {
    super(model);
    this.setTitle("Contar dias.");
  }
  
  public void createContents(final Panel mainPanel) {
    Label _label = new Label(mainPanel);
    final Procedure1<Label> _function = new Procedure1<Label>() {
      public void apply(final Label it) {
        it.setText("Fecha: (dd/MM/yyyy)");
      }
    };
    ObjectExtensions.<Label>operator_doubleArrow(_label, _function);
    TextBox _textBox = new TextBox(mainPanel);
    Binding<Object, Control, ControlBuilder> _bindValueToProperty = _textBox.<Object, ControlBuilder>bindValueToProperty("fecha");
    DateTimeTransformer _dateTimeTransformer = new DateTimeTransformer();
    _bindValueToProperty.setTransformer(_dateTimeTransformer);
    Label _label_1 = new Label(mainPanel);
    Binding<Object, Control, ControlBuilder> _bindValueToProperty_1 = _label_1.<Object, ControlBuilder>bindValueToProperty("otraFecha");
    DateTimeTransformer _dateTimeTransformer_1 = new DateTimeTransformer();
    _bindValueToProperty_1.setTransformer(_dateTimeTransformer_1);
  }
  
  public static void main(final String[] args) {
    ContarDiasDomain _contarDiasDomain = new ContarDiasDomain();
    ContarDiasArena _contarDiasArena = new ContarDiasArena(_contarDiasDomain);
    _contarDiasArena.startApplication();
  }
}
