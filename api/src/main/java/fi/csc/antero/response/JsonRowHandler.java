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

    public JsonRowHandler(JsonGenerator jsonGenerator, List<ApiProperty> properties) {
        this.jsonGenerator = jsonGenerator;
        this.properties = properties;
    }

    @Override
    public void processRow(ResultSet rs) throws SQLException {
        try {
            jsonGenerator.writeStartObject();
            for (int i = 0; i < properties.size(); i++) {
                Object value = rs.getObject(i + 1);
                String name = properties.get(i).getApiName();
                jsonGenerator.writeObjectField(name, value);
            }
            jsonGenerator.writeEndObject();
            jsonGenerator.flush();
        } catch (IOException e) {
            throw new SQLException("Could not process result set row!", e);
        }
    }
}
