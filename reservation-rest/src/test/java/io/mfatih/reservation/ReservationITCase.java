package io.mfatih.reservation;

import io.mfatih.reservation.client.DemoRPC;
import io.mfatih.reservation.topics.Reply;
import io.mfatih.reservation.topics.Request;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.concurrent.ListenableFuture;


class ReservationITCase extends IntegrationBase {

    private static final Logger LOGGER = LoggerFactory.getLogger(ReservationITCase.class);

    @Autowired
    private DemoRPC kafkaRPC;

    @Test
    void test() {
        LOGGER.info("TEST STARTED");
        try {
            Request request = new Request( "FATIH");
            ListenableFuture<Reply> listenableFuture = kafkaRPC.sendAndReceive(IntegrationBase.TOPIC,request,request.getMessage());
            Assert.assertTrue( listenableFuture.get().getMesssage().length() >10  );

        } catch (Exception e) {
            LOGGER.error("FAILED TEST",e);
        }
        LOGGER.info("TEST SUCCESS");
    }







}
