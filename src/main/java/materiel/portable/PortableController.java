package materiel.portable;

import materiel.ResourceNotFoundException;
import materiel.emprunt.User;
import materiel.emprunt.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Calendar;
import java.util.Optional;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/api") // This means URL's start with /api (after Application path)
/* CrossOrigin(origins = "http://localhost:3000")*/
public class PortableController {
    @Autowired // This means to get the bean called portableRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private PortableRepository portableRepository;

    @Autowired
    private UserRepository userRepository;


    // Get all Portables
    @GetMapping(path="/portables")
    public @ResponseBody Iterable<Portable> getAllPortables() {
        // This returns a JSON or XML with the portables
        return portableRepository.findAll();
    }

    // Get a single Portable
    @GetMapping("/portables/{id}")
    public @ResponseBody Portable getPortableById(@PathVariable(value = "id") Long portableId) {
        Optional<Portable> portable = portableRepository.findById(portableId);
        if (portable == null || portable.get() == null)
            throw new ResourceNotFoundException("Portable", "id", portableId);

        return portable.get();
    }

    // Add a new Portable
    @PostMapping(path="/portables") // Map ONLY POST Requests
    public @ResponseBody Portable addNewPortable (@Valid @RequestBody Portable portable) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        return portableRepository.save(portable);
    }

    // Update a Portable
    @PutMapping("/portables/{id}")
    public @ResponseBody Portable updatePortable(@PathVariable(value = "id") Long portableId,
                                         @Valid @RequestBody Portable portableDetails) {

        Portable portable = portableRepository.findById(portableId)
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));

        portable.setLibelle(portableDetails.getLibelle());

        return portableRepository.save(portable);
    }

    // Delete a Portable
    @DeleteMapping(path = "/portables/{id}")
    public @ResponseBody
    ResponseEntity<?> deletePortable(@PathVariable(value = "id") Long portableId)
    {
        Portable portable = portableRepository.findById(portableId)
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));

        portableRepository.delete(portable);
        return  ResponseEntity.ok().build();
    }

    // Emprunter un Portable
    @PutMapping("/portables/emprunter/{id}")
    public @ResponseBody Portable emprunterPortable(@PathVariable(value = "id") Long portableId,
                                                    @Valid @RequestBody Portable portableDetails) {

        Portable portable = portableRepository.findById(portableId)
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));

        portable.setDateEmprunt(Calendar.getInstance().getTime());

        /*User emprunteur = userRepository.findById(portableDetails.getEmprunteur().getLogin())
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));
        portable.setEmprunteur(emprunteur);*/
        portable.setEmprunteur(portableDetails.getEmprunteur());

        /*User validerPar = userRepository.findById(portableDetails.getValidePar().getLogin())
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));
        portable.setValidePar(validerPar);*/

        portable.setValidePar(portableDetails.getValidePar());

        return portableRepository.save(portable);
    }


    // Rendre un Portable
    @PutMapping("/portables/restituer/{id}")
    public @ResponseBody Portable restituerPortable(@PathVariable(value = "id") Long portableId,
                                                    @Valid @RequestBody Portable portableDetails) {

        Portable portable = portableRepository.findById(portableId)
                .orElseThrow(() -> new ResourceNotFoundException("Portable", "id", portableId));

        portable.setDateEmprunt(null);
        portable.setDateRetour(Calendar.getInstance().getTime());


        portable.setRetourPar(portableDetails.getRetourPar());

        return portableRepository.save(portable);
    }
}