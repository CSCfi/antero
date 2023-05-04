package fi.csc.antero.analytic.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface EnableAnalytics {
    String path();
    int resource() default 0;
    int query() default 1;
    int filter() default 1;
}
