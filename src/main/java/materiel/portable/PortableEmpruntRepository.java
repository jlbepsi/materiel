package materiel.portable;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.Date;
import java.util.List;

public interface PortableEmpruntRepository extends CrudRepository<Portableemprunt, PortableEmpruntIdentity> {

    // Obtient les ordinateurs portables d'après le login de l'utilisateur
    @Query("select p from Portableemprunt p where p.identity.emprunteur.login = ?1")
    List<Portableemprunt> findAllByUserLogin(String login);

    // Obtient les ordinateurs portables d'après la date d'emprunt
    @Query("select p from Portableemprunt p where p.identity.datedebut = ?1")
    List<Portableemprunt> findAllByDatedebut(Date datedebut);

}
