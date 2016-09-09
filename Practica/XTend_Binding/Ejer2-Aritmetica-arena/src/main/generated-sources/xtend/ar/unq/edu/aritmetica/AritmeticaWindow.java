package ar.unq.edu.aritmetica;

import ar.edu.unq.aritmetica.AritmeticaSinBoton;
import org.uqbar.arena.widgets.Panel;
import org.uqbar.arena.windows.MainWindow;

@SuppressWarnings("all")
public class AritmeticaWindow extends MainWindow<AritmeticaSinBoton> {
  public AritmeticaWindow() {
    super(new AritmeticaSinBoton());
    this.setTitle("Sacar la cuenta");
  }
  
  public void createContents(final Panel mainPanel) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method calcularOperacion() is undefined for the type AritmeticaSinBoton");
  }
  
  public static void main(final String[] args) {
    AritmeticaWindow _aritmeticaWindow = new AritmeticaWindow();
    _aritmeticaWindow.startApplication();
  }
}
