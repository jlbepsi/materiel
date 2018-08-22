package materiel.component;

import materiel.computer.Computer;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface ComponentRepository extends CrudRepository<Component, Long> {

    // Obtient les éléments d'un ordinateur composé
    @Query("select c from Component c order by c.subcategory.category.id")
    Iterable<Component> findAllOrOrderByCategory();
}
