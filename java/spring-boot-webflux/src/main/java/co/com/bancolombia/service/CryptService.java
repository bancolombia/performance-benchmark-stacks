package co.com.bancolombia.service;

import co.com.bancolombia.utils.Crypt;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class CryptService {
    private final Crypt crypt = new Crypt();

    public boolean process() {
        String clear = UUID.randomUUID().toString();
        String encrypted = crypt.bcrypt(clear);
        return crypt.validate(clear, encrypted);
    }
}
