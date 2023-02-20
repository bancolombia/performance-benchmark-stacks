package co.com.bancolombia.models;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class LoopStatus {
    private final String status;
    private final boolean applied;
    private final int times;
}
