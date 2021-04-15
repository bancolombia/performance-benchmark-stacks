package co.com.bancolombia.utils;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class CryptTest {

    @Test
    public void shouldMatch() {
        // Arrange
        String clear = "qwertyuiop";
        Crypt crypt = new Crypt();
        // Act
        String hashed = crypt.bcrypt(clear);
        boolean match = crypt.validate(clear, hashed);
        // Assert
        assertThat(match).isTrue();
    }

    @Test
    public void shouldNotMatch() {
        // Arrange
        String clear = "qwertyuiop";
        Crypt crypt = new Crypt();
        // Act
        String hashed = crypt.bcrypt(clear);
        boolean match = crypt.validate(clear, clear);
        // Assert
        assertThat(match).isFalse();
    }
}
