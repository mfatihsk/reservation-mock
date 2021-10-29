package io.mfatih.reservation.service;

import io.mfatih.reservation.topics.ReservationReply;
import org.springframework.util.concurrent.ListenableFuture;

public interface ReservationClientService {
    /**
     * book a seat for a session
     * @param sessionId
     * @param fromMiddle indicates the person requested around middle seat
     * @return
     */
    ListenableFuture<ReservationReply> bookASeat(String personName, String sessionId, boolean fromMiddle);


}
