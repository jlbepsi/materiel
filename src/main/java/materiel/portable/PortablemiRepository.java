package materiel.portable;

import org.springframework.data.repository.CrudRepository;

public interface PortablemiRepository extends CrudRepository<Portable, Integer> {

    /*// Obtient les ordinateurs portables emruntable à une date donnée
    @Query("select p from Portableemprunt p where p.identity.datedebut = ?1")
    List<Portabletype> findAllFreeByDatedebut(Date datedebut);*/
}
