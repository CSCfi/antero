package fi.csc.antero.config;

import com.querydsl.sql.H2Templates;
import com.querydsl.sql.SQLQueryFactory;
import com.querydsl.sql.SQLServer2016Templates;
import com.querydsl.sql.SQLTemplates;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Profile;

import javax.sql.DataSource;

@Configuration
public class AppConfig {

    @Bean
    @Profile({"dev", "default"})
    public SQLQueryFactory getH2QueryFactory(@Qualifier("dataSource") @Autowired DataSource dataSource) {
        return getSqlQueryFactory(dataSource, new H2Templates());
    }

    @Bean
    @Profile("prod")
    public SQLQueryFactory getMSSQLQueryFactory(@Qualifier("dataSource") @Autowired DataSource dataSource) {
        return getSqlQueryFactory(dataSource, new SQLServer2016Templates());
    }

    private SQLQueryFactory getSqlQueryFactory(@Qualifier("dataSource") @Autowired DataSource dataSource, SQLTemplates templates) {
        final com.querydsl.sql.Configuration configuration = new com.querydsl.sql.Configuration(templates);
        return new SQLQueryFactory(configuration, dataSource);
    }
}
