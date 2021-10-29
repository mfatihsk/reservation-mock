package io.mfatih.reservation.process;

import io.mfatih.reservation.models.CinemaTheater;
import io.mfatih.reservation.models.CinemaTheaterSession;
import io.mfatih.reservation.models.CinemaTheaterSessionSlot;
import io.mfatih.reservation.repository.CinemaTheaterSessionSlotRepository;
import io.mfatih.reservation.topics.ReservationReply;
import io.mfatih.reservation.topics.ReservationRequest;
import io.mfatih.reservation.topics.TopicNames;
import io.mfatih.reservation.utils.MatrixUtil;
import io.mfatih.reservation.utils.Move;
import org.springframework.kafka.annotation.KafkaListener;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.List;
import java.util.Optional;
import java.util.stream.IntStream;

@Service
public class ReservationProcess {

    private final CinemaTheaterSessionSlotRepository sessionSlotRepository;

    public static final String NO_SLOT = "No slots available";

    private final int[][] moveArray = {{1, 0}, {-1, 0}, {0, 1}, {0, -1}};

    public ReservationProcess(CinemaTheaterSessionSlotRepository sessionSlotRepository) {
        this.sessionSlotRepository = sessionSlotRepository;
    }

    @KafkaListener(topics = TopicNames.RESERVATION_REQUEST_TOPIC)
    @SendTo
    public ReservationReply process(ReservationRequest request) {
        //get all slots by in order y and x , so no need to map by index
        //we partitioned by session id so we are able to hold data in cache , it will be implemented later on
        List<CinemaTheaterSessionSlot> slots = sessionSlotRepository
                .findAllByTheaterSessionOrderByYAscXAsc(new CinemaTheaterSession(request.getTheaterSessionId()));

        if (!CollectionUtils.isEmpty(slots)) {
            CinemaTheater cinemaTheater = slots.get(0).getTheaterSession().getCinemaTheater();
            Optional<CinemaTheaterSessionSlot> sessionSlot ;
            if (!request.isFromMiddle()) {
                sessionSlot = slots.stream()
                        .filter(e -> !e.isAllocated() && checkFourSide(slots, e, cinemaTheater.getSeatCountX(), cinemaTheater.getSeatCountY()))
                        .findFirst();
            } else {
                sessionSlot = getAroundTheMiddle(slots, cinemaTheater.getSeatCountX(), cinemaTheater.getSeatCountY());
            }
            if (sessionSlot.isEmpty()) {
                return new ReservationReply(NO_SLOT);
            }
            CinemaTheaterSessionSlot slot = sessionSlot.get();
            //update slot
            slot.setAllocated(true);
            slot.setPersonName(request.getPersonName());
            sessionSlotRepository.save(slot);

            return new ReservationReply(true, "Success", slot.getX(), slot.getY());
        } else {
            return new ReservationReply(NO_SLOT);
        }
    }

    /**
     * find outs available seat from the
     *
     * @param slots
     * @param maxX
     * @param maxY
     * @return
     */
    private Optional<CinemaTheaterSessionSlot> getAroundTheMiddle(List<CinemaTheaterSessionSlot> slots, int maxX, int maxY) {
        //generate search matrix
        //the size of matrix might be parametric
        List<Move> moves = MatrixUtil.generateSpiralList(4);
        //get middle slot
        CinemaTheaterSessionSlot middle = slots.get(slots.size() / 2 + maxX /2 -1);
        //first filter and check if the slot is eligible
        return moves.stream()
                .map(mv -> getCinemaTheaterSessionSlotByMove(slots, mv, middle, maxX))
                .filter(slot -> !slot.isAllocated() && checkFourSide(slots, slot, maxX, maxY))
                .findFirst();
    }

    /**
     * returns the slot with using move and middle slot position
     * @param slots
     * @param mv
     * @param middle
     * @param maxX
     * @return
     */
    private CinemaTheaterSessionSlot getCinemaTheaterSessionSlotByMove(List<CinemaTheaterSessionSlot> slots, Move mv , CinemaTheaterSessionSlot middle, int maxX) {
        int arrayPosition = getArrayPosition(middle.getX() + mv.getX(), middle.getY() + mv.getY(), maxX);
        return slots.get(arrayPosition);
    }

    /**
     * checks a position with four dimension is available
     *
     * @param slots
     * @param current
     * @param maxX
     * @param maxY
     * @return
     */
    private boolean checkFourSide(List<CinemaTheaterSessionSlot> slots, CinemaTheaterSessionSlot current, int maxX, int maxY) {
        return IntStream.range(0, 4)
                .allMatch(n -> check(slots,
                        current.getX() + moveArray[n][0],
                        current.getY() + moveArray[n][1],
                        maxX, maxY));
    }

    /**
     * check a location is available
     *
     * @param slots
     * @param currentX slot current x position
     * @param currentY slot current y position
     * @param maxX
     * @param maxY
     * @return
     */
    private boolean check(List<CinemaTheaterSessionSlot> slots, int currentX, int currentY, int maxX, int maxY) {
        //check dimensions
        if (currentX > maxX || currentX < 1 || currentY > maxY || currentY < 1) {
            return true;
        }
        //calculate
        int arrayPosition = getArrayPosition(currentX, currentY, maxX);
        return !slots.get(arrayPosition).isAllocated();
    }

    /**
     * returns the position in the slot list
     * <p>
     * theater seats starts from 1 so the calculation subtracts 1
     *
     * @param currentX
     * @param currentY
     * @param maxX
     * @return
     */
    private int getArrayPosition(int currentX, int currentY, int maxX) {
        return maxX * (currentY - 1) + currentX - 1;
    }
}
