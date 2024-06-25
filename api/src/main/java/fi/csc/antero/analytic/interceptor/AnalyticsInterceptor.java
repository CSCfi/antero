package fi.csc.antero.analytic.interceptor;

import fi.csc.antero.analytic.service.AnalyticService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;

import jakarta.servlet.DispatcherType;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.UUID;

public class AnalyticsInterceptor implements HandlerInterceptor {

    private final Logger logger = LoggerFactory.getLogger(getClass());
    AnalyticService analyticService;
    public AnalyticsInterceptor(AnalyticService analyticService) {
        this.analyticService = analyticService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.debug("AnalyticsInterceptor#preHandle");
        if (request.getDispatcherType() == DispatcherType.REQUEST) {
            request.setAttribute("UUID", UUID.randomUUID().toString());
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        logger.debug("afterCompletion");
        analyticService.process(request);
        request.removeAttribute("UUID");
    }
}
