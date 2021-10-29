package io.mfatih.reservation.topics;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationRequest {

    private String theaterSessionId;

    private boolean fromMiddle;

    private String personName;

    public ReservationRequest(String theaterSessionId) {
        this.theaterSessionId = theaterSessionId;
    }

    public ReservationRequest(String theaterSessionId, boolean fromMiddle) {
        this.theaterSessionId = theaterSessionId;
        this.fromMiddle = fromMiddle;
    }

    public ReservationRequest(String theaterSessionId, boolean fromMiddle, String personName) {
        this.theaterSessionId = theaterSessionId;
        this.fromMiddle = fromMiddle;
        this.personName = personName;
    }
}
