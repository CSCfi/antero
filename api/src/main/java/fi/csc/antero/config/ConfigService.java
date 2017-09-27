package fi.csc.antero.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class ConfigService {

    @Value("${api.db.schema}")
    private String schema;

    @Value("${api.db.default_order_column:defaultorder}")
    private String defaultOrderColumn;

    public String getSchema() {
        return schema;
    }

    public void setSchema(String schema) {
        this.schema = schema;
    }

    public String getDefaultOrderColumn() {
        return defaultOrderColumn;
    }

    public void setDefaultOrderColumn(String defaultOrderColumn) {
        this.defaultOrderColumn = defaultOrderColumn;
    }
}
