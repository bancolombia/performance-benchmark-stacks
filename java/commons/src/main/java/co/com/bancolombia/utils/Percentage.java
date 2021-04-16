package co.com.bancolombia.utils;

import lombok.AccessLevel;
import lombok.NoArgsConstructor;

import java.util.Random;

@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class Percentage {
    public static final int MAX_PERCENTAGE = 100;
    private static final Random random = new Random();

    public static boolean isInPercentage(int percentage) {
        if (percentage == MAX_PERCENTAGE) {
            return true;
        }
        int randomValue = random.nextInt(MAX_PERCENTAGE);
        return randomValue <= percentage;
    }
}
