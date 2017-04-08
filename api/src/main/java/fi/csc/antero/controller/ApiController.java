package fi.csc.antero.controller;

import fi.csc.antero.exception.NotFoundException;
import fi.csc.antero.repository.ApiDataService;
import fi.csc.antero.repository.ApiProperty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

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

    @RequestMapping(value = "/resources/{resource}/data", method = RequestMethod.GET)
    public void getData(@PathVariable("resource") String resource, HttpServletResponse response,
                        @RequestParam(value = "filter", defaultValue = "") String filter) throws IOException, SQLException {
        response.setContentType(MediaType.APPLICATION_JSON_UTF8_VALUE);
        checkResource(resource);
        service.streamToJsonArray(resource, response.getOutputStream(), filter);
    }

    @RequestMapping(value = "/resources/{resource}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public
    @ResponseBody
    List<ApiProperty> getResource(@PathVariable("resource") String resource) throws SQLException, IOException {
        checkResource(resource);
        return service.getTableColumns(resource);
    }

    @RequestMapping(value = "/resources", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public
    @ResponseBody
    Set<String> getResources() throws SQLException, IOException {
        return service.getTableNames();
    }

    private void checkResource(@PathVariable("resource") String resource) throws SQLException {
        if (!service.getTableNames().contains(resource.toLowerCase())) {
            throw new NotFoundException(String.format("Resource '%s' not found", resource));
        }
    }
}
