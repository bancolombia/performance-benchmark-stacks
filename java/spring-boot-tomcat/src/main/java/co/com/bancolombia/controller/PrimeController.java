package co.com.bancolombia.controller;

import co.com.bancolombia.models.LoopStatus;
import co.com.bancolombia.service.CryptService;
import co.com.bancolombia.service.PrimeService;
import co.com.bancolombia.utils.DelayedTaskRunner;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/prime/{top}", produces = MediaType.APPLICATION_JSON_VALUE)
public class PrimeController {
    private final PrimeService service;

    @GetMapping()
    public LoopStatus sha256(@RequestParam(defaultValue = "0") Long delay,
                             @RequestParam(defaultValue = "100") Integer percentage,
                             @PathVariable int top) {
        int times = DelayedTaskRunner.start(() -> service.process(top) , percentage, delay);
        //System.out.println("tope = " + top);
        return LoopStatus.builder().status("OK").applied(times > 0).times(times).build();
    }

}
