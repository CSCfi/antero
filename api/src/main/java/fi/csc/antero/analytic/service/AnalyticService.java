package fi.csc.antero.analytic.service;

import org.springframework.core.task.TaskExecutor;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

@Service
public class AnalyticService {

    Map<String,Runnable> tasks;
    TaskExecutor taskExecutor;

    public AnalyticService(TaskExecutor taskExecutor) {
        this.taskExecutor = taskExecutor;
        tasks = new HashMap<>();
    }

    public void process(HttpServletRequest request) {
        String uuid = (String) request.getAttribute("UUID");
        Runnable task = tasks.get(uuid);
        taskExecutor.execute(task);
        tasks.remove(uuid);
    }
    public void submit(HttpServletRequest request, Runnable task) {
        String uuid = (String) request.getAttribute("UUID");
        if (isAsync(request)) {
            tasks.put(uuid, task);
            Executors.newSingleThreadScheduledExecutor().schedule(() -> tasks.remove(uuid), 1, TimeUnit.MINUTES);
        } else  {
            taskExecutor.execute(task);
        }
    }

    private boolean isAsync(HttpServletRequest request) {
        return request.getAttribute("UUID") != null;
    }
}
