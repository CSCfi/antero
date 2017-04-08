package fi.csc.antero.repository;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.vineey.rql.filter.parser.DefaultFilterParser;
import static com.github.vineey.rql.querydsl.filter.QueryDslFilterContext.withMapping;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.sql.SQLQuery;
import com.querydsl.sql.SQLQueryFactory;
import fi.csc.antero.exception.FilterException;
import fi.csc.antero.response.JsonRowHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.DatabaseMetaData;
import java.sql.Date;
import java.sql.JDBCType;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class ApiDataService {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private final JdbcTemplate jdbcTemplate;
    private final ObjectMapper om;
    private final SQLQueryFactory queryFactory;

    @Value("${api.db.schema}")
    private String schema;

    @Autowired
    public ApiDataService(JdbcTemplate jdbcTemplate, ObjectMapper om, SQLQueryFactory queryFactory) {
        this.jdbcTemplate = jdbcTemplate;
        this.om = om;
        this.queryFactory = queryFactory;
    }

    public void streamToJsonArray(String table, OutputStream out, String filter) throws IOException, SQLException {
        final JsonGenerator jg = om.getFactory().createGenerator(out);
        StringBuilder sb = new StringBuilder();
        if (!schema.isEmpty()) {
            sb.append(schema).append(".");
        }
        sb.append(table);
        final StringTemplate path = Expressions.stringTemplate(sb.toString());
        final SQLQuery<String> sql = queryFactory.select(Expressions.stringTemplate("*"))
                .from(path)
                .where(createFilterPredicate(table, filter));
        sql.setUseLiterals(true);
        jg.writeStartArray();
        jdbcTemplate.query(sql.getSQL().getSQL(),
                ps -> ps.setFetchDirection(ResultSet.FETCH_FORWARD),
                new JsonRowHandler(jg, getTableColumns(table)));
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

    @Cacheable("columns")
    public List<ApiProperty> getTableColumns(String table) throws SQLException {
        final List<ApiProperty> columns = new ArrayList<>();
        final DatabaseMetaData metaData = jdbcTemplate.getDataSource().getConnection().getMetaData();
        final ResultSet resultSet = metaData.getColumns(null, schema, table, "%");
        while (resultSet.next()) {
            final int dataType = resultSet.getInt("DATA_TYPE");
            final String sqlName = resultSet.getString("COLUMN_NAME");
            columns.add(new ApiProperty(sqlName.replaceAll("\\s", "_"), sqlName,
                    JDBCType.valueOf(dataType)));
        }
        return columns;
    }

    private Predicate createFilterPredicate(String table, String filter) throws SQLException {
        if (StringUtils.isEmpty(filter)) {
            return null;
        }
        final Map<String, Path> pathMap = new HashMap<>();
        for (ApiProperty column : getTableColumns(table)) {
            Path path = null;
            final JDBCType value = column.getType();
            final String variable = column.getSqlName();
            if (value == JDBCType.VARCHAR || value == JDBCType.NVARCHAR || value == JDBCType.CHAR) {
                path = Expressions.stringPath(variable);
            } else if (value == JDBCType.INTEGER) {
                path = Expressions.numberPath(Integer.class, variable);
            } else if (value == JDBCType.BIGINT) {
                path = Expressions.numberPath(Long.class, variable);
            } else if (value == JDBCType.DOUBLE || value == JDBCType.FLOAT) {
                path = Expressions.numberPath(Double.class, variable);
            } else if (value == JDBCType.REAL) {
                path = Expressions.numberPath(Float.class, variable);
            } else if (value == JDBCType.DECIMAL || value == JDBCType.NUMERIC) {
                path = Expressions.numberPath(BigDecimal.class, variable);
            } else if (value == JDBCType.BIT || value == JDBCType.BOOLEAN) {
                path = Expressions.booleanPath(variable);
            } else if (value == JDBCType.SMALLINT) {
                path = Expressions.numberPath(Short.class, variable);
            } else if (value == JDBCType.TINYINT) {
                path = Expressions.numberPath(Byte.class, variable);
            } else if (value == JDBCType.DATE) {
                path = Expressions.datePath(Date.class, variable);
            } else if (value == JDBCType.TIME) {
                path = Expressions.timePath(Time.class, variable);
            } else if (value == JDBCType.TIMESTAMP) {
                path = Expressions.dateTimePath(Timestamp.class, variable);
            }
            if (path == null) {
                continue;
            }
            pathMap.put(column.getApiName(), path);
        }

        try {
            return new DefaultFilterParser().parse(filter, withMapping(pathMap));
        } catch (Throwable t) {
            log.error("Filtering error!", t);
            throw new FilterException("Bad filtering parameter! Cause: " + t.getMessage());
        }
    }
}
