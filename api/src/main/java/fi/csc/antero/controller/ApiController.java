package fi.csc.antero.controller;

import fi.csc.antero.exception.NotFoundException;
import fi.csc.antero.repository.ApiDataService;
import fi.csc.antero.repository.ApiProperty;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;
import org.springframework.core.Ordered;

//1.4.2022 DataBinder fix

import org.springframework.core.annotation.Order;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.Set;

@RestController
public class ApiController {

    private final ApiDataService service;

    @Autowired
    public ApiController(ApiDataService service) {
        this.service = service;
    }

    @RequestMapping(value = "/resources/{resource}/data", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "Get resource data",
            notes = "You can query resource data with filters and use paging. " +
                    "Filtering uses [FIQL](https://tools.ietf.org/html/draft-nottingham-atompub-fiql-00) query syntax. " +
                    "HOX! All dates are in GMT time.",
            responseContainer = "List",
            response = Object.class)
    public StreamingResponseBody getResourceData(@ApiParam(value = "Name of the resource", required = true)
                                                 @PathVariable("resource") String resource,
                                                 ApiQuery query,
                                                 HttpServletResponse response) throws SQLException {
        response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
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
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "Get count of resource data",
            notes = "Counts total amount of results that query will return. " +
                    "Can be used as pre-check if paging is need when actual data is loaded.")
    public Long getDataCount(@ApiParam(value = "Name of the resource", required = true)
                             @PathVariable("resource") String resource,
                             @ApiParam(value = "FIQL query filter")
                             @RequestParam(value = "filter", required = false) String filter)
            throws SQLException {
        return service.getCount(resource, filter);
    }

    @RequestMapping(value = "/resources/{resource}", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "Describes structure of specified resource")
    public List<ApiProperty> getResource(@ApiParam(value = "Name of the resource", required = true)
                                         @PathVariable("resource") String resource) throws SQLException, IOException {
        checkResource(resource);
        return service.listResourceProperties(resource);
    }

    @RequestMapping(value = "/resources", method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @ApiOperation(value = "Lists available resource names")
    public Set<String> getResources() throws SQLException, IOException {
        return service.listResources();
    }

    private void checkResource(String resource) throws SQLException {
        if (!service.listResources().contains(resource.toLowerCase())) {
            throw new NotFoundException(String.format("Resource '%s' not found", resource));
        }
    }
}

@ControllerAdvice

@Order(10000)

public class BinderControllerAdvice {

    @InitBinder

    public void setAllowedFields(WebDataBinder dataBinder) {

         String[] denylist = new String[]{"class.*", "Class.*", "*.class.*", "*.Class.*"};

         dataBinder.setDisallowedFields(denylist);

    }

}
