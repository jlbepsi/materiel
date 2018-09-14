package materiel.command;

import materiel.GenericResponse;
import materiel.ResourceNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/api") // This means URL's start with /api (after Application path)
public class CommandController {
    @Autowired // This means to get the bean called commandRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private CommandRepository commandRepository;


    // Get all Command
    @GetMapping(path="/commands")
    public @ResponseBody Iterable<Command> getAllCommand() {
        // This returns a JSON or XML with the commands
        return commandRepository.findAll();
    }

    // Get a single Command
    @GetMapping("/commands/{id}")
    public @ResponseBody Command getCommandById(@PathVariable(value = "id") long id) {
        try {
            Optional<Command> command = commandRepository.findById(id);
            if (command == null || command.get() == null)
                throw new ResourceNotFoundException("Command", "id", id);

            return command.get();
        }
        catch (Exception ex) {
            throw new ResourceNotFoundException("Command", "id", id);
        }
    }

    // Add a new Command
    @PostMapping(path="/commands") // Map ONLY POST Requests
    public @ResponseBody Command addNewCommand (@Valid @RequestBody Command command) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        return commandRepository.save(command);
    }

    // Update a Command
    @PutMapping("/commands/{id}")
    public @ResponseBody Command updateCommand(@PathVariable(value = "id") long id,
                                               @Valid @RequestBody Command cmdDetail) {

        Command commandSource = commandRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Command", "id", "" + id));

        commandSource.setDate(cmdDetail.getDate());

        return commandRepository.save(commandSource);
    }

    // Delete a Command
    @DeleteMapping(path = "/commands/{id}")
    public @ResponseBody
    ResponseEntity<?> deleteCommand(@PathVariable(value = "id") long id)
    {
        Command cmdDetail = commandRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Command", "id", id));

        commandRepository.delete(cmdDetail);
        return ResponseEntity.ok().body(new GenericResponse(true, "Suppression effectuée"));
    }
}
