package materiel.portable;


import javax.persistence.*;

@Entity
public class Portable {
  @Id
  private int mi;

  @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
  @JoinColumn(name = "portabletype_id") private Portabletype portable;

  private String emplacement;
  private String numserie;



  public int getMi() {
    return mi;
  }
  public void setMi(int mi) {
    this.mi = mi;
  }

  public Portabletype getPortable() {
    return portable;
  }

  public void setPortable(Portabletype portable) {
    this.portable = portable;
  }

  public String getNumserie() {
    return numserie;
  }
  public void setNumserie(String numserie) {
    this.numserie = numserie;
  }

  public String getEmplacement() {
    return emplacement;
  }
  public void setEmplacement(String emplacement) {
    this.emplacement = emplacement;
  }
}
