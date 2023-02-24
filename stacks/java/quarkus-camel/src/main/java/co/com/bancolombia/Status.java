package co.com.bancolombia;

import io.quarkus.runtime.annotations.RegisterForReflection;

@RegisterForReflection
public class Status {
    private String status;

    public Status() {
    }

    public Status(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
