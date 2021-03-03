package co.com.bancolombia.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseHandler {
    public static ResponseEntity<Object> encapsulateResponse(Object body, HttpStatus status) {
        return ResponseEntity
                .status(status)
                .body(body);
    }
}
