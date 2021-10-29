package io.mfatih.reservation.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;


@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
public class CinemaTheaterSessionSlot {

    @Id
    private String id;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn
    private CinemaTheaterSession theaterSession;

    private int x;

    private int y;

    private boolean allocated;

    private String personName;

    public CinemaTheaterSessionSlot(CinemaTheaterSession theaterSession, int x, int y) {
        this.theaterSession = theaterSession;
        this.x = x;
        this.y = y;
    }
}
