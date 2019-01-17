package materiel.portable;


import materiel.emprunt.User;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Embeddable
public class PortableEmpruntIdentity implements Serializable {

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "portable_mi") private Portable portablemi;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "user_login") private User emprunteur;

    private Date datedebut;


    public PortableEmpruntIdentity() {
    }

    public PortableEmpruntIdentity(int portableMi, String emprunteur, Date dateDebut) {
        this.portablemi = new Portable();
        this.portablemi.setMi(portableMi);

        this.emprunteur = new User();
        this.emprunteur.setLogin(emprunteur);
        this.datedebut = dateDebut;
    }
    
    public Portable getPortablemi() {
        return portablemi;
    }

    public void setPortablemi(Portable portablemi) {
        this.portablemi = portablemi;
    }

    public User getEmprunteur() {
        return emprunteur;
    }

    public void setEmprunteur(User emprunteur) {
        this.emprunteur = emprunteur;
    }

    public Date getDatedebut() {
        return datedebut;
    }

    public void setDatedebut(Date datedebut) {
        this.datedebut = datedebut;
    }

    @Override
    public boolean equals(Object object) {
        if (this == object) return true;
        if (object == null || getClass() != object.getClass()) return false;

        PortableEmpruntIdentity that = (PortableEmpruntIdentity) object;

        if (! (portablemi.getMi() == that.portablemi.getMi())) return false;
        if (! emprunteur.getLogin().equals(that.emprunteur.getLogin())) return false;
        return datedebut.equals(that.datedebut);
    }
}

