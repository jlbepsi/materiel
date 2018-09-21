package materiel.component;

import materiel.category.Subcategory;

import javax.persistence.*;

@Entity // This tells Hibernate to make a table out of this class
public class Component {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private long id;

    private String libelle;
    private String shortlibelle;
    private String description;
    private int quantitystock;
    private int quantityused;

    @OneToOne(cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
    @JoinColumn(name = "subcategory_id") private Subcategory subcategory;

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

    public String getShortlibelle() {
        return shortlibelle;
    }
    public void setShortlibelle(String libelle) {
        this.shortlibelle = shortlibelle;
    }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }


    public int getQuantitystock() {
        return quantitystock;
    }
    public void setQuantitystock(int quantitystock) {
        this.quantitystock = quantitystock;
    }

    public int getQuantityused() {
        return quantityused;
    }

    public Subcategory getSubcategory() {
        return subcategory;
    }
    public void setSubcategory(Subcategory subCategory) {
        this.subcategory = subCategory;
    }

}

