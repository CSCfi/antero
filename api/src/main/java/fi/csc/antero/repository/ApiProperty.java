package fi.csc.antero.repository;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ApiProperty {

    private String apiName;
    private String sqlName;
    private PropType type;

    public ApiProperty(String apiName, String sqlName, PropType type) {
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

    @JsonIgnore
    public PropType getType() {
        return type;
    }

    @JsonProperty("type")
    public String getJsonType() {
        return type.getPathType().getName();
    }

    @JsonProperty("format")
    public String getJsonFormat() {
        return type.getPathType().getFormat();
    }
}
