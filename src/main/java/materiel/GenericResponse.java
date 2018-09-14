package materiel;

public class GenericResponse {
    public boolean status;
    public String message;

    public GenericResponse(boolean status, String message) {
        this.status = status;
        this.message = message;
    }
}
