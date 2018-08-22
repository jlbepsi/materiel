package materiel.command;

import org.springframework.data.repository.CrudRepository;

public interface CommandRepository extends CrudRepository<Command, Long> {
}
