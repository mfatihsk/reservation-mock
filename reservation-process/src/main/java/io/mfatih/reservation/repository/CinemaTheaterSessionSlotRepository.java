package io.mfatih.reservation.repository;

import io.mfatih.reservation.models.CinemaTheaterSession;
import io.mfatih.reservation.models.CinemaTheaterSessionSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CinemaTheaterSessionSlotRepository extends JpaRepository<CinemaTheaterSessionSlot, String> {

    List<CinemaTheaterSessionSlot> findAllByTheaterSessionOrderByYAscXAsc(CinemaTheaterSession session);
}
