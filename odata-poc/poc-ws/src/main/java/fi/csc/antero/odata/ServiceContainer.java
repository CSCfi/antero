package fi.csc.antero.odata;

import com.sdl.odata.service.ODataServiceConfiguration;
import com.sdl.odata.datasource.jpa.JPADataSourceConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

/**
 * Spring-boot container
 *
 * @author aki.heikkinen@arcusys.fi
 */

@Configuration
@EnableAutoConfiguration(exclude = {
    HibernateJpaAutoConfiguration.class,
    DataSourceAutoConfiguration.class,
    DataSourceTransactionManagerAutoConfiguration.class
})
@Import({
    JPADataSourceConfiguration.class,
    ODataServiceConfiguration.class
})
@ComponentScan
public class ServiceContainer {
    private static final Logger _log = LoggerFactory.getLogger(ServiceContainer.class);

    public static void main(String[] args) {
        final SpringApplication springApplication = new SpringApplication(ServiceContainer.class);
        springApplication.setBannerMode(Banner.Mode.OFF);
        springApplication.run(args);

        _log.info("Starting OData-POC Application container started");
    }
}
