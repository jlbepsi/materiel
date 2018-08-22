package materiel.emprunt;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

  @Id
  private String login;

  private String nom;
  private String prenom;
  private String classe;

  public String getLogin() {
    return login;
  }
  public void setLogin(String login) {
    this.login = login;
  }

  public String getPrenom() {
    return prenom;
  }
  public void setPrenom(String prenom) {
    this.prenom = prenom;
  }

  public String getNom() {
    return nom;
  }
  public void setNom(String nom) {
    this.nom = nom;
  }

  public String getNomComplet() {
    return nom + " " + prenom;
  }

  public String getClasse() {
    return classe;
  }
  public void setClasse(String classe) {
    this.classe = classe;
  }

}
