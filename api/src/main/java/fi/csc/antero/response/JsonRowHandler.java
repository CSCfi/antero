package fi.csc.antero.response;

import fi.csc.antero.repository.ApiProperty;
import fi.csc.antero.repository.PropType;
import tools.jackson.core.JacksonException;
import tools.jackson.core.JsonGenerator;
import org.springframework.jdbc.core.RowCallbackHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class JsonRowHandler implements RowCallbackHandler {

    private static final DateTimeFormatter DATE_FMT = DateTimeFormatter.ISO_LOCAL_DATE; // yyyy-MM-dd

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
                ApiProperty apiProperty = properties.get(i);
                if (apiProperty.isHidden()) continue;

                String name = apiProperty.getApiName();
                PropType type = apiProperty.getType();

                Object raw = rs.getObject(i + 1);
                if (raw == null) {
                    jsonGenerator.writeNullProperty(name);
                    continue;
                }
                // Normalize all date/time values: remove timezone and time-of-day (keep date only).
                switch (type) {
                    case DATE, DATETIME -> {
                        LocalDate d = rs.getObject(i + 1, LocalDate.class);
                        // Assumes DB stores timestamps in UTC
                        jsonGenerator.writeStringProperty(name, d.format(DATE_FMT));
                    }
                    default -> jsonGenerator.writePOJOProperty(name, raw);
                }
            }

            jsonGenerator.writeEndObject();
            jsonGenerator.flush();
            count++;
        } catch (JacksonException e) {
            throw new SQLException("Could not process result set row!", e);
        }
    }

    public long getCount() {
        return count;
    }
}