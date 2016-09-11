package ar.edu.unq;

import org.uqbar.arena.filters.TextFilter;
import org.uqbar.arena.widgets.TextInputEvent;

@SuppressWarnings("all")
public class CaracteresFilter implements TextFilter {
  public boolean accept(final TextInputEvent event) {
    String _potentialTextResult = event.getPotentialTextResult();
    int _length = _potentialTextResult.length();
    return (_length <= 140);
  }
}
