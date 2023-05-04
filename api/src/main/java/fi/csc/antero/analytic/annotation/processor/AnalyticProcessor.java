package fi.csc.antero.analytic.annotation.processor;

import fi.csc.antero.analytic.annotation.EnableAnalytics;
import fi.csc.antero.analytic.service.AnalyticService;
import fi.csc.antero.controller.ApiQuery;
import fi.csc.antero.analytic.log.AnalyticsLogger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;


@Aspect
@Component
public class AnalyticProcessor {

    @Value("${api.analytics.logging.delimiter}")
    private String DELIMITER;
    @Value("${api.analytics.logging.query.delimiter}")
    private String QUERY_DELIMITER;
    private final AnalyticsLogger analyticsLogger;
    private final AnalyticService analyticService;
    @Autowired
    private HttpServletRequest request;

    @Autowired
    public AnalyticProcessor(AnalyticsLogger analyticsLogger, AnalyticService analyticService) {
        this.analyticsLogger = analyticsLogger;
        this.analyticService = analyticService;
    }

    @Pointcut("@annotation(enableAnalytics)")
    private void apiCall(EnableAnalytics enableAnalytics) {}

    @Around(value = "apiCall(enableAnalytics)", argNames = "pjp,enableAnalytics")
    public Object logApiCall(ProceedingJoinPoint pjp, EnableAnalytics enableAnalytics) throws Throwable {
        final long start = System.currentTimeMillis();
        try {
            return pjp.proceed();
        } finally {
            String ip = request.getRemoteAddr();
            analyticService.submit(request, () -> {
                double durationSeconds = (System.currentTimeMillis() - start) / 1000d;
                double duration = BigDecimal.valueOf(durationSeconds)
                        .setScale(3, RoundingMode.HALF_UP).doubleValue();
                Object[] args = pjp.getArgs();
                String resource = getOrEmpty(args, enableAnalytics.resource());
                String filter = getOrEmpty(args, enableAnalytics.filter());
                String query = getOrEmpty(args, enableAnalytics.query());

                analyticsLogger.log(ip
                        + (resource.isEmpty() ? DELIMITER : DELIMITER + "resource=" + resource)
                        + (filter.isEmpty() ? "" : QUERY_DELIMITER + "filter=" + filter)
                        + (query.isEmpty() ? "" : QUERY_DELIMITER + query)
                        + DELIMITER + enableAnalytics.path()
                        + DELIMITER + duration);
            });
        }
    }

    private String getOrEmpty(Object[] arr, int index) {
        try {
            Object obj = arr[index];
            if (obj.getClass() == String.class) {
                return obj.toString();
            } else if (obj.getClass() == ApiQuery.class) {
                return  "sort='" + ((ApiQuery) obj).getSort() + '\'' +
                        QUERY_DELIMITER+ "offset=" + ((ApiQuery) obj).getOffset() +
                        QUERY_DELIMITER + "filter=" + ((ApiQuery) obj).getFilter() +
                        QUERY_DELIMITER + "limit=" + ((ApiQuery) obj).getLimit();
            }
        } catch (Exception ignored) {}
        return "";
    }
}