package materiel.computer;


import materiel.component.Component;
import materiel.emprunt.User;

import javax.persistence.*;

@Entity
public class Computer {

  @Id
  @GeneratedValue(strategy=GenerationType.AUTO)
  private long id;

  private String libelle;
  private String place;
  private String description;
  private java.sql.Timestamp creationDate;
  private java.sql.Timestamp updateDate;

  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "createur") private User createur;

  private String remarque;


  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "boitier") private Component boitier;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "cartemere") private Component cartemere;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "cpu") private Component cpu;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "ram1") private Component ram1;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "ram2") private Component ram2;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "ram3") private Component ram3;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "ram4") private Component ram4;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd1") private Component hdd1;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd2") private Component hdd2;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd3") private Component hdd3;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd4") private Component hdd4;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd5") private Component hdd5;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "hdd6") private Component hdd6;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "networkCard1") private Component networkCard1;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "networkCard2") private Component networkCard2;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "networkCard3") private Component networkCard3;
  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "graphicCard") private Component graphicCard;


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

  public String getPlace() {
    return place;
  }
  public void setPlace(String place) {
    this.place = place;
  }

  public String getDescription() {
    return description;
  }
  public void setDescription(String description) {
    this.description = description;
  }

  public java.sql.Timestamp getCreationDate() {
    return creationDate;
  }
  public void setCreationDate(java.sql.Timestamp creationDate) {
    this.creationDate = creationDate;
  }

  public java.sql.Timestamp getUpdateDate() {
    return updateDate;
  }
  public void setUpdateDate(java.sql.Timestamp updateDate) {
    this.updateDate = updateDate;
  }

  public User getCreateur() {
    return createur;
  }
  public void setCreateur(User createur) {
    this.createur = createur;
  }

  public String getRemarque() {
    return remarque;
  }
  public void setRemarque(String remarque) {
    this.remarque = remarque;
  }

  public Component getBoitier() {
    return boitier;
  }
  public void setBoitier(Component boitier) {
    this.boitier = boitier;
  }


  public Component getCartemere() {
    return cartemere;
  }
  public void setCartemere(Component cartemere) {
    this.cartemere = cartemere;
  }

  public Component getCpu() {
    return cpu;
  }
  public void setCpu(Component cpu) {
    this.cpu = cpu;
  }

  public Component getRam1() {
    return ram1;
  }
  public void setRam1(Component ram1) {
    this.ram1 = ram1;
  }

  public Component getRam2() {
    return ram2;
  }
  public void setRam2(Component ram2) {
    this.ram2 = ram2;
  }

  public Component getRam3() {
    return ram3;
  }
  public void setRam3(Component ram3) {
    this.ram3 = ram3;
  }

  public Component getRam4() {
    return ram4;
  }
  public void setRam4(Component ram4) {
    this.ram4 = ram4;
  }

  public Component getHdd1() {
    return hdd1;
  }
  public void setHdd1(Component hdd1) {
    this.hdd1 = hdd1;
  }

  public Component getHdd2() {
    return hdd2;
  }
  public void setHdd2(Component hdd2) {
    this.hdd2 = hdd2;
  }

  public Component getHdd3() {
    return hdd3;
  }
  public void setHdd3(Component hdd3) {
    this.hdd3 = hdd3;
  }

  public Component getHdd4() {
    return hdd4;
  }
  public void setHdd4(Component hdd4) {
    this.hdd4 = hdd4;
  }

  public Component getHdd5() {
    return hdd5;
  }
  public void setHdd5(Component hdd5) {
    this.hdd5 = hdd5;
  }

  public Component getHdd6() {
    return hdd6;
  }
  public void setHdd6(Component hdd6) {
    this.hdd6 = hdd6;
  }

  public Component getNetworkCard1() {
    return networkCard1;
  }
  public void setNetworkCard1(Component networkCard1) {
    this.networkCard1 = networkCard1;
  }

  public Component getNetworkCard2() {
    return networkCard2;
  }
  public void setNetworkCard2(Component networkCard2) {
    this.networkCard2 = networkCard2;
  }

  public Component getNetworkCard3() {
    return networkCard3;
  }
  public void setNetworkCard3(Component networkCard3) {
    this.networkCard3 = networkCard3;
  }

  public Component getGraphicCard() {
    return graphicCard;
  }
  public void setGraphicCard(Component graphicCard) {
    this.graphicCard = graphicCard;
  }
}
