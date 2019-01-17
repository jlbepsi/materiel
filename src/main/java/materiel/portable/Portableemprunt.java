package materiel.portable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import java.util.Date;

@Entity
public class Portableemprunt {
    public PortableEmpruntIdentity getIdentity() {
        return identity;
    }

    public void setIdentity(PortableEmpruntIdentity identity) {
        this.identity = identity;
    }

    @EmbeddedId
    private PortableEmpruntIdentity identity;

    private Date datefin;
    private int etat;
    private String validerpar;
    private String retourpar;

    public Date getDatefin() {
        return datefin;
    }

    public void setDatefin(Date datefin) {
        this.datefin = datefin;
    }

    public int getEtat() {
        return etat;
    }

    public void setEtat(int etat) {
        this.etat = etat;
    }

    public String getValiderpar() {
        return validerpar;
    }

    public void setValiderpar(String validerpar) {
        this.validerpar = validerpar;
    }

    public String getRetourpar() {
        return retourpar;
    }

    public void setRetourpar(String retourpar) {
        this.retourpar = retourpar;
    }
}
