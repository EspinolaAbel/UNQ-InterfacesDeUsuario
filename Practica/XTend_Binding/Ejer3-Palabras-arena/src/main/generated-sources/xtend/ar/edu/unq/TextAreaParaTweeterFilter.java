package ar.edu.unq;

import org.uqbar.arena.filters.TextFilter;
import org.uqbar.arena.widgets.TextInputEvent;

@SuppressWarnings("all")
public class TextAreaParaTweeterFilter implements TextFilter {
  public boolean accept(final TextInputEvent event) {
    String _potentialTextResult = event.getPotentialTextResult();
    return _potentialTextResult.matches("[0-9,.]*");
  }
}
