package co.com.bancolombia.utils;

import org.apache.commons.codec.binary.Hex;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Hash {
    private final MessageDigest digest = MessageDigest.getInstance("SHA-256");

    public Hash() throws NoSuchAlgorithmException {
    }

    public String sha256(String clear) {
        return Hex.encodeHexString(digest.digest(clear.getBytes(StandardCharsets.UTF_8)));
    }
}
