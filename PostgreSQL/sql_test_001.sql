### RAspbain #########################################################################################:

-- psql -U pi -d foglamp -c "select * from foglamp.configuration where key='rest_api';"

-- psql -U pi -d foglamp -c "SELECT * FROM foglamp.omf_created_objects;"

-- psql -U pi -d foglamp -c "SELECT * FROM foglamp.scheduled_processes;"

-- psql -U pi -d foglamp -c "SELECT * FROM foglamp.schedules;"







### OCS #########################################################################################:




### Debug #########################################################################################:

# Performance Track
DELETE FROM foglamp.tasks WHERE process_name='sending process';
DELETE FROM foglamp.schedules WHERE process_name='sending process';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process';

INSERT INTO foglamp.scheduled_processes ( name, script ) VALUES ( 'sending process', '["tasks/north", "--stream_id", "1", "--debug_level", "3","--performance_log", "1"]' );

-- Run the North sending process every 15 seconds
INSERT INTO foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive, enabled)
VALUES ('2b614d26-760f-11e7-b5a5-be2e44b06b34', 'sending process', 'sending process', 3,
NULL, '00:00:15', true, true);


###  #########################################################################################:
### OMF - Readings #########################################################################################:

SELECT * FROM foglamp.omf_created_objects;


# DELETE FROM foglamp.readings;

SELECT id,asset_code,reading,user_ts,ts  FROM foglamp.readings oRDER BY id;

SELECT * FROM foglamp.readings oRDER BY id;

SELECT * FROM foglamp.readings WHERE ID >= 148052 oRDER BY id;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE asset_code  like '%lux%%' ORDER by id;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE asset_code  like '%acc%%' ORDER by USER_ts;

SELECT distinct asset_code FROM foglamp.readings ;


SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE asset_code  like '%wall_clock%%' ORDER by USER_ts;


SELECT * FROM foglamp.streams;

SELECT * FROM foglamp.destinations;

###  scheduled_processes#########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.schedules;

SELECT * FROM  foglamp.tasks;

DELETE FROM foglamp.tasks WHERE process_name='sending process OCS';
DELETE FROM foglamp.schedules WHERE process_name='sending process OCS';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process OCS';

DELETE FROM foglamp.tasks WHERE process_name='sending process';
DELETE FROM foglamp.schedules WHERE process_name='sending process';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process';

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';
DELETE FROM foglamp.tasks WHERE process_name='statistics to pi';
DELETE FROM foglamp.scheduled_processes WHERE name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='sending HTTP';
DELETE FROM foglamp.tasks WHERE process_name='sending HTTP';
DELETE FROM foglamp.scheduled_processes WHERE name='sending HTTP';


DELETE FROM foglamp.schedules WHERE process_name='purge';
DELETE FROM foglamp.tasks WHERE process_name='purge';
DELETE FROM foglamp.scheduled_processes WHERE name='purge';


#
#
#

DELETE FROM foglamp.schedules WHERE process_name='COAP';
DELETE FROM foglamp.tasks WHERE process_name='COAP';
DELETE FROM foglamp.scheduled_processes WHERE name='COAP';

DELETE FROM foglamp.schedules WHERE process_name='stats collector';
DELETE FROM foglamp.tasks WHERE process_name='stats collector';
DELETE FROM foglamp.scheduled_processes WHERE name='stats collector';

#
# Creation
#
INSERT INTO foglamp.scheduled_processes ( name, script ) VALUES ( 'statistics to pi','["tasks/north", "--stream_id", "2", "--debug_level", "1"]' );

### configuration #########################################################################################:

SELECT * FROM foglamp.configuration ORDER BY Key;

SELECT * FROM foglamp.configuration WHERE key = 'BACK_REST';


### statistics #########################################################################################:

SELECT * FROM  statistics_history WHERE key = 'SENT_2';

SELECT * FROM  foglamp.statistics ORDER BY key ;



### LOG / AUDIT #########################################################################################:

SELECT * FROM  foglamp.streams;

SELECT * FROM  statistics;


SELECT * FROM  foglamp.log;

SELECT * FROM foglamp.scheduled_processes;


SELECT * FROM  foglamp.log_codes;

SELECT * FROM foglamp.configuration;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings ORDER BY id;

SELECT * FROM  foglamp.statistics_history ORDER BY KEY, ID;

SELECT * FROM foglamp.omf_created_objects;

