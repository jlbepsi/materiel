package materiel.portable;


import materiel.emprunt.User;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Portable {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)

  private long id;

  private String libelle;
  private String libellecourt;
  private String description;
  private String identifiant;
  private String marque;
  private String couleur;
  private long screen;
  private String cpu;
  private long memory;
  private long hdd1;
  private long hdd2;
  private long cdrom;

  private Date dateEmprunt;
  private Date dateRetour;
  private String validerPar;
  private String retourPar;

  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "user_login") private User emprunteur;

  public long getId() {
    return id;
  }
  public void setId(long id) {
    this.id = id;
  }

  public String getLibelle() {
    return libelle;
  }
  public void setLibelle(String libelle) {
    this.libelle = libelle;
  }

  public String getLibellecourt() {
    return libellecourt;
  }
  public void setLibellecourt(String libellecourt) {
    this.libellecourt = libellecourt;
  }

  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }

  public String getIdentifiant() {
    return identifiant;
  }
  public void setIdentifiant(String identifiant) {
    this.identifiant = identifiant;
  }

  public String getMarque() {
    return marque;
  }
  public void setMarque(String marque) {
    this.marque = marque;
  }

  public String getCouleur() { return couleur; }
  public void setCouleur(String couleur) { this.couleur = couleur; }

  public long getScreen() {
    return screen;
  }
  public void setScreen(long screen) {
    this.screen = screen;
  }

  public String getCpu() {
    return cpu;
  }
  public void setCpu(String cpu) {
    this.cpu = cpu;
  }

  public long getMemory() {
    return memory;
  }
  public void setMemory(long memory) {
    this.memory = memory;
  }

  public long getHdd1() {
    return hdd1;
  }
  public void setHdd1(long hdd1) {
    this.hdd1 = hdd1;
  }

  public long getHdd2() {
    return hdd2;
  }
  public void setHdd2(long hdd2) {
    this.hdd2 = hdd2;
  }

  public long getCdrom() {
    return cdrom;
  }
  public void setCdrom(long cdrom) {
    this.cdrom = cdrom;
  }

  public User getEmprunteur() { return emprunteur; }
  public void setEmprunteur(User user) { this.emprunteur = user; }


  public Date getDateEmprunt() { return dateEmprunt; }
  public void setDateEmprunt(Date dateEmprunt) { this.dateEmprunt = dateEmprunt; }

  public Date getDateRetour() { return dateRetour; }
  public void setDateRetour(Date dateRetour) { this.dateRetour = dateRetour; }

  public String getValidePar() { return validerPar; }
  public void setValidePar(String validePar) { this.validerPar = validePar; }

  public String getRetourPar() { return retourPar; }
  public void setRetourPar(String retourPar) { this.retourPar = retourPar; }

}
