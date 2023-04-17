package fi.csc.antero.repository;

import org.junit.jupiter.api.Test;

import java.sql.JDBCType;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class PropTypeTest {
    @Test
    public void testValueOf() throws Exception {
        assertEquals(PropType.STRING, PropType.valueOf(JDBCType.VARCHAR));
        assertEquals(PropType.BOOLEAN, PropType.valueOf(JDBCType.BIT));
        assertEquals(PropType.BOOLEAN, PropType.valueOf(JDBCType.BOOLEAN));
        assertEquals(PropType.DOUBLE, PropType.valueOf(JDBCType.FLOAT));
    }

}