package fi.csc.antero.controller;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.skyscreamer.jsonassert.JSONAssert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Set;

@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource(value = "/test_application.properties")
@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, scripts = "/sql/init.sql")
@Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD, scripts = "/sql/clear.sql")
public class ApiControllerTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Test
    public void testGetData() throws Exception {
        final ResponseEntity<String> responseEntity = restTemplate.getForEntity("/resources/test_data",
                String.class);
        final String response = responseEntity.getBody();
        Assert.assertEquals("Response code should match!", 200, responseEntity.getStatusCodeValue());
        String expected = "[{\"id\" : 1,\n" +
                "\"test_text\" : \"text value\",\n" +
                "\"test_number\" : 1.11,\n" +
                "\"test_date\" : 1483221600000\n" +
                "},{\n" +
                "\"id\" : 2,\n" +
                "\"test_text\" : \"text value 2\",\n" +
                "\"test_number\" : 2.22,\n" +
                "\"test_date\" : 1485986400000\n" +
                "}]";
        JSONAssert.assertEquals(expected, response, false);
    }

    @Test
    public void testGetDataInvalidResource() throws Exception {
        final ResponseEntity<String> responseEntity = restTemplate.getForEntity("/resources/invalid_data",
                String.class);
        Assert.assertEquals("Response code should match!", 404, responseEntity.getStatusCodeValue());
    }

    @Test
    public void testGetResources() throws Exception {
        final ResponseEntity<Set> responseEntity = restTemplate.getForEntity("/resources", Set.class);
        Assert.assertEquals("Response code should match!", 200, responseEntity.getStatusCodeValue());
        final Set tableNames = responseEntity.getBody();
        Assert.assertTrue("Table names does not contain right tables!",
                tableNames.contains("test_data") && tableNames.contains("test_data_2"));
    }
}
