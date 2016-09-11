package ar.edu.unq;

import ar.edu.unq.CaracteresFilter;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.widgets.TextBox;

@SuppressWarnings("all")
public class TweeterTextBox extends TextBox {
  public TweeterTextBox(final Panel container) {
    super(container);
    CaracteresFilter _caracteresFilter = new CaracteresFilter();
    this.withFilter(_caracteresFilter);
    this.setMultiLine(true);
  }
}
