package fi.csc.antero.util;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class UtilsTest {
    @Test
    public void convertToCamelCase() throws Exception {
        assertEquals("whiteSpace", Utils.convertToCamelCase("white space"));
        assertEquals("underScoreString", Utils.convertToCamelCase("Under_score String"));
    }

}