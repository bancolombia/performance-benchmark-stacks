package co.com.bancolombia.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Crypt {
    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(10);

    public String bcrypt(String clear) {
        return encoder.encode(clear);
    }

    public boolean validate(String clear, String encoded) {
        return encoder.matches(clear, encoded);
    }
}
