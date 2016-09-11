package ar.edu.unq;

import ar.edu.unq.ConversionDomain;
import org.uqbar.arena.widgets.Label;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;
import org.uqbar.arena.windows.MainWindow;
import org.uqbar.lacar.ui.model.ControlBuilder;

@SuppressWarnings("all")
public class ConversionArena extends MainWindow<ConversionDomain> {
  public ConversionArena(final ConversionDomain model) {
    super(model);
  }
  
  public void createContents(final Panel mainPanel) {
    Label _label = new Label(mainPanel);
    _label.setText("Celsius");
    TextBox _textBox = new TextBox(mainPanel);
    _textBox.<Object, ControlBuilder>bindValueToProperty("celsius");
    Label _label_1 = new Label(mainPanel);
    _label_1.setText("Fahrenheit");
    TextBox _textBox_1 = new TextBox(mainPanel);
    _textBox_1.<Object, ControlBuilder>bindValueToProperty("fahrenheit");
  }
  
  public static void main(final String[] args) {
    ConversionDomain _conversionDomain = new ConversionDomain();
    ConversionArena _conversionArena = new ConversionArena(_conversionDomain);
    _conversionArena.startApplication();
  }
}
