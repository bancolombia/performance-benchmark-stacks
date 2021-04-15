package co.com.bancolombia.utils;

import org.junit.jupiter.api.Test;

import java.security.NoSuchAlgorithmException;

import static org.assertj.core.api.Assertions.assertThat;

public class HashTest {

    @Test
    public void shouldGenerateSha256() throws NoSuchAlgorithmException {
        // Arrange
        String clear = "qwertyuiop";
        String expected = "9a900403ac313ba27a1bc81f0932652b8020dac92c234d98fa0b06bf0040ecfd";
        Hash hash = new Hash();
        // Act
        String hashed = hash.sha256(clear);
        // Assert
        assertThat(hashed).isEqualTo(expected);
    }
}
