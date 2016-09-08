package ar.unq.edu.aritmetica;

import ar.edu.unq.aritmetica.Aritmetica;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;

@SuppressWarnings("all")
public class AritmeticaSinBotonWindow extends MainWindow<Aritmetica> {
  public AritmeticaSinBotonWindow() {
    super(new Aritmetica());
  }
  
  public void createContents(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method fireOnPropertyChange(String) is undefined for the type Label");
  }
  
  public static void main(final String[] args) {
    AritmeticaSinBotonWindow _aritmeticaSinBotonWindow = new AritmeticaSinBotonWindow();
    _aritmeticaSinBotonWindow.startApplication();
  }
}
