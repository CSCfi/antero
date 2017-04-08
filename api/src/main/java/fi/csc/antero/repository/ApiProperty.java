package fi.csc.antero.repository;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.sql.JDBCType;

public class ApiProperty {

    private String apiName;
    private String sqlName;
    private JDBCType type;

    public ApiProperty(String apiName, String sqlName, JDBCType type) {
        this.apiName = apiName;
        this.sqlName = sqlName;
        this.type = type;
    }

    @JsonProperty("name")
    public String getApiName() {
        return apiName;
    }

    @JsonIgnore
    public String getSqlName() {
        return sqlName;
    }

    public JDBCType getType() {
        return type;
    }
}
