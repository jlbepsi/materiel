package materiel.portable;

import materiel.GenericResponse;
import materiel.ResourceNotFoundException;
import materiel.emprunt.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

@Controller    // This means that this class is a Controller
@RequestMapping(path="/api") // This means URL's start with /api (after Application path)
/* CrossOrigin(origins = "http://localhost:3000")*/
public class PortableEmpruntController {
    @Autowired // This means to get the bean called portableEmpruntRepository
    // Which is auto-generated by Spring, we will use it to handle the data
    private PortableEmpruntRepository portableEmpruntRepository;

    @Autowired
    private UserRepository userRepository;


    // Get all Portables empruntés
    @GetMapping(path="/portableemprunts")
    public @ResponseBody Iterable<Portableemprunt> getAllPortablesEmpruntes() {
        // This returns a JSON or XML with the portables
        return portableEmpruntRepository.findAll();
    }

    // Get all Portables empruntés par login utilisateur
    @GetMapping(path="/portableemprunts/bylogin/{login}")
    public @ResponseBody Iterable<Portableemprunt> getAllPortablesEmpruntesByLogin(@PathVariable(value = "login") String login) {
        // This returns a JSON or XML with the portables
        return portableEmpruntRepository.findAllByUserLogin(login);
    }

    // Get all Portables empruntés par date de début
    @GetMapping(path="/portableemprunts/bydate/{date}")
    public @ResponseBody Iterable<Portableemprunt> getAllPortablesEmpruntesByDate(@PathVariable(value = "date") String dateEmprunt) {
        // This returns a JSON or XML with the portables
        Date dateDebut = getDateFromString(dateEmprunt);

        return portableEmpruntRepository.findAllByDatedebut(dateDebut);
    }

    // Get a single Portabletype emprunté
    @GetMapping("/portableemprunts/{mi}/{login}/{date}")
    public @ResponseBody
    Portableemprunt getPortableEmprunte(@PathVariable(value = "mi") int portableMi,
                                        @PathVariable(value = "login") String login,
                                        @PathVariable(value = "date") String dateEmprunt) {
        Date dateDebut = getDateFromString(dateEmprunt);

        try {
            Optional<Portableemprunt> portableEmprunt = portableEmpruntRepository.findById(new PortableEmpruntIdentity(portableMi, login, dateDebut));
            if (portableEmprunt == null || portableEmprunt.get() == null)
                throw new ResourceNotFoundException("Portableemprunt", "PortableEmpruntIdentity", portableMi + "-" + login + "-" + dateEmprunt);

            return portableEmprunt.get();
        }
        catch (Exception ex) {
            throw new ResourceNotFoundException("Portableemprunt", "Erreur", ex.getMessage());
        }
    }

    // Emprunter un Portabletype
    @PostMapping(path="/portableemprunts") // Map ONLY POST Requests
    public @ResponseBody
    Portableemprunt addNewPortable (@Valid @RequestBody Portableemprunt portableEmprunt) {
        // @ResponseBody means the returned String is the response, not a view name
        // @RequestParam means it is a parameter from the GET or POST request

        return portableEmpruntRepository.save(portableEmprunt);
    }

    // Rendre un Portabletype
    @DeleteMapping(path = "/portableemprunts/{mi}/{login}/{date}")
    public @ResponseBody
    ResponseEntity<?> deletePortable(@PathVariable(value = "mi") int portableMi,
                                     @PathVariable(value = "login") String login,
                                     @PathVariable(value = "date") String dateEmprunt)
    {
        Date dateDebut = getDateFromString(dateEmprunt);

        Portableemprunt portableEmprunt = portableEmpruntRepository.findById(new PortableEmpruntIdentity(portableMi, login, dateDebut))
                .orElseThrow(() -> new ResourceNotFoundException("Portableemprunt", "PortableEmpruntIdentity", portableMi + "-" + login + "-" + dateEmprunt));

        portableEmpruntRepository.delete(portableEmprunt);

        return ResponseEntity.ok().body(new GenericResponse(true, "Suppression effectuée"));
    }

    private Date getDateFromString(String strDate) {
        // Date de String yyyymmdd en date
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        Date date = null;
        try {
            date = sdf.parse(strDate);
        }
        catch (Exception ex) {
            throw new ResourceNotFoundException("Portableemprunt", "Date incorrecte", strDate);
        }

        return  date;
    }

}
