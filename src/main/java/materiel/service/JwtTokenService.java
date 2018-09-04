package materiel.service;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import java.security.Key;

@Service
public class JwtTokenService {

    @Value("${jwt.token.secret}")
    private String plainSecret;



    public Jws<Claims> validateToken(String authToken) {
        return  Jwts.parser().setSigningKey(getKey()).parseClaimsJws(authToken);
    }

    private Key getKey() {
        // Création de la clé
        byte[] encodedBytes = this.plainSecret.getBytes();
        return Keys.hmacShaKeyFor(encodedBytes);
    }

}
