package co.com.bancolombia.service;

import co.com.bancolombia.utils.Prime;
import org.springframework.stereotype.Service;

@Service
public class PrimeService {
    private final Prime prime = new Prime();

    public String process(int top) {
        return prime.primo(top);
    }
}
