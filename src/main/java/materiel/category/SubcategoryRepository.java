package materiel.category;


import materiel.computer.Computer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SubcategoryRepository extends CrudRepository<Subcategory, Integer> {

    // Obtient les sosu catégories d'une catégorie
    @Query("select sub from Subcategory as sub where sub.category.id = ?1")
    List<Subcategory> findAllByCategory(Integer category);
}
