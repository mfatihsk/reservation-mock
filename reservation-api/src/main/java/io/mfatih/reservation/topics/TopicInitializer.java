package io.mfatih.reservation.topics;


import org.apache.kafka.clients.admin.NewTopic;
import org.springframework.context.annotation.Bean;
import org.springframework.kafka.config.TopicBuilder;
import org.springframework.stereotype.Component;

@Component
public class TopicInitializer {

    @Bean(TopicNames.RESERVATION_REQUEST_TOPIC)
    public NewTopic getMultiplyTopic(){
        return TopicBuilder.name(TopicNames.RESERVATION_REQUEST_TOPIC)
                .partitions(5)
                .replicas(1)
                .build();
    }
}
