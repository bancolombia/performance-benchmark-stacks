package co.com.bancolombia.utils;

import org.assertj.core.data.Offset;
import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

public class DelayedTaskRunnerTest {

    @Test
    public void shouldProcessForADelayTime() {
        // Arrange
        long delay = 1000;
        long expected = System.currentTimeMillis() + delay;
        // Act
        int times = DelayedTaskRunner.start(() -> 10f / 50f, Percentage.MAX_PERCENTAGE, delay);
        // Assert
        long realEnd = System.currentTimeMillis();
        assertThat(realEnd).isCloseTo(expected, Offset.offset(50L));
        assertThat(times).isGreaterThan(0);
        System.out.println("Real delay: " + (realEnd - (expected - delay)) + " expectedDelay: " + delay);
    }
}
