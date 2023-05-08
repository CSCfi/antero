package fi.csc.antero.analytic.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

@Service
public class AnalyticService {

    private final Logger logger = LoggerFactory.getLogger(getClass());

    Map<String,Runnable> tasks;
    TaskExecutor taskExecutor;

    public AnalyticService(TaskExecutor taskExecutor) {
        this.taskExecutor = taskExecutor;
        tasks = new HashMap<>();
    }

    public void process(HttpServletRequest request) {
        logger.debug("process");
        String uuid = (String) request.getAttribute("UUID");
        Runnable task = tasks.get(uuid);
        if (task != null) {
            taskExecutor.execute(task);
            tasks.remove(uuid);
        }
    }
    public void submit(HttpServletRequest request, Runnable task) {
        logger.debug("submit");
        String uuid = (String) request.getAttribute("UUID");
        if (isAsync(request)) {
            logger.debug("submit async start");
            tasks.put(uuid, task);
        } else {
            taskExecutor.execute(task);
        }
    }

    private boolean isAsync(HttpServletRequest request) {
        return request.getAttribute("UUID") != null;
    }
}
