package io.mfatih.reservation.topics;


import io.mfatih.reservation.service.ReservationClientService;
import org.springframework.util.concurrent.ListenableFuture;
import org.springframework.web.bind.annotation.*;
import reactor.core.publisher.Mono;

@RestController
@RequestMapping("reservation")
public class ReservationController {

    private final ReservationClientService service ;

    public ReservationController(ReservationClientService service  ){
        this.service = service;
    }

    @PutMapping(value = "/{name}/{sessionId}")
    public Mono<ReservationReply> reservation(@PathVariable("name") String personName, @PathVariable("sessionId") String sessionId) {
        ListenableFuture<ReservationReply> process =  service.bookASeat(personName,sessionId, false);

        return Mono.fromFuture(process.completable());
    }
    @PutMapping(value = "/{name}/{sessionId}/from-middle")
    public Mono<ReservationReply> reservationFromMiddle(@PathVariable("name") String personName, @PathVariable("sessionId") String sessionId) {
        ListenableFuture<ReservationReply> process =  service.bookASeat(personName,sessionId, true);

        return Mono.fromFuture(process.completable());
    }
}
