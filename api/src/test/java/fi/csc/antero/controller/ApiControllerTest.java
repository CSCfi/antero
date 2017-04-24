package fi.csc.antero.controller;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.skyscreamer.jsonassert.JSONAssert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;

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
        final ResponseEntity<String> entity = makeQuery("/resources/test_data/data", 200);
        String expected = "[{'id' : 1," +
                "'test_text' : 'text value'," +
                "'test_number' : 1.11," +
                "'test_date' : '2017-01-01 00:00:00'" +
                "},{" +
                "'id' : 2," +
                "'test_text' : 'text value 2'," +
                "'test_number' : 2.22," +
                "'test_date' : '2017-02-02 00:00:00'" +
                "}]";
        JSONAssert.assertEquals(expected, entity.getBody(), false);
    }

    @Test
    public void testGetDataWithFilter() throws Exception {
        final ResponseEntity<String> entity = makeQuery("/resources/test_data/data?filter=(test_text=='*value 2';id>1)",
                200);
        final String result = entity.getBody();
        String expected = "[{'id' : 2," +
                "'test_text' : 'text value 2'," +
                "'test_number' : 2.22," +
                "'test_date' : '2017-02-02 00:00:00'" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetDataWithWhiteSpaceFilter() throws Exception {
        final String result = makeQuery("/resources/test_data/data?filter=white_space=='true'", 200)
                .getBody();
        String expected = "[{'id' : 1," +
                "'test_text' : 'text value'," +
                "'test_number' : 1.11," +
                "'test_date' : '2017-01-01 00:00:00'," +
                "'white_space' : true" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/limit_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testGetDataWithDateFilter() throws Exception {
        final String result = makeQuery("/resources/test_data/data?filter=test_date=='2017-01-03 00:00:00'", 200)
                .getBody();
        String expected = "[{'id' : 3," +
                "'test_text' : 'text value'," +
                "'test_number' : 3.11," +
                "'test_date' : '2017-01-03 00:00:00'" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetDataWithBadFilter() throws Exception {
        makeQuery("/resources/test_data/data?filter=(test_text=='*value 2';invalid>1)", 400);
        makeQuery("/resources/test_data/data?filter=(test_text=='*value 2';test_date>'invalid_date_format')", 400);
    }

    @Test
    public void testGetDataInvalidResource() throws Exception {
        makeQuery("/resources/invalid_data", 404);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/limit_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testGetDataWithPaging() throws Exception {
        final String baseUrl = "/resources/test_data/data?";
        int size = 2;
        for (int i = 0; i < 5; i++) {
            final String url = String.format(baseUrl + "offset=%d&limit=%d", i * size, size);
            final String result = makeQuery(url, 200).getBody();
            JSONAssert.assertEquals(String.format("[{'id':%d}, {'id':%d}]", i * size + 1, i * size + 2),
                    result, false);
        }
    }

    @Test
    public void testDataCount() throws Exception {
        final String result = makeQuery("/resources/test_data/data/count", 200).getBody();
        JSONAssert.assertEquals("2", result, false);
    }

    @Test
    public void testGetResource() throws Exception {
        final String result = makeQuery("/resources/test_data", 200).getBody();
        Assert.assertNotNull(result);
        String expected = "[ {" +
                "  'name' : 'id'," +
                "  'type' : 'number'" +
                "}, {" +
                "  'name' : 'test_text'," +
                "  'type' : 'string'" +
                "}, {" +
                "  'name' : 'test_number'," +
                "  'type' : 'number'" +
                "}, {" +
                "  'name' : 'test_date'," +
                "  'type' : 'date'," +
                "  'format' : 'yyyy-MM-dd HH:mm:ss'" +
                "}, {" +
                "  'name' : 'white_space'," +
                "  'type' : 'boolean'" +
                "} ]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetResources() throws Exception {
        final String result = makeQuery("/resources", 200).getBody();
        JSONAssert.assertEquals("['test_data', 'test_data_2']", result, false);
    }

    private ResponseEntity<String> makeQuery(String url, int expectedStatus) {
        final ResponseEntity<String> responseEntity = restTemplate
                .getForEntity(url,
                        String.class);
        Assert.assertEquals("Response code should match!", expectedStatus, responseEntity.getStatusCodeValue());
        Assert.assertEquals("Content-type should match!", MediaType.APPLICATION_JSON_UTF8, responseEntity.getHeaders().getContentType());
        return responseEntity;
    }
}
