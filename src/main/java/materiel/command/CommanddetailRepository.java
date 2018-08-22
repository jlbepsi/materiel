package materiel.command;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CommanddetailRepository extends CrudRepository<Commanddetail, CommanddetailIdentity> {

    // Obtient les détails d'une commande
    @Query("select detail from Commanddetail detail where detail.identity.commandId = ?1")
    List<Commanddetail> findByCommandId(long commandId);

    // Obtient une seul détail
    @Query("select detail from Commanddetail detail where detail.identity.commandId = ?1 and detail.identity.component.id = ?2")
    Commanddetail findByCommandComponent(long commandId, long componentId);
}
