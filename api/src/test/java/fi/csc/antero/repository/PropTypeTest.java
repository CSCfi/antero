package fi.csc.antero.repository;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

import java.sql.JDBCType;

public class PropTypeTest {
    @Test
    public void testValueOf() throws Exception {
        assertEquals(PropType.STRING, PropType.valueOf(JDBCType.VARCHAR));
        assertEquals(PropType.BOOLEAN, PropType.valueOf(JDBCType.BIT));
        assertEquals(PropType.BOOLEAN, PropType.valueOf(JDBCType.BOOLEAN));
        assertEquals(PropType.DOUBLE, PropType.valueOf(JDBCType.FLOAT));
    }

}