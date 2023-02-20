package co.com.bancolombia.controller;

import co.com.bancolombia.models.Status;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/status", produces = MediaType.APPLICATION_JSON_VALUE)
public class StatusController {

    @GetMapping()
    public Status status() {
        return Status.builder().status("UP").build();
    }

}
