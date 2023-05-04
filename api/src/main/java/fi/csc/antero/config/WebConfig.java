package fi.csc.antero.config;

import fi.csc.antero.analytic.interceptor.AnalyticsInterceptor;
import fi.csc.antero.analytic.service.AnalyticService;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final AnalyticService analyticService;
    public WebConfig(AnalyticService analyticService) {
        this.analyticService = analyticService;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AnalyticsInterceptor(analyticService)).addPathPatterns("/resources/{resource}/data");
    }
}
