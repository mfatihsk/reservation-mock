package io.mfatih.reservation.test;

import io.mfatih.reservation.models.CinemaTheater;
import io.mfatih.reservation.models.CinemaTheaterSession;
import io.mfatih.reservation.models.CinemaTheaterSessionSlot;
import io.mfatih.reservation.process.ReservationProcess;
import io.mfatih.reservation.repository.CinemaTheaterSessionSlotRepository;
import io.mfatih.reservation.topics.ReservationReply;
import io.mfatih.reservation.topics.ReservationRequest;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.mockito.Mockito;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
public class ReservationProcessTest {

    private ReservationProcess reservationProcess;

    private CinemaTheaterSessionSlotRepository sessionSlotRepository;

    @BeforeAll
    public void init() {
        sessionSlotRepository = Mockito.mock(CinemaTheaterSessionSlotRepository.class);
        reservationProcess = new ReservationProcess(sessionSlotRepository);
    }

    @Test
    public void reservationTestNoSlots(){
        Mockito.when(sessionSlotRepository.findAllByTheaterSessionOrderByYAscXAsc(Mockito.any(CinemaTheaterSession.class)))
                .thenReturn(Collections.emptyList());
        ReservationRequest request = new ReservationRequest("liecester");

        ReservationReply reply = reservationProcess.process(request);

        assertEquals(ReservationProcess.NO_SLOT, reply.getMessage());

    }

    @Test
    public void reservationTestSucccess(){
        fillSlots();
        ReservationRequest request = new ReservationRequest("liecester");

        ReservationReply reply = reservationProcess.process(request);
        assertTrue(reply.isSuccess());
        assertEquals(1, reply.getX());
        reply = reservationProcess.process(request);
        assertEquals(3, reply.getX());
        reply = reservationProcess.process(request);
        assertEquals(5, reply.getX());
        reply = reservationProcess.process(request);
        assertEquals(7, reply.getX());
        reply = reservationProcess.process(request);
        assertEquals(9, reply.getX());
    }

    @Test
    public void reservationMiddle() {
        fillSlots();
        ReservationRequest request = new ReservationRequest("liecester",true);

        ReservationReply reply = reservationProcess.process(request);

        assertTrue(reply.isSuccess());
        assertTrue( reply.getY() > 5);

        reply = reservationProcess.process(request);
        assertTrue(reply.isSuccess());
        assertTrue( reply.getY() < 14);

    }

    public void fillSlots(){
        int countX = 15;
        int countY = 20;

        CinemaTheater theater = new CinemaTheater("liecester", countX, countY);
        CinemaTheaterSession session = new CinemaTheaterSession(theater);
        List<CinemaTheaterSessionSlot> slots = new ArrayList<>();
        for (int y = 0; y < countY; y++) {
            for (int x = 0; x < countX; x++) {
                slots.add(new CinemaTheaterSessionSlot(session, x+1, y+1));
            }
        }
        //mock repo
        Mockito.when(sessionSlotRepository.findAllByTheaterSessionOrderByYAscXAsc(Mockito.any(CinemaTheaterSession.class)))
                .thenReturn(slots);
    }


}
