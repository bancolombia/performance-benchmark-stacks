package co.com.bancolombia.controller;

import co.com.bancolombia.models.Status;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;

import static co.com.bancolombia.controller.helper.ResponseHandler.encapsulateResponse;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/status", produces = MediaType.APPLICATION_JSON_VALUE)
public class StatusController {

    @GetMapping()
    public Mono<ResponseEntity<Object>> status() {
        return Mono.just(Status.builder().status("UP").build())
                .map(status -> encapsulateResponse(status, HttpStatus.OK));
    }

}
