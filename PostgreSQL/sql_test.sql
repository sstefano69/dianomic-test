
###  Debu g#########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

UPDATE  foglamp.scheduled_processes SET "script"='["python3", "-m", "foglamp.sending_process", "-s", "1", "-d", "2","-p", "y" ]'  WHERE name='sending process';


### Backup #########################################################################################:

SELECT * FROM backups;

SELECT * FROM  scheduled_processes;

SELECT * FROM foglamp.schedules;

###  configuration handling #########################################################################################:

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration  WHERE key in ('SEND_PR_1','OMF_TR_1');

DELETE FROM foglamp.omf_created_objects;
DELETE FROM foglamp.configuration WHERE "key"='OMF_TRANS';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TR_1';
DELETE FROM foglamp.configuration WHERE "key"='SEND_PR_1';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TR_2';
DELETE FROM foglamp.configuration WHERE "key"='SEND_PR_2';
DELETE FROM foglamp.configuration WHERE "key"='OMF_TYPES';




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


###  Run ######################################################################################################:
# xxx

# psql  -U foglamp  -c "SELECT key FROM foglamp.configuration;"

SELECT * FROM foglamp.configuration  WHERE key='SEND_PR_1';
SELECT * FROM foglamp.configuration  WHERE key='OMF_TR_1';

# duration
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{duration, value}', '"3"'::jsonb) WHERE key='SEND_PR_1';


# Statistics
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{source, value}', '"statistics"'::jsonb) WHERE key='SEND_PR_2';

UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_statistics_2040"'::jsonb) WHERE key='OMF_TR_2';

# Sensor
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{producerToken, value}', '"omf_translator_2040"'::jsonb) WHERE key='OMF_TR_1';

# OMF_TYPES
UPDATE foglamp.configuration SET "value" = jsonb_set(value,'{type-id, value}', '"2040"'::jsonb) WHERE key='OMF_TYPES ';



### processes  #########################################################################################:

SELECT * FROM  scheduled_processes;

SELECT * FROM foglamp.schedules;

### SELECT ########################################################################################:

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM  foglamp.streams;

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.statistics ORDER BY key;

SELECT * FROM  foglamp.statistics_history ORDER BY ID;

SELECT COUNT(*)  FROM foglamp.readings;

ANALYZE VERBOSE foglamp.readings;

SELECT max(id)  FROM foglamp.readings;




SELECT * FROM  foglamp.statistics_history ORDER BY KEY, ID;




### Test 1 - Statiscts ######################################################################################################:

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=2;

# Configuration
DELETE FROM foglamp.configuration WHERE key='STAT_PI';


### Test 1 - OMF ######################################################################################################:

SELECT * FROM foglamp.schedules;

DELETE FROM foglamp.schedules WHERE process_name='purge';

UPDATE foglamp.streams SET last_object=0, ts=now() WHERE id=1;


# Configuration
SELECT * FROM foglamp.configuration;

DELETE FROM foglamp.configuration WHERE key='OMF_TRANS ';



# Exec
SELECT *  FROM foglamp.readings WHERE id >= 0;

SELECT * FROM foglamp.streams;

SELECT max(id)FROM foglamp.statistics_history;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%mag%' ORDER by USER_ts;




###  ######################################################################################################:

### Test ######################################################################################################:



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


### Test ######################################################################################################:

# Scheduler
SELECT * FROM foglamp.schedules;

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

SELECT MAX(id) FROM foglamp.readings WHERE id >= 0;

SELECT *  FROM foglamp.readings WHERE id >= 0;


UPDATE foglamp.streams SET last_object=100, ts=now() WHERE id=1;

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 1218;


SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 0 and id <= 0+50 and asset_code  like '%lux%' ORDER by USER_ts;



### Std 19645 ######################################################################################################:
SELECT * FROM foglamp.readings WHERE id > 8958 and id <= 8958+20 ORDER by USER_ts;

# Specific measurement
SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and a

### Check ######################################################################################################:

SELECT * FROM foglamp.streams;

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 1218;

SELECT *  FROM foglamp.readings WHERE id > 1;

# Specific measurement
SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code like '%keys%' ORDER by USER_ts;

UPDATE foglamp.streams SET last_object=1190, ts=now() WHERE id=1;

SELECT * FROM foglamp.streams;


### Init ######################################################################################################:

SELECT * FROM foglamp.destinations;

SELECT * FROM foglamp.streams;


INSERT INTO foglamp.destinations (id,description, ts ) VALUES (1,'OMF', now() );

INSERT INTO foglamp.streams (id,destination_id,description, last_object,ts ) VALUES (1,1,'OMF', 666,now());


### Test ######################################################################################################:

UPDATE foglamp.streams SET last_object=1, ts=now() WHERE id=1;

SELECT * FROM foglamp.streams;

SELECT * FROM foglamp.readings;

SELECT MIN(id), MAX(id) FROM foglamp.readings;

SELECT MAX(id) FROM foglamp.readings WHERE id >= 1;

SELECT MAX(id) FROM foglamp.readings WHERE id >= 1214;
# 23998

SELECT *  FROM foglamp.readings WHERE id > 1380;

SELECT DISTINCT asset_code FROM foglamp.readings WHERE id > 1218;

### Std 19645 ######################################################################################################:
SELECT * FROM foglamp.readings WHERE id > 8958 and id <= 8958+20 ORDER by USER_ts;

# Specific measurement
SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code like '%keys%' ORDER by USER_ts;


SELECT * FROM foglamp.readings WHERE id > 19600 and id <= 19645+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code  like '%lux%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+200 and asset_code  like '%humidity%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 19645 and id <= 19645+50 and asset_code like '%gyrosc%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code like '%magnetometer%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code like '%press%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+50 and asset_code like '%temp%' ORDER by USER_ts;


SELECT * FROM foglamp.readings WHERE id > 1 and id <= 10000+0 and asset_code like '%acc%' ORDER by USER_ts;
