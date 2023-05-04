package fi.csc.antero.analytic.log;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service
public class AnalyticsLogger {
    private final Logger analyticsLogger = LoggerFactory.getLogger(getClass());
    @Async
    public void log(String msg) {
        analyticsLogger.info(msg);
    }
}
