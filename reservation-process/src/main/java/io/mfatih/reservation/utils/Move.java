package io.mfatih.reservation.utils;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Move {

    private int x;
    private int y;

    public Move(int x, int y) {
        this.x = x;
        this.y = y;
    }
}