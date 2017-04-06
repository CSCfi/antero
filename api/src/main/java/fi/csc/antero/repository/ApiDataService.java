package fi.csc.antero.repository;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import fi.csc.antero.response.JsonRowHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

@Component
public class ApiDataService {

    private final JdbcTemplate jdbcTemplate;
    private final ObjectMapper om;

    @Value("${api.db.schema}")
    private String schema;

    @Autowired
    public ApiDataService(JdbcTemplate jdbcTemplate, ObjectMapper om) {
        this.jdbcTemplate = jdbcTemplate;
        this.om = om;
    }

    public void streamToJsonArray(String resource, OutputStream out) throws IOException {
        final JsonGenerator jg = om.getFactory().createGenerator(out);
        StringBuilder sb = new StringBuilder("SELECT * FROM ");
        if (!schema.isEmpty()) {
            sb.append(schema).append(".");
        }
        sb.append(resource);
        jg.writeStartArray();
        jdbcTemplate.query(sb.toString(),
                ps -> ps.setFetchDirection(ResultSet.FETCH_FORWARD),
                new JsonRowHandler(jg));
        jg.writeEndArray();
        jg.flush();
    }

    @Cacheable("tables")
    public Set<String> getTableNames() throws SQLException {
        final DatabaseMetaData metaData = jdbcTemplate.getDataSource().getConnection().getMetaData();
        final ResultSet resultSet = metaData.getTables(null, schema, "%", new String[]{"TABLE", "VIEW"});
        Set<String> tableNames = new HashSet<>();
        while (resultSet.next()) {
            tableNames.add(resultSet.getString(3));
        }
        return tableNames;
    }
}
