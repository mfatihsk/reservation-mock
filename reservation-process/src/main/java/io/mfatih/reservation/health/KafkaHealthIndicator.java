package io.mfatih.reservation.health;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

@Component
public class KafkaHealthIndicator implements HealthIndicator {

    private KafkaTemplate<String, String> kafkaTemplate;

    private static final int REQUEST_TIMEOUT = 5;
    private static final String KAFKA_HEALTH_CHECK_TOPIC = "health-check";
    private static final String KAFKA_HEALTH_CHECK_KAFKA_DETAIL = "kafka-connection";

    private final static Logger LOGGER = LoggerFactory.getLogger(KafkaHealthIndicator.class);

    public KafkaHealthIndicator(KafkaTemplate<String, String> kafkaTemplate) {
        this.kafkaTemplate = kafkaTemplate;
    }

    @Override
    public Health health() {
        try {
            if (kafkaTemplate.send(KAFKA_HEALTH_CHECK_TOPIC, "check").get(REQUEST_TIMEOUT, TimeUnit.SECONDS) != null) {
                return Health.up().withDetail(KAFKA_HEALTH_CHECK_KAFKA_DETAIL, "UP").build();
            } else {
                return Health.down().withDetail(KAFKA_HEALTH_CHECK_KAFKA_DETAIL, "DOWN").build();
            }
        } catch (Exception ex) {
            LOGGER.error(ex.getMessage());
            return Health.down().withDetail(KAFKA_HEALTH_CHECK_KAFKA_DETAIL, "DOWN").build();
        }
    }
}