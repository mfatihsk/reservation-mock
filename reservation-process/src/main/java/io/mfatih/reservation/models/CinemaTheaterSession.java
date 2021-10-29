package io.mfatih.reservation.models;



import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@Entity
public class CinemaTheaterSession {

    @Id
    private String id;

    @ManyToOne(cascade = CascadeType.DETACH)
    @JoinColumn
    private CinemaTheater cinemaTheater;

    private Date startTime;

    private Date endTime;

    public CinemaTheaterSession(String id) {
        this.id = id;
    }

    public CinemaTheaterSession(CinemaTheater cinemaTheater) {
        this.cinemaTheater = cinemaTheater;
    }
}
