package io.mfatih.reservation.service;

import io.mfatih.reservation.client.DemoRPC;
import io.mfatih.reservation.topics.ReservationReply;
import io.mfatih.reservation.topics.ReservationRequest;
import io.mfatih.reservation.topics.TopicNames;
import org.springframework.stereotype.Service;
import org.springframework.util.concurrent.ListenableFuture;

import java.util.Collections;
import java.util.Map;
import java.util.Optional;

@Service
public class ReservationClientServiceImpl implements ReservationClientService {

    private DemoRPC client;

    /**
     * session id map
     */
    private final Map<Integer, String> sessionIdMap;

    public ReservationClientServiceImpl(DemoRPC client) {
        this.client = client;

        sessionIdMap = Collections.unmodifiableMap(Map.of(0, "leicester_monday_10_to_11",
                1, "leicester_tuesday_10_to_11",
                2, "leicester_wednesday_10_to_11",
                3, "leicester_thursday_10_to_11",
                4, "leicester_friday_10_to_11"));
    }


    @Override
    public ListenableFuture<ReservationReply> bookASeat(String personName ,String sessionId, boolean fromMiddle) {
        //for the mock purpose each request will be mapped to valid session id
        String mappedId = sessionIdMap.get(Math.abs(Optional.ofNullable(sessionId).orElse("0").hashCode()) % 5);

        return client.sendAndReceive(TopicNames.RESERVATION_REQUEST_TOPIC, new ReservationRequest(mappedId, fromMiddle, personName), mappedId);
    }
}
