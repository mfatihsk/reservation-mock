--liquibase formatted sql
--changeset fatih:create-tables-and-insert-data
--tag create-tables-and-insert-data


CREATE TABLE public.cinema_theater (
    id varchar(255) NOT NULL,
    seat_countx int4 NOT NULL,
    seat_county int4 NOT NULL,
    theater_name varchar(255) NULL,
    CONSTRAINT cinema_theater_pkey PRIMARY KEY (id)
);

CREATE TABLE public.cinema_theater_session (
   id varchar(255) NOT NULL,
   end_time timestamp NULL,
   start_time timestamp NULL,
   cinema_theater_id varchar(255) NULL,
   CONSTRAINT cinema_theater_session_pkey PRIMARY KEY (id),
   CONSTRAINT fkfcinema_theater_session_to_cinema FOREIGN KEY (cinema_theater_id) REFERENCES cinema_theater(id)
);


CREATE TABLE public.cinema_theater_session_slot (
    id varchar(255) NOT NULL DEFAULT gen_random_uuid(),
    allocated bool NOT NULL DEFAULT false,
    person_name varchar(255) NULL,
    x int4 NOT NULL,
    y int4 NOT NULL,
    theater_session_id varchar(255) NULL,
    CONSTRAINT cinema_theater_session_slot_pkey PRIMARY KEY (id),
    CONSTRAINT fkfcinema_theater_session_slot_to_cinema_session FOREIGN KEY (theater_session_id) REFERENCES cinema_theater_session(id)
);

INSERT INTO public.cinema_theater (id, seat_countx, seat_county, theater_name) VALUES('leicester', 15, 20, 'Cineworld Leicester Square');

INSERT INTO public.cinema_theater_session (id, end_time, start_time, cinema_theater_id) VALUES('leicester_monday_10_to_11', now(), now(), 'leicester');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14, 1, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15, 1, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14, 2, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15, 2, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14, 3, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15, 3, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,4, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,4, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,5, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,5, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,6, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,6, 'leicester_monday_10_to_11');


INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,7, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,7, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,8, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,8, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,9, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,9, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,10, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,10, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,11, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,11, 'leicester_monday_10_to_11');


INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,12, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,12, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,13, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,13, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,14, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,14, 'leicester_monday_10_to_11');

INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,15, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,15, 'leicester_monday_10_to_11');
--
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,16, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,16, 'leicester_monday_10_to_11');
--
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,17, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,17, 'leicester_monday_10_to_11');
--
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,18, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,18, 'leicester_monday_10_to_11');
--
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,19, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,19, 'leicester_monday_10_to_11');
--
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(1, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(2, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(3, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(4, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(5, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(6, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(7, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(8, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(9, 20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(10,20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(11,20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(12,20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(13,20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(14,20, 'leicester_monday_10_to_11');
INSERT INTO public.cinema_theater_session_slot (x, y, theater_session_id) VALUES(15,20, 'leicester_monday_10_to_11');



--rollback DROP TABLE public.cinema_theater_session_slot;
--rollback DROP TABLE public.cinema_theater_session;
--rollback DROP TABLE public.cinema_theater;