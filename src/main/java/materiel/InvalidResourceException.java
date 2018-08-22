package materiel;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value = HttpStatus.BAD_REQUEST)
public class InvalidResourceException extends RuntimeException {
    private String resourceName;
    private String fieldName;
    private Object fieldValue;

    public InvalidResourceException(String resourceName, String fieldName, Object fieldValue) {
        super(String.format("Le champ %s de l'élément %s n'accepte pas la valeur: '%s'", fieldName, resourceName, fieldValue));
        this.resourceName = resourceName;
        this.fieldName = fieldName;
        this.fieldValue = fieldValue;
    }

    public String getResourceName() {
        return resourceName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public Object getFieldValue() {
        return fieldValue;
    }
}