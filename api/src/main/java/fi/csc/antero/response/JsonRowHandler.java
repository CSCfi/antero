package fi.csc.antero.response;

import com.fasterxml.jackson.core.JsonGenerator;
import org.springframework.jdbc.core.RowCallbackHandler;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class JsonRowHandler implements RowCallbackHandler {

    private final JsonGenerator jsonGenerator;

    public JsonRowHandler(JsonGenerator jsonGenerator) {
        this.jsonGenerator = jsonGenerator;
    }

    @Override
    public void processRow(ResultSet rs) throws SQLException {
        final ResultSetMetaData metaData = rs.getMetaData();
        try {
            jsonGenerator.writeStartObject();
            for (int i = 1; i <= metaData.getColumnCount(); i++) {
                Object value = rs.getObject(i);
                String colName = metaData.getColumnName(i);
                jsonGenerator.writeObjectField(colName, value);
            }
            jsonGenerator.writeEndObject();
            jsonGenerator.flush();
        } catch (IOException e) {
            throw new SQLException("Could not process result set row!", e);
        }
    }
}
