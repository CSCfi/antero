package fi.csc.antero;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

import jakarta.annotation.PostConstruct;
import org.springframework.context.annotation.Bean;

import java.util.TimeZone;

@SpringBootApplication
@EnableCaching
public class ApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(ApiApplication.class, args);
    }

    @PostConstruct
    void started() {
        TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
    }

    @Bean
    public OpenAPI vipunenOpenAPI() {
        return new OpenAPI()
                .info(new Info().title("Vipunen API")
                        .description("Koneluettavan rajapinnan avulla voit hyödyntää Vipusen tietosisältöjä myös palvelun ulkopuolella.")
                        .version("3.0"));
    }
}
