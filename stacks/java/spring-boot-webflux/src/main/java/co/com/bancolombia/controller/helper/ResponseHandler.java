package co.com.bancolombia.controller.helper;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

public class ResponseHandler {
    public static ResponseEntity<Object> encapsulateResponse(Object body, HttpStatus status) {
        return ResponseEntity
                .status(status)
                .body(body);
    }
}
