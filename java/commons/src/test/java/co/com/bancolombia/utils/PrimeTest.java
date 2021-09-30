package co.com.bancolombia.utils;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class PrimeTest {

    @Test
    public void shouldPrime()  {
        // Arrange
        int tope = 100;
        String expected = "2 3 5 7 11 13 17 19 23 29 31 37 41 43 47 53 59 61 67 71 73 79 83 89 97 ";
        Prime prime = new Prime();
        // Act
        String primeNumber = prime.primo(tope);
        // Assert
        assertThat(primeNumber).isEqualTo(expected);
    }
}
