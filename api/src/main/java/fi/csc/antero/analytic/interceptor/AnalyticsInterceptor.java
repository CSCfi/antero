package fi.csc.antero.analytic.interceptor;

import fi.csc.antero.analytic.service.AnalyticService;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.DispatcherType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

public class AnalyticsInterceptor implements HandlerInterceptor {
    AnalyticService analyticService;
    public AnalyticsInterceptor(AnalyticService analyticService) {
        this.analyticService = analyticService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (request.getDispatcherType() == DispatcherType.REQUEST) {
            request.setAttribute("UUID", UUID.randomUUID().toString());
        }
        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        analyticService.process(request);
    }
}
