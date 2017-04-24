package fi.csc.antero.repository;

import java.math.BigDecimal;
import java.sql.JDBCType;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Arrays;

public enum PropType {
    INTEGER(Integer.class, PathType.NUMBER, JDBCType.INTEGER),
    FLOAT(Float.class, PathType.NUMBER, JDBCType.REAL),
    LONG(Long.class, PathType.NUMBER, JDBCType.BIGINT),
    DOUBLE(Double.class, PathType.NUMBER, JDBCType.DOUBLE, JDBCType.FLOAT),
    BIG_DECIMAL(BigDecimal.class, PathType.NUMBER, JDBCType.DECIMAL, JDBCType.NUMERIC),
    BYTE(Byte.class, PathType.NUMBER, JDBCType.TINYINT),
    SHORT(Short.class, PathType.NUMBER, JDBCType.SMALLINT),
    STRING(String.class, PathType.STRING, JDBCType.VARCHAR, JDBCType.NVARCHAR, JDBCType.CHAR),
    BOOLEAN(Boolean.class, PathType.BOOLEAN, JDBCType.BIT, JDBCType.BOOLEAN),
    DATE(LocalDate.class, PathType.DATE, JDBCType.DATE),
    TIME(LocalTime.class, PathType.TIME, JDBCType.TIME),
    DATETIME(LocalDateTime.class, PathType.DATETIME, JDBCType.TIMESTAMP);

    private Class<?> javaType;
    private PathType pathType;
    private JDBCType[] jdbcTypes;

    PropType(Class<?> javaType, PathType pathType, JDBCType... jdbcTypes) {
        this.javaType = javaType;
        this.pathType = pathType;
        this.jdbcTypes = jdbcTypes;
    }

    public static PropType valueOf(JDBCType jdbcType) {
        return Arrays.stream(values())
                .filter(p -> Arrays.stream(p.getJdbcTypes())
                        .anyMatch(t -> t == jdbcType)).findFirst()
                .orElse(null);
    }

    public Class getJavaType() {
        return javaType;
    }

    public PathType getPathType() {
        return pathType;
    }

    public JDBCType[] getJdbcTypes() {
        return jdbcTypes;
    }
}
