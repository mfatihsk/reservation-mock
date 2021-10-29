package io.mfatih.reservation;

import org.apache.kafka.clients.admin.NewTopic;
import org.junit.jupiter.api.extension.AfterEachCallback;
import org.junit.jupiter.api.extension.BeforeEachCallback;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.jupiter.api.extension.ExtensionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.util.TestPropertyValues;
import org.springframework.context.ApplicationContextInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.testcontainers.containers.KafkaContainer;
import org.testcontainers.containers.output.Slf4jLogConsumer;
import org.testcontainers.containers.wait.strategy.Wait;
import org.testcontainers.utility.DockerImageName;


@ExtendWith(SpringExtension.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT, classes = {ReservationRestStarterTest.class})
@ContextConfiguration(initializers = IntegrationBase.Initializer.class)
public class IntegrationBase implements AfterEachCallback, BeforeEachCallback {

    private static final Logger log = LoggerFactory.getLogger(IntegrationBase.class);

    public static final String TOPIC = "topic-integration";

    public static class Initializer implements ApplicationContextInitializer<ConfigurableApplicationContext> {

        static DockerImageName CP_KAFKA = DockerImageName.parse("confluentinc/cp-kafka:5.5.0");

        static KafkaContainer kafkaContainer = new KafkaContainer(CP_KAFKA);

        @Override
        public void initialize(ConfigurableApplicationContext configurableApplicationContext) {
            kafkaContainer.start();
            kafkaContainer.followOutput(new Slf4jLogConsumer(log));
            kafkaContainer.waitingFor(Wait.forListeningPort());

            TestPropertyValues values = TestPropertyValues.of("spring.kafka.bootstrap-servers=" + kafkaContainer.getBootstrapServers(),
                    "spring.kafka.producer.bootstrapServers=" + kafkaContainer.getBootstrapServers(),
                    "spring.kafka.consumer.bootstrapServers=" + kafkaContainer.getBootstrapServers());

            values.applyTo(configurableApplicationContext);
            log.info("MOCK Server has started");
        }
    }

    @Override
    public void beforeEach(ExtensionContext context) throws Exception {
        // ...
    }

    @Override
    public void afterEach(ExtensionContext context) throws Exception {
        // ...
    }


    @Bean(TOPIC)
    public NewTopic getNotification() {
        return TopicBuilder.name(TOPIC)
                .partitions(5)
                .replicas(1)
                .build();
    }
}
