package fi.csc.antero.dao;

import fi.csc.antero.config.ConfigService;
import fi.csc.antero.repository.ApiProperty;
import fi.csc.antero.repository.PropType;
import fi.csc.antero.response.JsonRowHandler;
import fi.csc.antero.util.Utils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class ApiDataDao {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private final JdbcTemplate jdbcTemplate;
    private final ConfigService configService;

    @Autowired
    public ApiDataDao(JdbcTemplate jdbcTemplate, ConfigService configService) {
        this.jdbcTemplate = jdbcTemplate;
        this.configService = configService;
    }

    public void queryForStream(String query, JsonRowHandler rowHandler) {
        log.info("Execute query [{}]", query);
        jdbcTemplate.query(query,
                ps -> ps.setFetchDirection(ResultSet.FETCH_FORWARD),
                rowHandler);
    }

    @Cacheable("count")
    public Long queryCount(String countQuery) {
        log.info("Execute count query [{}]", countQuery);
        return jdbcTemplate.queryForObject(countQuery, Long.class);
    }

    @Cacheable("tables")
    public Set<String> queryTableNames() throws SQLException {
        Set<String> tableNames = null;
        try (Connection connection = jdbcTemplate.getDataSource().getConnection()) {
            final DatabaseMetaData metaData = connection.getMetaData();
            final ResultSet resultSet = metaData.getTables(null, configService.getSchema(), "%", new String[]{"TABLE", "VIEW"});
            tableNames = new HashSet<>();
            while (resultSet.next()) {
                tableNames.add(resultSet.getString("TABLE_NAME"));
            }
        } catch (NullPointerException np) {
            log.error("Database connection failed!", np);
        }
        return tableNames;
    }

    @Cacheable("columns")
    public List<ApiProperty> queryTableColumns(String table) throws SQLException {
        final List<ApiProperty> columns = new ArrayList<>();
        try (Connection connection = jdbcTemplate.getDataSource().getConnection()) {
            final ResultSet resultSet = connection.getMetaData().getColumns(null, configService.getSchema(), table, "%");
            while (resultSet.next()) {
                final int dataType = resultSet.getInt("DATA_TYPE");
                final String sqlName = resultSet.getString("COLUMN_NAME");
                columns.add(new ApiProperty(Utils.convertToCamelCase(sqlName), sqlName,
                        PropType.valueOf(JDBCType.valueOf(dataType)), sqlName.equals(configService.getDefaultOrderColumn())));
            }
        } catch (NullPointerException np) {
            log.error("Database connection failed!", np);
        }
        return columns;
    }
}
