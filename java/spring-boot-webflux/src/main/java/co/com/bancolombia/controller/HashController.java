package co.com.bancolombia.controller;

import co.com.bancolombia.models.LoopStatus;
import co.com.bancolombia.service.HashService;
import co.com.bancolombia.utils.DelayedTaskRunner;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static co.com.bancolombia.controller.helper.ResponseHandler.encapsulateResponse;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/hash", produces = MediaType.APPLICATION_JSON_VALUE)
public class HashController {
    private final HashService service;

    @GetMapping()
    public Mono<ResponseEntity<Object>> sha256(@RequestParam(defaultValue = "100") Long delay,
                                               @RequestParam(defaultValue = "100") Integer percentage) {
        return Mono.defer(() -> Mono.just(DelayedTaskRunner.start(service::process, percentage, delay)))
                .subscribeOn(Schedulers.boundedElastic())
                .map(times -> LoopStatus.builder().status("OK").applied(times > 0).times(times).build())
                .map(loopStatus -> encapsulateResponse(loopStatus, HttpStatus.OK));
    }

}
