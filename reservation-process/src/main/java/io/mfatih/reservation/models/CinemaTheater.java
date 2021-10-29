package io.mfatih.reservation.models;

import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@NoArgsConstructor
@Data
@Entity
public class CinemaTheater {

    @Id
    @GeneratedValue(generator = "uuid2")
    @GenericGenerator(name = "uuid2", strategy = "uuid2")
    private String id;

    private String theaterName;

    private int seatCountX;

    private int seatCountY;

    public CinemaTheater(String theaterName, int seatCountX, int seatCountY) {
        this.theaterName = theaterName;
        this.seatCountX = seatCountX;
        this.seatCountY = seatCountY;
    }
}
