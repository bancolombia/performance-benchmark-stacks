package co.com.bancolombia.service;

import co.com.bancolombia.utils.Hash;
import org.springframework.stereotype.Service;

import java.security.NoSuchAlgorithmException;
import java.util.UUID;

@Service
public class HashService {
    private final Hash hash = new Hash();

    public HashService() throws NoSuchAlgorithmException {
    }

    public String process() {
        return hash.sha256(UUID.randomUUID().toString());
    }
}
