package io.mfatih.reservation.service;

import io.mfatih.reservation.IntegrationBase;
import io.mfatih.reservation.topics.Reply;
import io.mfatih.reservation.topics.Request;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

import java.util.UUID;

@Component
public class MockService {
    public MockService() {
        System.out.println("");
    }

    @KafkaListener(topics = IntegrationBase.TOPIC )
    @SendTo
    public Reply listen(Request request) {
        return new Reply(UUID.randomUUID().toString());
    }
}
