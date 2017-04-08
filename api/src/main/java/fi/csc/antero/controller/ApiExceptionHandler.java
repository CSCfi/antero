package fi.csc.antero.controller;

import fi.csc.antero.exception.FilterException;
import fi.csc.antero.exception.NotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

@ControllerAdvice
@RestController
public class ApiExceptionHandler {

    @ExceptionHandler(NotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNotFound(NotFoundException e) {
        return e.getMessage();
    }

    @ExceptionHandler(FilterException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public String handleFilteringError(FilterException e) {
        return e.getMessage();
    }
}
