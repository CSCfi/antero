package fi.csc.antero.controller;

import fi.csc.antero.config.ConfigService;
import org.junit.jupiter.api.Test;
import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestComponent;
import org.springframework.boot.test.web.client.TestRestTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;

import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.test.util.AssertionErrors.assertEquals;

@TestComponent
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@TestPropertySource(value = "/test_application.properties")
@Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD, scripts = "/sql/init.sql")
@Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD, scripts = "/sql/clear.sql")
public class ApiControllerTest {

    @Autowired
    private TestRestTemplate restTemplate;

    @Autowired
    private ConfigService configService;

    @Test
    public void testGetData() throws Exception {
        final ResponseEntity<String> entity = makeQuery("/resources/test_data/data", 200);
        String expected = "[{'id' : 1," +
                "'testText' : 'text value'," +
                "'testNumber' : 1.11," +
                "'testDate' : '2017-01-01 00:00:00'," +
                "'whiteSpace' : true" +
                "},{" +
                "'id' : 2," +
                "'testText' : 'text value 2'," +
                "'testNumber' : 2.22," +
                "'testDate' : '2017-02-02 00:00:00'," +
                "'whiteSpace' : false" +
                "}]";
        JSONAssert.assertEquals(expected, entity.getBody(), true);
    }

    @Test
    public void testGetDataWithFilter() throws Exception {
        final ResponseEntity<String> entity = makeQuery("/resources/test_data/data?filter=" + encodeValue("(testText=='*value 2';id>1)"),
                200);
        final String result = entity.getBody();
        String expected = "[{'id' : 2," +
                "'testText' : 'text value 2'," +
                "'testNumber' : 2.22," +
                "'testDate' : '2017-02-02 00:00:00'" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetDataWithWhiteSpaceFilter() throws Exception {  // FIXME
        final String result = makeQuery("/resources/test_data/data?filter=" + encodeValue("whiteSpace==") + "'true'",
                200)
                .getBody();
        String expected = "[{'id' : 1," +
                "'testText' : 'text value'," +
                "'testNumber' : 1.11," +
                "'testDate' : '2017-01-01 00:00:00'," +
                "'whiteSpace' : true" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/limit_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testGetDataWithDateFilter() throws Exception {
        final String result = makeQuery("/resources/test_data/data?filter=" + encodeValue("testDate=='2017-01-03 00:00:00'"),
                200)
                .getBody();
        String expected = "[{'id' : 3," +
                "'testText' : 'text value'," +
                "'testNumber' : 3.11," +
                "'testDate' : '2017-01-03 00:00:00'" +
                "}]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetDataWithBadFilter() throws Exception {
        makeQuery("/resources/test_data/data?filter=" + encodeValue("testText=='*value 2';invalid>1)"), 400);
        makeQuery("/resources/test_data/data?filter=" + encodeValue("testText=='*value 2';testDate>'invalid_date_format')"),
                400);
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
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/sort_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testGetDataWithSortAsc() throws Exception {  // FIXME
        // Basic ascending sort
        String result = makeQuery("/resources/test_data/data?sort=(%2BtestText)", 200)
                .getBody();
        JSONAssert.assertEquals("[{'id':2}, {'id':3}, {'id':1}, {'id':4}]", result, JSONCompareMode.STRICT_ORDER);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/sort_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testGetDataWithSortMultiProps() throws Exception {  // FIXME
        // Two property sorting
        final String result = makeQuery("/resources/test_data/data?sort=(%2BwhiteSpace,-testDate)", 200)
                .getBody();
        JSONAssert.assertEquals("[{'id':4}, {'id':3}, {'id':1}, {'id':2}]", result, JSONCompareMode.STRICT_ORDER);
    }

    @Test
    public void testDataCount() throws Exception {
        final String result = makeQuery("/resources/test_data/data/count", 200).getBody();
        JSONAssert.assertEquals("2", result, false);
    }

    @Test
    public void testDataCountWithFilter() throws Exception {
        final String result = makeQuery("/resources/test_data/data/count?filter=id==1", 200)
                .getBody();
        JSONAssert.assertEquals("1", result, false);
    }

    @Test
    public void testGetResource() throws Exception {
        final String result = makeQuery("/resources/test_data", 200).getBody();
        assertNotNull(result);
        String expected = "[ {" +
                "  'name' : 'id'," +
                "  'type' : 'number'" +
                "}, {" +
                "  'name' : 'testText'," +
                "  'type' : 'string'" +
                "}, {" +
                "  'name' : 'testNumber'," +
                "  'type' : 'number'" +
                "}, {" +
                "  'name' : 'testDate'," +
                "  'type' : 'date'," +
                "  'format' : 'yyyy-MM-dd HH:mm:ss'" +
                "}, {" +
                "  'name' : 'whiteSpace'," +
                "  'type' : 'boolean'" +
                "} ]";
        JSONAssert.assertEquals(expected, result, false);
    }

    @Test
    public void testGetResources() throws Exception {
        final String result = makeQuery("/resources", 200).getBody();
        JSONAssert.assertEquals("['test_data', 'test_data_2']", result, false);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/sort_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testDefaultOrder() throws Exception {
        final String result = makeQuery("/resources/test_data/data", 200).getBody();
        JSONAssert.assertEquals("[{'id': 3}, {'id': 4}, {'id': 1}, {'id': 2}]", result, JSONCompareMode.STRICT_ORDER);
    }

    @Test
    @Sql(executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD,
            scripts = {"/sql/init.sql", "/sql/sort_test_data.sql"})
    @Sql(executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD,
            scripts = "/sql/clear.sql")
    public void testDefaultOrderWithOverride() throws Exception {
        final String oldConfig = configService.getDefaultOrderColumn();
        configService.setDefaultOrderColumn("testNumber");
        final String result = makeQuery("/resources/test_data/data", 200).getBody();
        JSONAssert.assertEquals("[{'id': 4}, {'id': 2}, {'id': 1}, {'id': 3}]", result, JSONCompareMode.STRICT_ORDER);
        configService.setDefaultOrderColumn(oldConfig);
    }

    private ResponseEntity<String> makeQuery(String url, int expectedStatus) throws URISyntaxException, UnsupportedEncodingException {
        URI uri = new URI(url);
        final ResponseEntity<String> responseEntity = restTemplate
                .getForEntity(uri,
                        String.class);
        assertEquals("Response code should match!", expectedStatus,
                responseEntity.getStatusCodeValue());
        assertEquals("Content-type should match!", MediaType.APPLICATION_JSON,
                responseEntity.getHeaders().getContentType());
        return responseEntity;
    }

    @Bean
    public HttpFirewall getHttpFirewall() {
        StrictHttpFirewall strictHttpFirewall = new StrictHttpFirewall();
        strictHttpFirewall.setAllowSemicolon(true);
        strictHttpFirewall.setAllowUrlEncodedPercent(true);
        strictHttpFirewall.setAllowedHostnames(hostname -> hostname.startsWith("127.0.0.1"));
        return strictHttpFirewall;
    }

    private String encodeValue(String value) throws UnsupportedEncodingException {
        return URLEncoder.encode(value, StandardCharsets.UTF_8.toString());
    }
}
