package io.mfatih.reservation.topics;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ReservationReply {

    private boolean success;

    private String message;

    private int x= -1;

    private int y= -1;

    public ReservationReply(String message) {
        this.message = message;
    }
}
