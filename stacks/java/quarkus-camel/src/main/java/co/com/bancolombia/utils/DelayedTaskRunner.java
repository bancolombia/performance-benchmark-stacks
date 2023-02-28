package co.com.bancolombia.utils;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;

@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class DelayedTaskRunner {
    public static int start(DelayedTask task, int percentage, long delay) {
        int count = 0;
        if (Percentage.isInPercentage(percentage)) {
            long endMillis = System.currentTimeMillis() + delay;
            do {
                task.execute();
                count++;
            } while (System.currentTimeMillis() <= endMillis && delay != 0);
        }
        return count;
    }
}
