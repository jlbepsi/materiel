package materiel.command;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Command {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private long id;

  private String login;
  private java.sql.Timestamp date;


  public long getId() {
    return id;
  }
  public void setId(long id) {
    this.id = id;
  }

  public String getLogin() {
    return login;
  }
  public void setLogin(String login) {
    this.login = login;
  }

  public java.sql.Timestamp getDate() {
    return date;
  }
  public void setDate(java.sql.Timestamp date) {
    this.date = date;
  }
}
