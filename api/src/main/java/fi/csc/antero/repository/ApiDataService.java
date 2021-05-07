package fi.csc.antero.repository;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.vineey.rql.filter.parser.DefaultFilterParser;
import com.github.vineey.rql.querydsl.filter.QueryDslFilterContext;
import com.github.vineey.rql.querydsl.page.QuerydslPageParser;
import com.github.vineey.rql.querydsl.sort.OrderSpecifierList;
import com.github.vineey.rql.querydsl.sort.QuerydslSortContext;
import com.github.vineey.rql.sort.parser.DefaultSortParser;
import com.querydsl.core.QueryModifiers;
import com.querydsl.core.types.OrderSpecifier;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.Expressions;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringTemplate;
import com.querydsl.sql.SQLQuery;
import com.querydsl.sql.SQLQueryFactory;
import fi.csc.antero.config.ConfigService;
import fi.csc.antero.controller.ApiQuery;
import fi.csc.antero.dao.ApiDataDao;
import fi.csc.antero.exception.FilterException;
import fi.csc.antero.response.JsonRowHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class ApiDataService {

    private final Logger log = LoggerFactory.getLogger(getClass());

    private final ApiDataDao dataDao;
    private final ObjectMapper om;
    private final SQLQueryFactory queryFactory;
    private final ConfigService configService;

    @Autowired
    public ApiDataService(ApiDataDao dataDao, ObjectMapper om, SQLQueryFactory queryFactory, ConfigService configService) {
        this.dataDao = dataDao;
        this.om = om;
        this.queryFactory = queryFactory;
        this.configService = configService;
    }

    public void streamToJsonArray(String table, OutputStream out, ApiQuery query)
            throws IOException, SQLException {
        final JsonGenerator jg = om.getFactory().createGenerator(out);
        jg.writeStartArray();
        final StringTemplate path = getFromExpression(table);
        final SQLQuery<String> sql = queryFactory.select(Expressions.stringTemplate("*"))
                .from(path)
                .where(createFilterPredicate(table, query.getFilter()))
                .orderBy(createOrderSpecifiers(table, query.getSort()))
                .restrict(createLimitQueryModifier(query.getOffset(), query.getLimit()));
        sql.setUseLiterals(true);
        final String queryString = sql.getSQL().getSQL();
        final JsonRowHandler rowHandler = new JsonRowHandler(jg, dataDao.queryTableColumns(table));
        dataDao.queryForStream(queryString, rowHandler);
        jg.writeEndArray();
        jg.flush();
    }

    public Long getCount(String table, String filter) throws SQLException {
        final SQLQuery<Long> sqlQuery = queryFactory.select(Expressions.stringTemplate("*").count())
                .from(getFromExpression(table))
                .where(createFilterPredicate(table, filter));
        sqlQuery.setUseLiterals(true);
        return dataDao.queryCount(sqlQuery.getSQL().getSQL());
    }

    public Set<String> listResources() throws SQLException {
        return dataDao.queryTableNames();
    }

    public List<ApiProperty> listResourceProperties(String resource) throws SQLException {
        return dataDao.queryTableColumns(resource).stream()
                .filter(p -> !p.isHidden())
                .collect(Collectors.toList());
    }

    private Predicate createFilterPredicate(String table, String filter) throws SQLException {
        if (StringUtils.isEmpty(filter)) {
            return null;
        }
        final Map<String, Path> pathMap = getPathMap(table);

        try {
            return new DefaultFilterParser().parse(filter, QueryDslFilterContext.withMapping(pathMap));
        } catch (Throwable t) {
            final String msg = String.format("Filtering error! Table: '%s', Filter: '%s'", table, filter);
            log.error(msg, t);
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
            final String msg = String.format("Limit error! Limit: '%s'", limitStr);
            log.error(msg, t);
            throw new FilterException("Bad limit parameter! Cause: " + t.getMessage());
        }
    }

    private OrderSpecifier[] createOrderSpecifiers(String table, String sort) {
        final OrderSpecifier[] orderSpecifiers = {};
        if (StringUtils.isEmpty(sort)) {
			sort = "(+" + configService.getDefaultOrderColumn() + ")";
		} else if (!StringUtils.isEmpty(sort)) {
			sort = sort.substring(0, sort.length()-2) + ",+" + configService.getDefaultOrderColumn() + ")";
		} 

        DefaultSortParser sortParser = new DefaultSortParser();
        try {
            OrderSpecifierList orderSpecifierList = sortParser.parse("sort" + sort,
                    QuerydslSortContext.withMapping(getPathMap(table)));

            return orderSpecifierList.getOrders().toArray(orderSpecifiers);
        } catch (Throwable t) {
            final String msg = String.format("Sort error! Table: '%s', Sort: '%s'", table, sort);
            log.error(msg, t);
            throw new FilterException("Bad sorting parameter! Cause: " + t.getMessage());
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
                path = getNumberPath(type, variable);
            } else if (type.getPathType() == PathType.DATE) {
                path = Expressions.datePath(LocalDate.class, variable);
            } else if (type.getPathType() == PathType.TIME) {
                path = Expressions.timePath(LocalTime.class, variable);
            } else if (type.getPathType() == PathType.DATETIME) {
                path = Expressions.dateTimePath(LocalDateTime.class, variable);
            } else {
                continue;
            }
            pathMap.put(column.getApiName(), path);
        }
        return pathMap;
    }

    private NumberPath getNumberPath(PropType type, String variable) {
        switch (type) {
            case INTEGER:
                return Expressions.numberPath(Integer.class, variable);
            case BIG_DECIMAL:
                return Expressions.numberPath(BigDecimal.class, variable);
            case FLOAT:
                return Expressions.numberPath(Float.class, variable);
            case DOUBLE:
                return Expressions.numberPath(Double.class, variable);
            case LONG:
                return Expressions.numberPath(Long.class, variable);
            case SHORT:
                return Expressions.numberPath(Short.class, variable);
            case BYTE:
                return Expressions.numberPath(Byte.class, variable);
            default:
                return null;
        }
    }

    private StringTemplate getFromExpression(String table) {
        StringBuilder sb = new StringBuilder();
        final String schema = configService.getSchema();
        if (!schema.isEmpty()) {
            sb.append(schema).append(".");
        }
        sb.append(table);
        return Expressions.stringTemplate(sb.toString());
    }
}
