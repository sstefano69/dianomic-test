
CREATE DATABASE foglamp3 OWNER foglamp;
-- DROP DATABASE foglamp3;

\connect foglamp3;

--
-- User creation ?
--

--
-- Sequences creation
--
CREATE SEQUENCE test_id_seq START 1;
--DROP SEQUENCE test_id_seq;

--
-- Tables creation
--

CREATE TABLE  config
    (
        id serial primary key not null,
        create_time timestamp(6) with time zone default now(),
        update_time timestamp(6) with time zone default now(),
        data jsonb
    );

CREATE TABLE asset_readings
    (
        id serial primary key not null,
        create_time timestamp(6) with time zone default now(),
        update_time timestamp(6) with time zone default now(),
        data jsonb
);


--
-- Load init values
--
INSERT INTO asset_readings (
        id,
        create_time,
        update_time,
        data
    )
   VALUES (
       2,
       NULL,
       NULL,
       NULL
   );

SELECT * FROM asset_readings;

