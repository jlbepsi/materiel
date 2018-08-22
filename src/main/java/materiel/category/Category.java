package materiel.category;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity // This tells Hibernate to make a table out of this class
public class Category {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String libelle;
    private int quantitymax;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public int getQuantitymax() {
        return quantitymax;
    }

    public void setQuantitymax(int quantitymax) {
        this.quantitymax = quantitymax;
    }
}
