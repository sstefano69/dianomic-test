
SELECT * FROM config;

SELECT * FROM asset_readings;

INSERT INTO asset_readings
SELECT
	2,
	NULL,
	NULL,
    NULL;

\C foglamp2;

drop database foglamp2;

DROP DATABASE foglamp3;

CREATE SEQUENCE table_id_seq START 1;

DROP SEQUENCE config_id_seq;

SELECT nextval('foglamp3.test_id_seq');
