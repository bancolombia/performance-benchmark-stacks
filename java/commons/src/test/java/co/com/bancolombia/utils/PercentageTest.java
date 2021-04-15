package co.com.bancolombia.utils;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class PercentageTest {

    @Test
    public void shouldGenerateTenPercentage() {
        // Arrange
        int percentage = 50;
        float max = Percentage.MAX_PERCENTAGE * 1f;
        int real = 0;
        int tolerance = 10;
        // Act
        for (int i = 0; i < max; i++) {
            if (Percentage.isInPercentage(percentage)) {
                real++;
            }
        }
        float realPercentage = real / max;
        // Assert
        float maxPercentage = (percentage + tolerance) / max;
        System.out.println(realPercentage * Percentage.MAX_PERCENTAGE + "% of max " + maxPercentage * Percentage.MAX_PERCENTAGE + "%");
        assertThat(realPercentage).isLessThanOrEqualTo(maxPercentage);
    }
}
