package fi.csc.antero.response;

import com.fasterxml.jackson.core.JsonGenerator;
import fi.csc.antero.repository.ApiProperty;
import org.springframework.jdbc.core.RowCallbackHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

public class JsonRowHandler implements RowCallbackHandler {

    private final JsonGenerator jsonGenerator;
    private final List<ApiProperty> properties;
    private long count = 0;

    public JsonRowHandler(JsonGenerator jsonGenerator, List<ApiProperty> properties) {
        this.jsonGenerator = jsonGenerator;
        this.properties = properties;
    }

    @Override
    public void processRow(ResultSet rs) throws SQLException {
        try {
            jsonGenerator.writeStartObject();
            for (int i = 0; i < properties.size(); i++) {
                final ApiProperty apiProperty = properties.get(i);
                if (apiProperty.isHidden()) {
                    continue;
                }
                Object value = rs.getObject(i + 1);
                String name = apiProperty.getApiName();
                jsonGenerator.writeObjectField(name, value);
            }
            jsonGenerator.writeEndObject();
            jsonGenerator.flush();
            count++;
        } catch (IOException e) {
            throw new SQLException("Could not process result set row!", e);
        }
    }

    public long getCount() {
        return count;
    }
}
