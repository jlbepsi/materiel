package materiel.service;


import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jws;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.Key;
import java.security.KeyFactory;
import java.security.spec.X509EncodedKeySpec;

@Service
public class JwtTokenService {

    @Value("${jwt.token.public_key}")
    private String publicKeyRessource;



    public Jws<Claims> validateToken(String authToken) {
        return  Jwts.parser().setSigningKey(getKey()).parseClaimsJws(authToken);
    }

    private Key getKey() {
        // Création de la clé
        byte[] publicKey = readPublicKey();
        if (publicKey != null) {
            try {
                X509EncodedKeySpec spec = new X509EncodedKeySpec(publicKey);

                KeyFactory kf = KeyFactory.getInstance("RSA");
                return kf.generatePublic(spec);
            } catch (Exception ex) {
                System.err.println(ex.getMessage());
            }
        }
        return null;
    }

    private byte[] readPublicKey() {
        try {
            ClassPathResource resource = new ClassPathResource(publicKeyRessource);
            return Files.readAllBytes(Paths.get(resource.getURI()));
        } catch (Exception ex) {
            System.err.println(ex.getMessage());
        }

        return null;
    }

}
