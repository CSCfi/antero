package fi.csc.antero.util;

import static org.junit.Assert.*;
import org.junit.Test;

public class UtilsTest {
    @Test
    public void convertToCamelCase() throws Exception {
        assertEquals("whiteSpace", Utils.convertToCamelCase("white space"));
        assertEquals("underScoreString", Utils.convertToCamelCase("Under_score String"));
    }

}