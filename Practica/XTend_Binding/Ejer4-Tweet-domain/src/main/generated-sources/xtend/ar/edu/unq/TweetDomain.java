package ar.edu.unq;

import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;
import org.uqbar.commons.utils.Observable;

@Accessors
@Observable
@SuppressWarnings("all")
public class TweetDomain {
  private final Integer maxCaracteres = Integer.valueOf(140);
  
  private String tweet = "";
  
  private Integer caracteresRestantes = this.maxCaracteres;
  
  public void setTweet(final String tweet) {
    this.tweet = tweet;
    int _length = this.tweet.length();
    int _minus = ((this.maxCaracteres).intValue() - _length);
    this.caracteresRestantes = Integer.valueOf(_minus);
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
}
