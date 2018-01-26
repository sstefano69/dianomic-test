SELECT * FROM asset_readings3;


--
-- Load init values
--
INSERT INTO asset_readings3 (
        id,
        create_time,
        update_time,
        data
    )
   VALUES (
       5,
       NULL,
       NULL,
       NULL
   );


CREATE TABLE asset_readings3
    (
        id serial primary key not null,
        create_time timestamp(6) with time zone default now(),
        update_time timestamp(6) with time zone default now(),
        data jsonb
);
