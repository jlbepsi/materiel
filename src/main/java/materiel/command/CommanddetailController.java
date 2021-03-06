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
public class CommanddetailController {
    @Autowired // This means to get the bean called commanddetailRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private CommanddetailRepository commanddetailRepository;


    // Get all Commanddetails
    @GetMapping(path="/cmddetails")
    public @ResponseBody Iterable<Commanddetail> getAllCommanddetails() {
        // This returns a JSON or XML with the commandDetails
        return commanddetailRepository.findAll();
    }

    // Get a single Commanddetail
    @GetMapping("/cmddetails/{idcmd}/{idcpnt}")
    public @ResponseBody Commanddetail getCommanddetailById(@PathVariable(value = "idcmd") long cmdId,
                                                            @PathVariable(value = "idcpnt") long componentId) {
        Commanddetail commandDetail = null;
        try {
            commandDetail = commanddetailRepository.findByCommandComponent(cmdId, componentId);

        }
        catch (Exception ex) {
            commandDetail = null;
        }

        if (commandDetail == null )
            throw new ResourceNotFoundException("Commanddetail", "cmdId-componentId", "" + cmdId + "-" + componentId);

        return commandDetail;
    }


    // Get all Commanddetail by command id
    @GetMapping("/cmddetails/{idcmd}")
    public @ResponseBody Iterable<Commanddetail> getCommanddetailByCommandId(@PathVariable(value = "idcmd") long cmdId) {
        return commanddetailRepository.findByCommandId(cmdId);
    }

    // Add a new Commanddetail
    @PostMapping(path="/cmddetails") // Map ONLY POST Requests
    public @ResponseBody Commanddetail addNewCommanddetail (@Valid @RequestBody Commanddetail commandDetail) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        return commanddetailRepository.save(commandDetail);
    }

    // Update a Commanddetail
    @PutMapping("/cmddetails/{idcmd}/{idcpnt}")
    public @ResponseBody Commanddetail updateCommanddetail(@PathVariable(value = "idcmd") Integer cmdId,
                                                           @PathVariable(value = "iditem") Integer componentId,
                                                           @Valid @RequestBody Commanddetail cmdDetail) {

        Commanddetail cmdDetailSource = commanddetailRepository.findById(new CommanddetailIdentity(cmdId, componentId))
                .orElseThrow(() -> new ResourceNotFoundException("Commanddetail", "cmdId-componentId", "" + cmdId + "-" + componentId));

        cmdDetailSource.setQuantity(cmdDetail.getQuantity());

        return commanddetailRepository.save(cmdDetailSource);
    }

    // Delete a Commanddetail
    @DeleteMapping(path = "/cmddetails/{idcmd}/{idcpnt}")
    public @ResponseBody
    ResponseEntity<?> deleteCommanddetail(@PathVariable(value = "idcmd") Integer cmdId,
                                          @PathVariable(value = "idcpnt") Integer componentId)
    {
        Commanddetail cmdDetail = commanddetailRepository.findById(new CommanddetailIdentity(cmdId, componentId))
                .orElseThrow(() -> new ResourceNotFoundException("Commanddetail", "cmdId-componentId", "" + cmdId + "-" + componentId));

        commanddetailRepository.delete(cmdDetail);
        return ResponseEntity.ok().body(new GenericResponse(true, "Suppression effectuée"));
    }
}
