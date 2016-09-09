package ar.edu.unq;

import java.awt.Color;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class TweetDomain {
  private final Integer maxCaracteres = Integer.valueOf(140);
  
  private String tweet;
  
  private Integer caracteresRestantes;
  
  private Color color;
  
  public TweetDomain() {
    this.tweet = "";
    this.caracteresRestantes = this.maxCaracteres;
    this.color = Color.BLACK;
  }
  
  public void setTweet(final String tweet) {
    this.tweet = tweet;
    int _length = this.tweet.length();
    int _minus = ((this.maxCaracteres).intValue() - _length);
    this.caracteresRestantes = Integer.valueOf(_minus);
    this.isMenosDeCincoCaracteresRestantes();
  }
  
  public Color isMenosDeCincoCaracteresRestantes() {
    Color _xifexpression = null;
    if (((this.caracteresRestantes).intValue() < 5)) {
      _xifexpression = this.color = Color.RED;
    } else {
      _xifexpression = this.color = Color.BLACK;
    }
    return _xifexpression;
  }
  
  @Pure
  public Integer getMaxCaracteres() {
    return this.maxCaracteres;
  }
  
  @Pure
  public String getTweet() {
    return this.tweet;
  }
  
  @Pure
  public Integer getCaracteresRestantes() {
    return this.caracteresRestantes;
  }
  
  public void setCaracteresRestantes(final Integer caracteresRestantes) {
    this.caracteresRestantes = caracteresRestantes;
  }
  
  @Pure
  public Color getColor() {
    return this.color;
  }
  
  public void setColor(final Color color) {
    this.color = color;
  }
}
