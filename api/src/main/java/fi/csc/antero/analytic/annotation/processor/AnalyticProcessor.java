package fi.csc.antero.analytic.annotation.processor;

import fi.csc.antero.analytic.annotation.EnableAnalytics;
import fi.csc.antero.analytic.service.AnalyticService;
import fi.csc.antero.analytic.log.AnalyticsLogger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.math.RoundingMode;


@Aspect
@Component
public class AnalyticProcessor {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    @Value("${api.analytics.logging.delimiter}")
    private String DELIMITER;

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
        String requestURI = request.getRequestURI();
        String referer = request.getHeader("Referer");
        boolean isSwaggerReq;
        if (referer != null) {
            isSwaggerReq = referer.contains("swagger");
        } else {
            isSwaggerReq = false;
        }
        logger.debug("logApiCall");
        String queryString = request.getQueryString();
        try {
            return pjp.proceed();
        } finally {
            logger.debug("logApiCall finally");
            String ip = getClientIp(request);
            analyticService.submit(request, () -> {
                logger.debug("logApiCall task started");
                double durationSeconds = (System.currentTimeMillis() - start) / 1000d;
                double duration = BigDecimal.valueOf(durationSeconds)
                        .setScale(3, RoundingMode.HALF_UP).doubleValue();

                analyticsLogger.log(start
                        + DELIMITER + ip
                        + DELIMITER + requestURI
                        + DELIMITER + queryString
                        + DELIMITER + duration
                        + DELIMITER + isSwaggerReq);
                logger.debug("logApiCall task stopped");
            });
        }
    }
    private String getClientIp(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");
        if (ip == null) {
            return request.getRemoteAddr();
        }
        if (ip.contains(",")) {
            return ip.split(",")[0];
        }
        return ip;
    }
}