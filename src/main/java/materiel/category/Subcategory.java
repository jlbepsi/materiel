package materiel.category;

import materiel.category.Category;

import javax.persistence.*;

@Entity
public class Subcategory {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    private String libelle;


    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id") private Category category;

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

    public Category getCategory() {
        return category;
    }
    public void setCategory(Category category) {
        this.category = category;
    }
}
