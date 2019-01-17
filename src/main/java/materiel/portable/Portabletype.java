package materiel.portable;


import materiel.emprunt.User;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Portabletype {
  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private int id;

  private String libelle;
  private String description;
  private String marque;
  private String couleur;
  private long ecran;
  private String cpu;
  private long memoire;
  private String disque;
  private int quantite;

    public int getQuantite() {
        return quantite;
    }

    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }

    public String getLibelle() {
    return libelle;
  }
  public void setLibelle(String libelle) {
    this.libelle = libelle;
  }

  public int getId() {
    return id;
  }
  public void setId(int id) {
    this.id = id;
  }

  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }

  public String getMarque() {
    return marque;
  }
  public void setMarque(String marque) {
    this.marque = marque;
  }

  public String getCouleur() { return couleur; }
  public void setCouleur(String couleur) { this.couleur = couleur; }


  public String getCpu() {
    return cpu;
  }
  public void setCpu(String cpu) {
    this.cpu = cpu;
  }

  public long getEcran() {
    return ecran;
  }

  public void setEcran(long ecran) {
    this.ecran = ecran;
  }

  public long getMemoire() {
    return memoire;
  }

  public void setMemoire(long memoire) {
    this.memoire = memoire;
  }

  public String getDisque() {
    return disque;
  }

  public void setDisque(String disque) {
    this.disque = disque;
  }

}
