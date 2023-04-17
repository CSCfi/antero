package fi.csc.antero.controller;

import fi.csc.antero.exception.FilterException;
import fi.csc.antero.exception.NotFoundException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class ApiExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    public ResponseEntity<String> handleNotFound(NotFoundException e) {
        return new ResponseEntity<>(e.getMessage(), getHttpHeaders(), HttpStatus.NOT_FOUND);
    }

    @ExceptionHandler(FilterException.class)
    public ResponseEntity<String> handleFilteringError(FilterException e) {
        return new ResponseEntity<>(e.getMessage(), getHttpHeaders(), HttpStatus.BAD_REQUEST);
    }

    private HttpHeaders getHttpHeaders() {
        final HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        return headers;
    }
}
