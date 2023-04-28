package fi.csc.antero.annotations.processor;

import fi.csc.antero.annotations.EnableAnalytics;
import fi.csc.antero.controller.ApiQuery;
import fi.csc.antero.log.AnalyticsLogger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;


@Aspect
@Component
public class AnalyticsProcessor {

    private final static String DELIMITER = "|~";
    private final static String QUERY_DELIMITER = "|~|";
    private final AnalyticsLogger analyticsLogger;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    public AnalyticsProcessor(AnalyticsLogger analyticsLogger) {
        this.analyticsLogger = analyticsLogger;
    }

    @Pointcut("@annotation(enableAnalytics)")
    private void apiCall(EnableAnalytics enableAnalytics) {}

    @Around(value = "apiCall(enableAnalytics)", argNames = "pjp,enableAnalytics")
    public Object logApiCall(ProceedingJoinPoint pjp, EnableAnalytics enableAnalytics) throws Throwable {
        final long start = System.currentTimeMillis();
        try {
            return pjp.proceed();
        } finally {
            long duration = (System.currentTimeMillis() - start) / 1000;
            Object[] args = pjp.getArgs();
            String resource = getOrEmpty(args, enableAnalytics.resource());
            String filter = getOrEmpty(args, enableAnalytics.filter());
            String query = getOrEmpty(args, enableAnalytics.query());

            analyticsLogger.log(request.getRemoteAddr()
                    + (resource.isEmpty() ? DELIMITER : DELIMITER + "resource=" + resource)
                    + (filter.isEmpty() ? "" : QUERY_DELIMITER + "filter=" + filter)
                    + (query.isEmpty() ? "" : QUERY_DELIMITER + query)
                    + DELIMITER + enableAnalytics.path()
                    + DELIMITER + duration);
        }
    }

    private String getOrEmpty(Object[] arr, int index) {
        try {
            Object obj = arr[index];
            if (obj.getClass() == String.class || obj.getClass() == ApiQuery.class) {
                return obj.toString();
            }
        } catch (Exception ignored) {}
        return "";
    }
}