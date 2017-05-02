package fi.csc.antero.repository;

import java.sql.JDBCType;
import java.util.Arrays;

public enum PropType {
    INTEGER(PathType.NUMBER, JDBCType.INTEGER),
    FLOAT(PathType.NUMBER, JDBCType.REAL),
    LONG(PathType.NUMBER, JDBCType.BIGINT),
    DOUBLE(PathType.NUMBER, JDBCType.DOUBLE, JDBCType.FLOAT),
    BIG_DECIMAL(PathType.NUMBER, JDBCType.DECIMAL, JDBCType.NUMERIC),
    BYTE(PathType.NUMBER, JDBCType.TINYINT),
    SHORT(PathType.NUMBER, JDBCType.SMALLINT),
    STRING(PathType.STRING, JDBCType.VARCHAR, JDBCType.NVARCHAR, JDBCType.CHAR),
    BOOLEAN(PathType.BOOLEAN, JDBCType.BIT, JDBCType.BOOLEAN),
    DATE(PathType.DATE, JDBCType.DATE),
    TIME(PathType.TIME, JDBCType.TIME),
    DATETIME(PathType.DATETIME, JDBCType.TIMESTAMP);

    private final PathType pathType;
    private final JDBCType[] jdbcTypes;

    PropType(PathType pathType, JDBCType... jdbcTypes) {
        this.pathType = pathType;
        this.jdbcTypes = jdbcTypes;
    }

    public static PropType valueOf(JDBCType jdbcType) {
        return Arrays.stream(values())
                .filter(p -> Arrays.stream(p.getJdbcTypes())
                        .anyMatch(t -> t == jdbcType)).findFirst()
                .orElse(null);
    }

    public PathType getPathType() {
        return pathType;
    }

    private JDBCType[] getJdbcTypes() {
        return jdbcTypes;
    }
}
