package fi.csc.antero.controller;

import fi.csc.antero.analytic.annotation.EnableAnalytics;
import fi.csc.antero.exception.NotFoundException;
import fi.csc.antero.repository.ApiDataService;
import fi.csc.antero.repository.ApiProperty;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springdoc.core.annotations.ParameterObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

@RestController
@Tag(name = "Vipunen Rajapinta")
public class ApiController {

    private final ApiDataService service;

    @Autowired
    public ApiController(ApiDataService service) {
        this.service = service;
    }
    @RequestMapping(value = "/resources/{resource}/data", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @EnableAnalytics
    @Operation(summary = "Get resource data",
            description = "You can query resource data with filters and use paging. " +
                    "Filtering uses [FIQL](https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00) query syntax. " +
                    "HOX! All dates are in GMT time.")
    public StreamingResponseBody getResourceData(@Parameter(description = "Name of the resource", required = true)
                                                 @PathVariable("resource") String resource,
                                                 @ParameterObject ApiQuery query,
                                                 HttpServletResponse response) throws SQLException {
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);

        checkResource(resource);
        return outputStream -> {
            try {
                service.streamToJsonArray(resource, outputStream, query);
            } catch (SQLException e) {
                throw new IOException(e);
            }
        };
    }

    @RequestMapping(value = "/resources/{resource}/data/count", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @EnableAnalytics
    @Operation(summary = "Get count of resource data",
            description = "Counts total amount of results that query will return. " +
                    "Can be used as pre-check if paging is need when actual data is loaded.")
    public Long getDataCount(@Parameter(description = "Name of the resource", required = true)
                             @PathVariable("resource") String resource,
                             @Parameter(description = "FIQL query filter")
                             @RequestParam(value = "filter", required = false) String filter)
            throws SQLException {
        return service.getCount(resource, filter);
    }

    @RequestMapping(value = "/resources/{resource}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @EnableAnalytics
    @Operation(description = "Describes structure of specified resource")
    public List<ApiProperty> getResource(@Parameter(description = "Name of the resource", required = true)
                                         @PathVariable("resource") String resource) throws SQLException {
        checkResource(resource);
        return service.listResourceProperties(resource);
    }

    @RequestMapping(value = "/resources", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_VALUE)
    @EnableAnalytics
    @Operation(description = "Lists available resource names")
    public Set<String> getResources() throws SQLException {
        return service.listResources();
    }

    private void checkResource(String resource) throws SQLException {
        if (!service.listResources().contains(resource.toLowerCase())) {
            throw new NotFoundException(String.format("Resource '%s' not found", resource));
        }
    }
}


