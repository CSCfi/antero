package fi.csc.antero.dao;

import fi.csc.antero.repository.ApiProperty;
import fi.csc.antero.repository.PropType;
import fi.csc.antero.response.JsonRowHandler;
import fi.csc.antero.util.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import java.sql.DatabaseMetaData;
import java.sql.JDBCType;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Component
public class ApiDataDao {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private final JdbcTemplate jdbcTemplate;

    @Value("${api.db.schema}")
    private String schema;

    @Autowired
    public ApiDataDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void queryForStream(String query, JsonRowHandler rowHandler) {
        log.info("Execute query [{}]", query);
        jdbcTemplate.query(query,
                ps -> ps.setFetchDirection(ResultSet.FETCH_FORWARD),
                rowHandler);
    }

    @Cacheable("count")
    public Long queryCount(String countQuery) throws SQLException {
        log.info("Execute count query [{}]", countQuery);
        return jdbcTemplate.queryForObject(countQuery, Long.class);
    }

    @Cacheable("tables")
    public Set<String> queryTableNames() throws SQLException {
        final DatabaseMetaData metaData = jdbcTemplate.getDataSource().getConnection().getMetaData();
        final ResultSet resultSet = metaData.getTables(null, schema, "%", new String[]{"TABLE", "VIEW"});
        Set<String> tableNames = new HashSet<>();
        while (resultSet.next()) {
            tableNames.add(resultSet.getString("TABLE_NAME"));
        }
        return tableNames;
    }

    @Cacheable("columns")
    public List<ApiProperty> queryTableColumns(String table) throws SQLException {
        final List<ApiProperty> columns = new ArrayList<>();
        final DatabaseMetaData metaData = jdbcTemplate.getDataSource().getConnection().getMetaData();
        final ResultSet resultSet = metaData.getColumns(null, schema, table, "%");
        while (resultSet.next()) {
            final int dataType = resultSet.getInt("DATA_TYPE");
            final String sqlName = resultSet.getString("COLUMN_NAME");
            columns.add(new ApiProperty(Utils.convertToCamelCase(sqlName), sqlName,
                    PropType.valueOf(JDBCType.valueOf(dataType))));
        }
        return columns;
    }
}
