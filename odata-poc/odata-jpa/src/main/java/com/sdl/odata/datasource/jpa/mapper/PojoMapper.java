package com.sdl.odata.datasource.jpa.mapper;

import javassist.NotFoundException;
import org.apache.commons.lang3.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;

/**
 * Created by aheikkinen on 22/07/16.
 */
public class PojoMapper {

    public static final Class[] defaultClasses = new Class[] {
        String.class,
        Integer.class,
        Long.class,
        Short.class,
        Boolean.class,
        Date.class
    };

    public static boolean isDefaultAssignable(Class<?> clazz) {
        return Arrays.stream(defaultClasses).anyMatch( c -> c.isAssignableFrom(clazz));
    }

    /**
     * Convert Jpa class into Edm-supported class name
     *
     * @param clazz target jpa class
     * @return Edm-supported class name
     * @throws NotFoundException in case class does not exist
     */
    public static String jpaToEdmClassName(final Class<?> clazz) throws NotFoundException {
        return jpaToEdmClass(clazz).getName();
    }

    /**
     * Convert Jpa class into Edm-supported class
     *
     * @param clazz target jpa class
     * @return Edm-supported class
     */
    public static Class<?> jpaToEdmClass(final Class<?> clazz) {

        // Date is represented as String
        if(clazz == Date.class) {
            return String.class;

            // Type is supported
        } else {
            return clazz;
        }
    }

    /**
     * Convert Jpa object into Edm-supported types
     *
     * @param value target value
     * @return Edm-supported type
     */
    public static Object jpaToEdmValue(final Object value) {

        // Null-pointer handling
        if(null == value) {
            return null;

            // Date is converted into String
        } else if(value instanceof Date) {
            return new SimpleDateFormat("yyyy-MM-dd").format((Date) value);

            // Type is supported
        } else {
            return value;
        }
    }

    /**
     * Convert Edm value into Jpa value
     *
     * @param jpaClass target Jpa class
     * @param value Edm value
     * @return Edm value converted into Jpa value
     */
    public static Object edmToJpaValue(final Class<?> jpaClass, final Object value) {
        if(null == jpaClass || null == value) {
            return null;

        // Number conversion
        } else if(value instanceof scala.math.BigDecimal) {
            final scala.math.BigDecimal number = (scala.math.BigDecimal) value;

            if(isClassAny(jpaClass, long.class, Long.class)) {
                return number.longValue();

            } else if(isClassAny(jpaClass, int.class, Integer.class)) {
                return number.intValue();

            } else if(isClassAny(jpaClass, short.class, Short.class)) {
                return number.shortValue();
            }
        }
        return value;
    }

    private static boolean isClassAny(final Class<?> clazz, final Class<?>... targetClasses) {
        return Arrays.stream(targetClasses).anyMatch(targetClass -> StringUtils.equals(clazz.getName(), targetClass.getName()));
    }
}
