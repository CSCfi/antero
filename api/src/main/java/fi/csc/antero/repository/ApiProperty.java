package fi.csc.antero.repository;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class ApiProperty {

    private final String apiName;
    private final String sqlName;
    private final PropType type;
    private final Boolean hidden;

    public ApiProperty(String apiName, String sqlName, PropType type, Boolean hidden) {
        this.apiName = apiName;
        this.sqlName = sqlName;
        this.type = type;
        this.hidden = hidden;
    }

    @JsonProperty("name")
    public String getApiName() {
        return apiName;
    }

    @JsonIgnore
    public Boolean isHidden() {
        return hidden;
    }

    @JsonIgnore
    String getSqlName() {
        return sqlName;
    }

    @JsonIgnore
    PropType getType() {
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
