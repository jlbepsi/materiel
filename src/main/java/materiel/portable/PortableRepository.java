package materiel.portable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface PortableRepository extends CrudRepository<Portabletype, Integer> {

    // Obtient les ordinateurs portables emruntable à une date donnée
    @Query("select p from Portableemprunt p where p.identity.datedebut = ?1")
    List<Portabletype> findAllFreeByDatedebut(Date datedebut);
}
