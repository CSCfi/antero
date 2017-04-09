package fi.csc.antero.repository;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.vineey.rql.filter.parser.DefaultFilterParser;
import static com.github.vineey.rql.querydsl.filter.QueryDslFilterContext.withMapping;
import com.github.vineey.rql.querydsl.page.QuerydslPageParser;
import com.querydsl.core.QueryModifiers;
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

    public Long streamToJsonArray(String table, OutputStream out, String filter, Long offset, Long limit) throws IOException, SQLException {
        final JsonGenerator jg = om.getFactory().createGenerator(out);
        final StringTemplate path = getFromExpression(table);
        final SQLQuery<String> sql = queryFactory.select(Expressions.stringTemplate("*"))
                .from(path)
                .where(createFilterPredicate(table, filter))
                .restrict(createLimitQueryModifier(offset, limit));
        sql.setUseLiterals(true);
        jg.writeStartArray();
        final String queryString = sql.getSQL().getSQL();
        log.info("Execute query [{}]", queryString);
        final JsonRowHandler rowHandler = new JsonRowHandler(jg, getTableColumns(table));
        jdbcTemplate.query(queryString,
                ps -> ps.setFetchDirection(ResultSet.FETCH_FORWARD),
                rowHandler);
        jg.writeEndArray();
        jg.flush();
        return rowHandler.getCount();
    }

    @Cacheable("count")
    public Long getCount(String table, String filter) throws SQLException {
        return queryFactory.select(Expressions.stringTemplate("*"))
                .from(getFromExpression(table))
                .where(createFilterPredicate(table, filter))
                .fetchCount();
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

    private QueryModifiers createLimitQueryModifier(Long offset, Long limit) {
        if (offset == null && limit == null) {
            return QueryModifiers.EMPTY;
        }
        String limitStr = "limit(%d,%d)";
        if (offset == null || offset < 0) {
            limitStr = String.format(limitStr, 0, limit);
        } else if (limit == null || limit < 0) {
            limitStr = String.format(limitStr, offset, Long.MAX_VALUE);
        } else {
            limitStr = String.format(limitStr, offset, limit);
        }
        QuerydslPageParser querydslPageParser = new QuerydslPageParser();
        try {
            return querydslPageParser.parse(limitStr);
        } catch (Throwable t) {
            log.error("Limit error!", t);
            throw new FilterException("Bad limit parameter! Cause: " + t.getMessage());
        }
    }

    private StringTemplate getFromExpression(String table) {
        StringBuilder sb = new StringBuilder();
        if (!schema.isEmpty()) {
            sb.append(schema).append(".");
        }
        sb.append(table);
        return Expressions.stringTemplate(sb.toString());
    }
}
