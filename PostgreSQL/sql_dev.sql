

SELECT id, file_name FROM foglamp.backups WHERE (ts,id)

SELECT  max(ts),MAX(id) FROM foglamp.backups WHERE status=2 or status=6;

SELECT  * FROM foglamp.backups;

SELECT * FROM foglamp.backups;

### OCS #########################################################################################:


SELECT * FROM  foglamp.streams;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM foglamp.readings;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 200000+50 and asset_code  like '%lux%2%' ORDER by USER_ts;


SELECT * FROM foglamp.readings WHERE id > 0 and id <= 200000+50 and asset_code  like '%lux%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE asset_code  like '%acc%'
    and user_ts >= '2018-01-12 10:01:56.484987'
    ORDER by USER_ts ;


SELECT * FROM foglamp.readings WHERE asset_code  like '%lux%3%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE asset_code  like '%acc%3%' ORDER by USER_ts;

###  #########################################################################################:



SELECT * FROM foglamp.omf_created_objects;

# DELETE FROM foglamp.omf_created_objects;

SELECT * FROM  foglamp.streams;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT max(id)  FROM foglamp.readings;


### SCHEDULE STOP #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

DELETE FROM foglamp.schedules WHERE process_name='sending process';
DELETE FROM foglamp.tasks WHERE process_name='sending process';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process';

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';
DELETE FROM foglamp.tasks WHERE process_name='statistics to pi';
DELETE FROM foglamp.scheduled_processes WHERE name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='purge';
DELETE FROM foglamp.tasks WHERE process_name='purge';
DELETE FROM foglamp.scheduled_processes WHERE name='purge';





###  Debu g#########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

UPDATE  foglamp.scheduled_processes SET script='["python3", "-m", "foglamp.sending_process", "-s", "1", "-d", "1"]' WHERE name='sending process';


###  #########################################################################################:

###  #########################################################################################:
###  #########################################################################################:

###  #########################################################################################:

SELECT * FROM foglamp.schedules;

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='sending process';


DELETE FROM foglamp.schedules WHERE process_name='device_poll';
DELETE FROM foglamp.tasks WHERE process_name='device_poll';
DELETE FROM foglamp.scheduled_processes WHERE name='device_poll';

SELECT * FROM foglamp.tasks WHERE process_name='sending process' ORDER BY state ASC;

### Dev  #########################################################################################:

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_statistics_2100"'::jsonb) WHERE key='OMF_TR_1';


### configuration handling  #########################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

DELETE FROM foglamp.omf_created_objects;
DELETE FROM foglamp.configuration WHERE "key"='OMF_TRANS';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TR_1';
DELETE FROM foglamp.configuration WHERE "key"='SEND_PR_1';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TYPES';

#
# Update
#

# Statistics
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"statistics"'::jsonb) WHERE key='SEND_PR_2';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_statistics_2300"'::jsonb) WHERE key='OMF_TR_2';

# Sensor
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_translator_2300"'::jsonb) WHERE key='OMF_TR_1';

# OMF_TYPES
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{type-id, value}', '"2300"'::jsonb) WHERE key='OMF_TYPES ';


SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration  WHERE key='SEND_PR_1';

SELECT * FROM foglamp.configuration  WHERE key='OMF_TR_1';

SELECT * FROM foglamp.configuration  WHERE key='OMF_TYPES';



###  #########################################################################################:

SELECT * FROM foglamp.statistics_history;

INSERT INTO foglamp.omf_created_objects
(configuration_key, asset_code, type_id)
VALUES ('OMF_TR_1', 'x', 1);


SELECT * FROM statistics_history;

DELETE FROM statistics_history;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM   foglamp.readings ORDER by id;

SELECT * FROM foglamp.streams;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM foglamp.omf_created_objects WHERE configuration_key='OMF_TR_1' and type_id='0001';

SELECT * FROM foglamp.omf_created_objects WHERE configuration_key= 'OMF_TR_1';


--- Device -----------------------------------------------------------------------------------------:

SELECT * FROM foglamp.configuration;


SELECT * FROM foglamp.configuration where key in ('COAP_CONF');

SELECT * FROM foglamp.configuration where key in ('Poll', 'CoAP','DEVICE');

SELECT * FROM   foglamp.readings ORDER by id;

DELETE FROM foglamp.readings;

DELETE FROM foglamp.readings WHERE id >= 1211;

SELECT * FROM  scheduled_processes;

UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device"]'
    WHERE name='device'

UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device", "--name=Poll"]'
    WHERE name='device'

UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device", "--name=CoAP"]'
    WHERE name='device';

###  #########################################################################################:

SELECT * FROM  foglamp.schedules;

insert into foglamp.scheduled_processes (name, script) values ('device_poll', '["python3", "-m", "foglamp.device", "--name=Poll"]');

-- Start the device server at start-up
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_interval, exclusive)
values ('543a59ce-a9ca-11e7-abc4-cec278b6b50a', 'device_poll', 'device_poll', 1,
'0:0', true);



DELETE FROM foglamp.schedules WHERE process_name='device_poll';
DELETE FROM foglamp.tasks WHERE process_name='device_poll';
DELETE FROM foglamp.scheduled_processes WHERE name='device_poll';

-- Test -----------------------------------------------------------------------------------------:

SELECT * FROM backups;

SELECT  id,file_name FROM foglamp.backups WHERE id = (
    SELECT max(id) FROM foglamp.backups
)

-- Schedule -----------------------------------------------------------------------------------------:

SELECT * FROM backups;

# Restore
insert into foglamp.scheduled_processes (name, script) values ('restore','["bash", "/home/foglamp/Development/FogLAMP/src/python/foglamp/backup_restore/restore.sh"]');

-- Run Backup every 5 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('f0ac56f4-9ec6-11e7-abc4-cec278b6b50a', 'restore', 'restore', 3,
NULL, '00:00:30', true);


DELETE FROM foglamp.schedules WHERE process_name='restore';
DELETE FROM foglamp.tasks WHERE process_name='restore';
DELETE FROM foglamp.scheduled_processes WHERE name='restore';

SELECT * FROM  foglamp.schedules;

SELECT * FROM  scheduled_processes;


SELECT * FROM  foglamp.tasks WHERE process_name='restore';


###  #########################################################################################:

-- Scheduled backup
insert into foglamp.scheduled_processes (name, script) values ('backup','["python3", "-m", "foglamp.backup_restore.backup"]');

-- Run Backup every 25 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('d1631422-9ec6-11e7-abc4-cec278b6b50a', 'backup', 'backup', 3,
NULL, '00:00:25', true);

# Restore
insert into foglamp.scheduled_processes (name, script) values ('restore','["python3", "-m", "foglamp.backup_restore.restore"]');

-- Run Backup every 5 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('f0ac56f4-9ec6-11e7-abc4-cec278b6b50a', 'restore', 'restore', 3,
NULL, '00:00:05', true);

###  #########################################################################################:

SELECT * FROM  foglamp.tasks WHERE process_name='backup';


DELETE FROM foglamp.schedules WHERE process_name='backup';
DELETE FROM foglamp.tasks WHERE process_name='backup';
DELETE FROM foglamp.scheduled_processes WHERE name='backup';



SELECT * FROM  foglamp.schedules;

SELECT * FROM  scheduled_processes;


SELECT * FROM  foglamp.tasks WHERE process_name='restore';


DELETE FROM foglamp.schedules WHERE process_name='restore';
DELETE FROM foglamp.tasks WHERE process_name='restore';
DELETE FROM foglamp.scheduled_processes WHERE name='restore';

###  #########################################################################################:


###  #########################################################################################:

foglamp.scheduled_processes
foglamp.schedules




--  -----------------------------------------------------------------------------------------:




###  #########################################################################################:



SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration WHERE key='BACKUP';

SELECT * FROM   foglamp.readings;

###  #########################################################################################:

CREATE SEQUENCE foglamp.backups_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE foglamp.backups_id_seq OWNER TO foglamp;


-- Store information about executed backups
CREATE TABLE foglamp.backups (
    id         bigint                      NOT NULL DEFAULT nextval('foglamp.backups_id_seq'::regclass),
    file_name  character varying(255)      NOT NULL DEFAULT ''::character varying COLLATE pg_catalog."default", -- Backup file name, absolute path
    ts         timestamp(6) with time zone NOT NULL DEFAULT now(),                                              -- Backup creation timestamp
    type       integer           	       NOT NULL,                                                            -- Backup type 0=full, 1=incremental
    status     integer           	       NOT NULL,                                                            -- Backup exit status
                                                                                                                --     0=successful execution
                                                                                                                --    -1=status before the backup was executed
                                                                                                                --    -2=Restored backup
    CONSTRAINT backup_pkey PRIMARY KEY (file_name)
        USING INDEX TABLESPACE foglamp
    )
    WITH ( OIDS = FALSE )
    TABLESPACE foglamp;


COMMENT ON TABLE foglamp.backups IS
'Store information about executed backups.';

ALTER TABLE foglamp.backups OWNER to foglamp;

SELECT * FROM backups;

INSERT INTO foglamp.backups
    (file_name, ts, type)
    VALUES ('test', now(), 0);

UPDATE foglamp.backups SET  status=0 WHERE file_name='';



SELECT  file_name FROM foglamp.backups WHERE (ts,id)=(SELECT  max(ts),MAX(id) FROM foglamp.backup);

SELECT  max(ts) FROM foglamp.backups ;

SELECT  max(ts),MAX(id) id  FROM foglamp.backups ;


# FIXME:
DROP TABLE foglamp.backups;

SELECT file_name FROM foglamp.backups WHERE (ts,id)=(SELECT  max(ts),MAX(id) FROM foglamp.backups WHERE status=0 or status=-1);

SELECT  max(ts),MAX(id) FROM foglamp.backups WHERE status=0 or status=-2;

SELECT  max(ts),MAX(id) FROM foglamp.backups WHERE status=0 or status=-1 or status=-2;

###  #########################################################################################:

INSERT INTO foglamp.backup
        (file_name, ts, type, status)
        VALUES ('/tmp/foglamp_2017_09_20_14_56_20.dump', now(), 0, 0 );

###  #########################################################################################:

SELECT  * FROM foglamp.backups;


SELECT  id, file_name FROM foglamp.backups;

SELECT  id, file_name, ts FROM foglamp.backups order by ts desc LIMIT 5;


SELECT  id FROM foglamp.backups WHERE id NOT in (
    SELECT id FROM foglamp.backups ORDER BY ts DESC LIMIT 5
)

SELECT id FROM foglamp.backups ORDER BY ts DESC LIMIT 5

SELECT  id, file_name, ts FROM foglamp.backups order by ts desc LIMIT 5;



### ############+###########################################################################:
SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM  foglamp.streams;


UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

DELETE FROM  foglamp.readings;

DELETE FROM  foglamp.streams;


### Test 1  #########################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

DELETE FROM  foglamp.readings;

ALTER DATABASE foglamp_restore RENAME TO foglamp;

###  #########################################################################################:

CREATE DATABASE foglamp_restore WITH
    OWNER = foglamp
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.UTF-8'
    LC_CTYPE = 'en_US.UTF-8'
    TABLESPACE = foglamp
    CONNECTION LIMIT = -1
    TEMPLATE template0;

### Restore #########################################################################################:

SELECT id,asset_code,reading,user_ts FROM foglamp_restore.foglamp.readings;

###  #########################################################################################:

SELECT id,asset_code,reading,user_ts FROM foglamp_restore.readings;




###  #########################################################################################:

DROP SCHEMA IF EXISTS foglamp CASCADE;

DROP DATABASE IF EXISTS foglamp;

DROP TABLESPACE IF EXISTS foglamp;

DROP USER IF EXISTS foglamp;


###  Run ######################################################################################################:

# Statistics
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"statistics"'::jsonb) WHERE key='SEND_PR_2';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_statistics_1501"'::jsonb) WHERE key='OMF_TR_2';

# Sensor
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_translator_1501"'::jsonb) WHERE key='OMF_TR_1';

# OMF_TYPES
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{type-id, value}', '"1501"'::jsonb) WHERE key='OMF_TYPES ';





###  #########################################################################################:

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='sending process';


### DELEET  #########################################################################################:

DELETE FROM  foglamp.readings;

### RUN Fast ########################################################################################:

DELETE FROM foglamp.omf_created_objects;

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;
UPDATE foglamp.statistics SET value=0;


### RUN ########################################################################################:

DELETE FROM foglamp.omf_created_objects;
UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;
UPDATE foglamp.statistics SET value=0;


DELETE FROM foglamp.configuration WHERE "key"='OMF_TRANS';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TR_1';
DELETE FROM foglamp.configuration WHERE "key"='SEND_PR_1';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TYPES';


### Update debug #########################################################################################:

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"omf_translator"'::jsonb) WHERE key='SEND_PR_1';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"omf_translator"'::jsonb) WHERE key='SEND_PR_2';

# Sensor
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"readings"'::jsonb) WHERE key='SEND_PR_1';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_translator_2001"'::jsonb) WHERE key='OMF_TR_1';


# Statistics
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"statistics"'::jsonb) WHERE key='SEND_PR_2';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_statistics_2001"'::jsonb) WHERE key='OMF_TR_2';

# OMF_TYPES
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{type-id, value}', '"2001"'::jsonb) WHERE key='OMF_TYPES ';




UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{translator, value}', '"omf_translator"'::jsonb) WHERE key='SEND_PR_1';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{translator, value}', '"omf_translator_new"'::jsonb) WHERE key='SEND_PR_2';


### processes  #########################################################################################:

SELECT * FROM  scheduled_processes;

### SELECT ########################################################################################:

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM  foglamp.streams;

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.statistics ORDER BY key;

SELECT * FROM  foglamp.statistics_history ORDER BY ID;


#
# stream
#
SELECT * FROM foglamp.destinations;

SELECT * FROM  foglamp.streams;



### Dev #########################################################################################:

SELECT * FROM  foglamp.statistics_history WHERE ID >=1220 ORDER BY ID;

SELECT * FROM  foglamp.schedules;

DELETE FROM foglamp.schedules WHERE process_name='purge';

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='sending process';





### Demo #########################################################################################:


SELECT * FROM  foglamp.streams;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE id > 0 and id <= 0+500000 and asset_code like '%acc%' ORDER by USER_ts;


SELECT id,asset_code,reading,user_ts  FROM foglamp.readings

UPDATE foglamp.readings SET asset_code='TI sensorTag/acc' WHERE asset_code='TI sensorTag/accelerometer';


UPDATE foglamp.readings SET asset_code='TI sensorTag/accelerometer'  WHERE asset_code='TI sensorTag/humidity';

UPDATE foglamp.readings SET asset_code='TI sensorTag/accelerometer' WHERE asset_code='TI sensorTag/acc';



### OSI SQL #########################################################################################:

SELECT * from picomp2 WHERE tag like '%omf_translator%accelero%'


###  #########################################################################################:
SELECT asset_code FROM foglamp.omf_created_objects WHERE configuration_key='OMF_TR_1' and type_id=706;

SELECT asset_code FROM foglamp.omf_created_objects;

### Dev #########################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

UPDATE foglamp.statistics SET value=0;

DELETE FROM foglamp.omf_created_objects;

DELETE FROM foglamp.configuration WHERE "key"='SEND_PR_1';

DELETE FROM foglamp.configuration WHERE "key"='OMF_TR_1';

DELETE FROM foglamp.configuration WHERE key='OMF_TYPES';


#
#
#
UPDATE  foglamp.streams SET active=True WHERE id=1;


SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE id > 0 and id <= 0+500000 and asset_code like '%acc%' ORDER by USER_ts;



SELECT max(id)  FROM foglamp.readings;

SELECT count(*)  FROM foglamp.readings;


SELECT * FROM foglamp.destinations;

SELECT * FROM  foglamp.streams;


SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.omf_created_objects ORDER by configuration_key,type_id Desc ,asset_code ;


SELECT * FROM foglamp.statistics ORDER BY key;



#
DELETE FROM  foglamp.omf_created_objects WHERE configuration_key='OMF_TR_1' AND type_id=738;

SELECT * FROM foglamp.readings WHERE asset_code like '%gyr%' ORDER by USER_ts;


SELECT * FROM foglamp.readings WHERE asset_code like '%acc%' ORDER by USER_ts;

#SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code like '%acc%' ORDER by USER_ts;



SELECT * FROM foglamp.streams WHERE id=1 and active=True

SELECT * FROM foglamp.streams WHERE id=1 and active=False



#
# stream
#
SELECT * FROM foglamp.destinations;


SELECT * FROM  foglamp.stream;


#
# schedules
#
SELECT * FROM scheduled_processes;

SELECT * FROM foglamp.schedules;

SELECT * FROM foglamp.tasks order by process_name;


DELETE FROM foglamp.schedules WHERE process_name='purge';

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';


insert into foglamp.scheduled_processes (name, script) values ('sending process', '["python3", "-m", "foglamp.sending_process", "-s", "1", "-d", "2"]');


insert into foglamp.scheduled_processes (name, script) values ('sending process', '["python3", "-m", "foglamp.sending_process", "-s 1 -d 2"]');

insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('2b614d26-760f-11e7-b5a5-be2e44b06b34', 'sending process', 'sending process', 3,
NULL, '00:00:05', true);


DELETE FROM foglamp.tasks WHERE process_name='sending process';

DELETE FROM foglamp.schedules WHERE process_name='sending process';

DELETE FROM foglamp.scheduled_processes WHERE name='sending process';




###  ######################################################################################################:

### PI Server test #########################################################################################:

SELECT COUNT(*) tag from picomp2 WHERE tag like '%omf_translator%'

DELETE from picomp2 WHERE tag like '%omf_translator%'


SELECT *  from picomp2 WHERE tag like '%omf_translator%mouse%'


SELECT COUNT(*) tag from picomp2 WHERE tag like '%omf_translator%mouse%'

SELECT COUNT(*) tag from picomp2 WHERE tag like '%omf_translator%gyrosc%'


### Testing #########################################################################################:


UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{blockSize, value}', '1000'::jsonb) WHERE key='SEND_PR_1';

SELECT   value->'blockSize'->'value' FROM foglamp.configuration  WHERE key='SEND_PR_1';


###  #########################################################################################:

DROP TABLE foglamp.omf_created_objects;

CREATE TABLE foglamp.omf_created_objects (
    configuration_key   character(10)			NOT NULL,                             -- FK to foglamp.configuration
    type_id             integer           	    NOT NULL,                             -- Identifies the specific PI Server type
    asset_code			character varying(50)   NOT NULL,

    CONSTRAINT omf_created_objects_pkey PRIMARY KEY (configuration_key,type_id, asset_code)
        USING INDEX TABLESPACE foglamp,
    CONSTRAINT omf_created_objects_fk1 FOREIGN KEY (configuration_key)
        REFERENCES foglamp.configuration (key) MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION )
    WITH ( OIDS = FALSE )
    TABLESPACE foglamp;

COMMENT ON TABLE foglamp.streams IS
'Tracks types already created into PI Server.';

ALTER TABLE foglamp.omf_created_objects OWNER to foglamp;

SELECT * FROM foglamp.omf_created_objects;

###  #########################################################################################:

DELETE FROM foglamp.omf_created_objects;

#  DELETE FROM foglamp.readings;

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

UPDATE foglamp.statistics SET value=0;

DELETE FROM foglamp.readings WHERE  asset_code='wall clock';


DELETE FROM foglamp.configuration WHERE key='OMF_TRANS';

DELETE FROM foglamp.configuration WHERE key='OMF_TR_1';

DELETE FROM foglamp.configuration WHERE key='SEND_PR_1';


SELECT * FROM foglamp.readings WHERE  asset_code='wall clock';

SELECT max(id)  FROM foglamp.readings;


SELECT count(*)  FROM foglamp.readings;

SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT * FROM foglamp.readings WHERE asset_code like '%mouse%' ORDER by USER_ts;


SELECT count(*) FROM foglamp.readings WHERE id > 82030 and id <= 82030+15000 and asset_code like '%mouse%' ;


SELECT * FROM foglamp.readings WHERE  asset_code like '%gyrosc%' ORDER by USER_ts;

### Sending ######################################################################################################:


SELECT * FROM foglamp.statistics ORDER BY key;

SELECT * FROM foglamp.configuration;


SELECT * FROM  foglamp.streams;

SELECT *  FROM foglamp.readings WHERE id >= 0 ORDER BY ID;


UPDATE foglamp.streams SET last_object=4110, ts=now() WHERE id=1;


###  #########################################################################################:

SELECT * FROM foglamp.configuration WHERE key='SEND_PR_1';

# omf_translator_new
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{translator, value}', '"omf_translator_new"'::jsonb) WHERE key='SEND_PR_1';

# empty_translator
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{translator, value}', '"empty_translator"'::jsonb) WHERE key='SEND_PR_1';


SELECT value->'translator'->'value' FROM foglamp.configuration  WHERE key='SEND_PR_1';

###  #########################################################################################:

SELECT count(*)  FROM foglamp.readings;

SELECT max(id)  FROM foglamp.readings;


SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT *  FROM foglamp.readings WHERE id >= 0 ORDER BY user_ts LIMIT 3 ;

SELECT *  FROM foglamp.readings WHERE id >= 0 ORDER BY user_ts FETCH FIRST 3 ROWS ONLY;


###  ######################################################################################################:



DELETE FROM foglamp.configuration WHERE key='OMF_TR_1';

DELETE FROM foglamp.configuration WHERE key='SEND_PR_1';



SELECT * FROM foglamp.destinations;

SELECT * FROM foglamp.streams;

# Test

### perfroamnce ######################################################################################################:



SELECT *  FROM foglamp.readings WHERE id >= 0;

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';


### Setup ######################################################################################################:
# Scheduler
DELETE FROM foglamp.schedules WHERE process_name='purge';

# DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';


# Configuration
DELETE FROM foglamp.configuration WHERE key='STAT_PI';

# Configuration
DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';

# Disable compression


#
# RUN
#
SELECT * FROM foglamp.schedules;

SELECT * FROM foglamp.configuration;

SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT DISTINCT id FROM foglamp.statistics_history ORDER BY id;

SELECT * FROM foglamp.statistics_history ORDER BY id;

SELECT max(id)FROM foglamp.statistics_history;


UPDATE foglamp.statistics_history SET id=10 WHERE id IS NULL;

SELECT * FROM foglamp.statistics_history WHERE key='SENT';

SELECT * FROM foglamp.statistics_history WHERE key='READINGS';

SELECT count(id)  FROM foglamp.readings;

SELECT max(id)  FROM foglamp.readings;


###  ######################################################################################################:

SELECT * FROM  foglamp.streams;

SELECT * FROM foglamp.statistics_history;

SELECT * FROM foglamp.statistics_history WHERE id is NULL;





#
#
#

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=2;




SELECT * FROM foglamp.configuration;




SELECT tb.key,tb.value FROM foglamp.statistics tb;

SELECT * FROM foglamp.statistics_history;



INSERT INTO foglamp.streams (id,destination_id,description, last_object,ts ) VALUES (2,1,'FogLAMP statistics into PI', 0,now());

ALTER TABLE foglamp.statistics_history ADD id bigint;

UPDATE foglamp.statistics_history SET id=1;



DELETE FROM foglamp.streams  WHERE id=2;




### Insert ######################################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;




SELECT COUNT(id)  FROM foglamp.readings;
# 3203

SELECT * FROM foglamp.configuration;

SELECT tb.id,tb.description,tb.last_object FROM foglamp.streams tb;
# 10854

SELECT * FROM foglamp.statistics;
# 4691 - 5783 - 1092 = 6* sec

SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.schedules;

### SHORT SQL ######################################################################################################:

\set myvar 5
SELECT :myvar  + 1 AS my_var_plus_1;
SELECT :myvar;
SELECT *  FROM foglamp.statistics_history WHERE id = :myvar;

with start_id as ( SELECT id as start_id FROM foglamp.statistics_history WHERE id = 5 )
select *
from foglamp.statistics_history
    cross join
    start_id
where id = start_id;


with start_date as (
    select date_trunc('month', current_date) as start_date
)
select *
from
    t
    cross join
    start_date
where create_time >= start_dat


SELECT id FROM foglamp.statistics_history WHERE id = 5;

select 5::int as var into temp table myvar;

SELECT tb.last_object INTO v3 FROM foglamp.streams tb WHERE id=2;

SELECT current_setting('v3');

SELECT current_setting('mycustom.var');

SHOW v3;

 select set_config('a.b', 'c', false);

\set myvariable 'test'

SELECT * FROM :myvariable;

INSERT INTO :myvariable SELECT tb.last_object FROM foglamp.streams tb WHERE id=2;


UPDATE foglamp.statistics_history SET id=:v2 WHERE id IS NULL;


SELECT v2;

SELECT tb.id,tb.description,tb.last_object FROM foglamp.streams tb;
# 10854


### Per ######################################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

# Configuration
DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';

SELECT * FROM foglamp.statistics_history;

### Test ######################################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;


DELETE FROM foglamp.schedules WHERE process_name='purge';

# Configuration
DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';

SELECT max(id)  FROM foglamp.readings;

SELECT COUNT(id)  FROM foglamp.readings;
# 3203

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.streams;
# 10854

SELECT * FROM foglamp.statistics;
# 4691 - 5783 - 1092 = 6* sec

SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT *  FROM foglamp.readings WHERE id >= 7130;


###  ######################################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;

DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';

SELECT *  FROM foglamp.readings WHERE id >=  0;


SELECT * FROM foglamp.readings WHERE id > 31180 and id <= 31180+1000 and asset_code like '%mouse%' ORDER by USER_ts;


SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%mag%' ORDER by USER_ts;



SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%pre%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%hum%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%lux%' ORDER by USER_ts;


### Compression ######################################################################################################:


SELECT * FROM foglamp.streams;
# 1464

SELECT * FROM foglamp.statistics;

SELECT MAX(id) FROM foglamp.readings WHERE id >= 294;

SELECT *  FROM foglamp.readings WHERE id > 294;


UPDATE foglamp.streams SET last_object=1, ts=now() WHERE id=1;

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 1218;


SELECT * FROM foglamp.readings WHERE id > 294 and id <= 344+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

###  ######################################################################################################:


DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';


### Extract ######################################################################################################:

SELECT max(id)  FROM foglamp.readings;

SELECT count(id)  FROM foglamp.readings  WHERE id >= 3632;


SELECT * FROM foglamp.streams;

SELECT *  FROM foglamp.readings WHERE id >= 3632;

SELECT COUNT(*)  FROM foglamp.readings;
# 3203

### Error handling ######################################################################################################:

SELECT * FROM foglamp.statistics;

SELECT * FROM foglamp.streams;
# 10854

SELECT *  FROM foglamp.readings WHERE id >= 3632;

UPDATE foglamp.streams SET last_object=482, ts=now() WHERE id=1;

SELECT *  FROM foglamp.readings;



### Purge ######################################################################################################:


SELECT min(last_object) FROM foglamp.streams WHERE active=true;


#
#
#

SELECT min(last_object) FROM foglamp.streams;

SELECT *  FROM foglamp.readings WHERE id < 294;


SELECT last_object FROM foglamp.streams WHERE id=1;

SELECT *  FROM foglamp.readings WHERE id > 294;


SELECT * FROM foglamp.streams;

SELECT * FROM foglamp.streams WHERE id=1;

SELECT MAX(last_object) FROM foglamp.streams;

SELECT *  FROM foglamp.readings WHERE id > 294;


SELECT *  FROM foglamp.readings WHERE id > 1;


DELETE FROM foglamp.readings WHERE id < 10;


###  ######################################################################################################:

SELECT MAX(id) INTO max_id   FROM foglamp.readings;

SELECT :max_id;

SELECT MAX(id) FROM foglamp.readings WHERE id >= 1554;

SELECT *  FROM foglamp.readings WHERE id > 4;


### configuration ######################################################################################################:

SELECT * FROM foglamp.configuration;


DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';

### OMF  ######################################################################################################:

SELECT * FROM foglamp.destinations;

SELECT * FROM foglamp.streams;

### schedules ######################################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.schedules;

DELETE FROM foglamp.scheduled_processes WHERE name='purge';

DELETE FROM foglamp.schedules WHERE process_name='purge';

### statistics ######################################################################################################:

SELECT * FROM foglamp.statistics;

SELECT * FROM foglamp.statistics_history;

###  ######################################################################################################:

UPDATE foglamp.streams SET last_object=23980, ts=now() WHERE id=1;

SELECT * FROM foglamp.streams;

SELECT * FROM foglamp.readings WHERE id > 23980 ORDER by id;

### keys ######################################################################################################:

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 19645;


SELECT * FROM foglamp.readings WHERE id > 19645 and asset_code like '%keys%' ORDER by USER_ts;
# 23982

UPDATE foglamp.streams SET last_object=23980, ts=now() WHERE id=1;

SELECT * FROM foglamp.readings WHERE id > 23980 ORDER by id;

# Specific measurement
SELECT * FROM foglamp.readings WHERE id > 23980 and id <= 23980+50 and asset_code like '%keys%' ORDER by USER_ts;


### clock ######################################################################################################:

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 19645;

SELECT * FROM foglamp.readings WHERE id > 24002 ORDER by id;

SELECT * FROM foglamp.readings WHERE id > 24002 and asset_code like '%mouse%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and asset_code like '%acc%' ORDER by USER_ts;
# 23982


