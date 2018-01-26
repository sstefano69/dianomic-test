
SELECT * FROM asset_messages;

###  ######################################################################################################:

# TRUNCATE TABLE foglamp.sensor_values_t;

SELECT * FROM foglamp.sensor_values_t;

SELECT COUNT(*) FROM foglamp.sensor_values_t;


### New ######################################################################################################:

SELECT * FROM asset_messages;

SELECT *  FROM public.sensor_values_t;

SELECT COUNT(*) FROM public.sensor_values_t;

SELECT * FROM foglamp.sensor_values_t;


INSERT INTO sensor_values_t (key) VALUES ('DYDPLE3RTW');

SELECT COUNT(*) FROM foglamp.sensor_values_t;



SELECT COUNT(*) FROM sensor_values_t;

INSERT INTO sensor_values_t (key, data) VALUES ('6b110c8ca02',NULL);


###  ######################################################################################################:

CREATE TABLE sensor_values_t
(id bigserial primary key NOT NULL
, created timestamp(6) with time zone NOT NULL default now()
, modified timestamp(6) with time zone
, modified_by varchar(50)
, key varchar(50) NOT NULL unique -- To avoid double-loading
, data jsonb -- JSON Schema
, version varchar(50) NOT NULL default ''
);

-- This function is for update triggers that alter the ‘modified’ column
CREATE OR REPLACE FUNCTION update_modified_column() RETURNS TRIGGER AS
$$
BEGIN
  IF row(NEW.*) IS DISTINCT FROM row(OLD.*)
    THEN
      NEW.modified = now();
      RETURN NEW;
    ELSE RETURN OLD;
  END IF;
END;
$$ language 'plpgsql';


CREATE TRIGGER update_version
BEFORE UPDATE
ON sensor_values_t
FOR EACH ROW EXECUTE PROCEDURE update_modified_column();



### OLD ######################################################################################################:

--DROP TABLESPACE

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
