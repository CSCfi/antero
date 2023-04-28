package fi.csc.antero.log;

import ch.qos.logback.classic.PatternLayout;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.BufferedReader;
import java.io.FileReader;

public class LogFileHeaderPatternLayout extends PatternLayout {
    private String header;

    private final Logger logger = LoggerFactory.getLogger(getClass());

    public void setHeader(String header) {
        this.header = header;
    }

    public String getFileHeader() {
        if (alreadyContainsHeader()) {
            return "";
        }
        return header;
    }

    private boolean alreadyContainsHeader() {
        try(BufferedReader br = new BufferedReader(new FileReader(System.getProperty("LOG_FILE_PATH_ANALYTICS") + System.getProperty("LOG_FILE_ANALYTICS")))) {
            String line = null;
            while ((line = br.readLine()) != null) {
                if (line.contains(header)) {
                    return true;
                } else {
                    break;
                }
            }
        } catch (Exception ex) {
            logger.error("Log header fail", ex);
        }
        return false;
    }
}