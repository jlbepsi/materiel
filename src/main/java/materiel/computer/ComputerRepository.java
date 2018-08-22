package materiel.computer;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ComputerRepository extends CrudRepository<Computer, Long> {

    // Obtient les ordinateurs d'après l'emplacement
    @Query("select computer from Computer computer where computer.place like %?1%")
    List<Computer> findAllByPlace(String place);
}
