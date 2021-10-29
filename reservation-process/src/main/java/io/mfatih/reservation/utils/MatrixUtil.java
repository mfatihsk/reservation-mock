package io.mfatih.reservation.utils;

import java.util.ArrayList;
import java.util.List;

public final class MatrixUtil {

    private MatrixUtil(){
        //no sonar
    }

    /**
     * geneates spiral moves
     *
     * @param maxDistanceFromMiddle
     * @return
     */
    public static List<Move> generateSpiralList(int maxDistanceFromMiddle) {
        List<Move> moves = new ArrayList<>();
        //add middle
        moves.add(new Move(0, 0));
        //move spiral input list
        for (int i = 1; i < maxDistanceFromMiddle; i++) {

            for (int j = i; (-1 * i) <= j; j--) {
                moves.add(new Move(i, j));
                moves.add(new Move(-1 * i, j));
            }

            int bufferZoneLimit = (-1 * (i - 1));
            for (int j = i, k = i - 1; bufferZoneLimit <= k; k--) {
                moves.add(new Move(k, j));
                moves.add(new Move(k, -j));
            }
        }
        return moves;
    }
}
