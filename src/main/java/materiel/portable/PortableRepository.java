package materiel.portable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PortableRepository extends CrudRepository<Portable, Long> {

    // Obtient les ordinateurs portables d'après le login de l'utilisateur
    @Query("select portable from Portable portable where portable.emprunteur.login = ?1")
    List<Portable> findAllByUserLogin(String place);

    // Obtient les ordinateurs portables d'après le login de l'utilisateur
    @Query("select portable from Portable portable where portable.emprunteur.nom like %?1%")
    List<Portable> findAllByUserName(String place);
}
