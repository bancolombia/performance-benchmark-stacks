package co.com.bancolombia.controller;

import co.com.bancolombia.models.LoopStatus;
import co.com.bancolombia.service.CryptService;
import co.com.bancolombia.utils.DelayedTaskRunner;
import lombok.AllArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@AllArgsConstructor
@RestController
@RequestMapping(value = "/crypt", produces = MediaType.APPLICATION_JSON_VALUE)
public class CryptController {
    private final CryptService service;

    @GetMapping()
    public LoopStatus sha256(@RequestParam(defaultValue = "100") Long delay,
                             @RequestParam(defaultValue = "100") Integer percentage) {
        int times = DelayedTaskRunner.start(service::process, percentage, delay);
        return LoopStatus.builder().status("OK").applied(times > 0).times(times).build();
    }

}
