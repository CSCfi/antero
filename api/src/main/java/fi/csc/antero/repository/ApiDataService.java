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
import fi.csc.antero.dao.ApiDataDao;
import fi.csc.antero.exception.FilterException;
import fi.csc.antero.response.JsonRowHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Component
public class ApiDataService {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private final ApiDataDao dataDao;
    private final ObjectMapper om;
    private final SQLQueryFactory queryFactory;

    @Value("${api.db.schema}")
    private String schema;

    @Autowired
    public ApiDataService(ApiDataDao dataDao, ObjectMapper om, SQLQueryFactory queryFactory) {
        this.dataDao = dataDao;
        this.om = om;
        this.queryFactory = queryFactory;
    }

    public void streamToJsonArray(String table, OutputStream out, String filter, Long offset, Long limit) throws IOException, SQLException {
        final JsonGenerator jg = om.getFactory().createGenerator(out);
        jg.writeStartArray();
        final StringTemplate path = getFromExpression(table);
        final SQLQuery<String> sql = queryFactory.select(Expressions.stringTemplate("*"))
                .from(path)
                .where(createFilterPredicate(table, filter))
                .restrict(createLimitQueryModifier(offset, limit));
        sql.setUseLiterals(true);
        final String queryString = sql.getSQL().getSQL();
        final JsonRowHandler rowHandler = new JsonRowHandler(jg, dataDao.queryTableColumns(table));
        dataDao.queryForStream(queryString, rowHandler);
        jg.writeEndArray();
        jg.flush();
    }

    public Long getCount(String table, String filter) throws SQLException {
        final String sql = queryFactory.select(Expressions.stringTemplate("*").count())
                .from(getFromExpression(table))
                .where(createFilterPredicate(table, filter))
                .getSQL().getSQL();
        return dataDao.queryCount(sql);
    }

    public Set<String> listResources() throws SQLException {
        return dataDao.queryTableNames();
    }

    public List<ApiProperty> listResourceProperties(String resource) throws SQLException {
        return dataDao.queryTableColumns(resource);
    }

    private Predicate createFilterPredicate(String table, String filter) throws SQLException {
        if (StringUtils.isEmpty(filter)) {
            return null;
        }
        final Map<String, Path> pathMap = getPathMap(table);

        try {
            return new DefaultFilterParser().parse(filter, withMapping(pathMap));
        } catch (Throwable t) {
            final String msg = String.format("Filtering error! Table: '%s', Filter: '%s'", table, filter);
            log.error(msg, t);
            throw new FilterException("Bad filtering parameter! Cause: " + t.getMessage());
        }
    }

    private Map<String, Path> getPathMap(String table) throws SQLException {
        final Map<String, Path> pathMap = new HashMap<>();
        for (ApiProperty column : dataDao.queryTableColumns(table)) {
            Path path;
            final PropType type = column.getType();
            final String variable = column.getSqlName();
            if (type.getPathType() == PathType.STRING) {
                path = Expressions.stringPath(variable);
            } else if (type.getPathType() == PathType.BOOLEAN) {
                path = Expressions.booleanPath(variable);
            } else if (type.getPathType() == PathType.NUMBER) {
                path = Expressions.numberPath(type.getJavaType(), variable);
            } else if (type.getPathType() == PathType.DATE) {
                path = Expressions.datePath(type.getJavaType(), variable);
            } else if (type.getPathType() == PathType.TIME) {
                path = Expressions.timePath(type.getJavaType(), variable);
            } else if (type.getPathType() == PathType.DATETIME) {
                path = Expressions.dateTimePath(type.getJavaType(), variable);
            } else {
                continue;
            }
            pathMap.put(column.getApiName(), path);
        }
        return pathMap;
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
