package co.com.bancolombia.controller;

import co.com.bancolombia.models.LoopStatus;
import co.com.bancolombia.service.PrimeService;
import co.com.bancolombia.utils.DelayedTaskRunner;
import lombok.AllArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;
import reactor.core.scheduler.Schedulers;

import static co.com.bancolombia.controller.helper.ResponseHandler.encapsulateResponse;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/prime/{top}", produces = MediaType.APPLICATION_JSON_VALUE)
public class PrimeController {
    private final PrimeService service;

    @GetMapping()
    public Mono<ResponseEntity<Object>> sha256(@RequestParam(defaultValue = "0") Long delay,
                                               @RequestParam(defaultValue = "100") Integer percentage,
                                               @PathVariable int top) {
        return Mono.defer(() -> Mono.just(DelayedTaskRunner.start(() -> service.process(top), percentage, delay)))
                .subscribeOn(Schedulers.boundedElastic())
                .map(times -> LoopStatus.builder().status("OK").applied(times > 0).times(times).build())
                .map(loopStatus -> encapsulateResponse(loopStatus, HttpStatus.OK));
    }

}
