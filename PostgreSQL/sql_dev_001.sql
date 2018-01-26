
SELECT id, asset_code, read_key, reading, user_ts AT TIME ZONE 'UTC' as user_ts, ts AT TIME ZONE 'UTC' as ts FROM foglamp.readings WHERE id >= 1 ORDER BY id LIMIT 2;


###  #########################################################################################:

SELECT id, asset_code, read_key, reading, user_ts AT TIME ZONE 'UTC' as "user_ts", ts AT TIME ZONE 'UTC' as "ts" FROM foglamp.readings WHERE id >= 1 LIMIT 2;


###  #########################################################################################:


SELECT id, asset_code, read_key, reading, user_ts AT TIME ZONE 'UTC' as user_ts, ts AT TIME ZONE 'UTC' as ts FROM foglamp.readings;

SELECT id, asset_code, read_key, reading, user_ts AT TIME ZONE 'UTC' , ts AT TIME ZONE 'UTC'  FROM foglamp.readings;

###  #########################################################################################:

SELECT * FROM  tasks;

### OCS #########################################################################################:

SELECT id,asset_code,reading,user_ts FROM foglamp.readings WHERE asset_code like '%acce%';

SELECT * FROM foglamp.readings WHERE asset_code  like '%lux%%' ORDER by USER_ts;

SELECT * FROM foglamp.readings WHERE asset_code  like '%gy%%' ORDER by USER_ts;


SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM  statistics;

SELECT * FROM  statistics_history;

SELECT * FROM  statistics_history WHERE key = 'SENT_2';


SELECT * FROM foglamp.omf_created_objects;

# DELETE FROM foglamp.omf_created_objects;

SELECT * FROM  foglamp.streams;


### Statisctis #########################################################################################:

SELECT * FROM  statistics_history;

SELECT * FROM  statistics;

###  #########################################################################################:

SELECT * FROM foglamp.configuration WHERE key = 'BACK_REST';


###  #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

insert into foglamp.scheduled_processes (name, script) values ('statistics to pi','["python3", "-m", "foglamp.tasks.north.sending_process", "--stream_id", "2", "--debug_level", "1"]');

-- Run FogLAMP statistics into PI every 25 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('1d7c327e-7dae-11e7-bb31-be2e44b06b34', 'statistics to pi', 'statistics to pi', 3,
NULL, '00:00:25', true);


###  #########################################################################################:insert into foglamp.scheduled_processes (name, script) values ('statistics to pi','["python3", "-m", "foglamp.tasks.north.sending_process", "--stream_id", "2", "--debug_level", "1"]');


DELETE FROM foglamp.schedules WHERE process_name='COAP';
DELETE FROM foglamp.tasks WHERE process_name='COAP';
DELETE FROM foglamp.scheduled_processes WHERE name='COAP';

DELETE FROM foglamp.schedules WHERE process_name='purge';
DELETE FROM foglamp.tasks WHERE process_name='purge';
DELETE FROM foglamp.scheduled_processes WHERE name='purge';

DELETE FROM foglamp.schedules WHERE process_name='COAP';
DELETE FROM foglamp.tasks WHERE process_name='COAP';
DELETE FROM foglamp.scheduled_processes WHERE name='COAP';

DELETE FROM foglamp.schedules WHERE process_name='stats collector';
DELETE FROM foglamp.tasks WHERE process_name='stats collector';
DELETE FROM foglamp.scheduled_processes WHERE name='stats collector';



###  #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

DELETE FROM foglamp.tasks WHERE process_name='sending process';
DELETE FROM foglamp.schedules WHERE process_name='sending process';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process';


### dev #########################################################################################:

SELECT * FROM foglamp.omf_created_objects;

# DELETE FROM foglamp.omf_created_objects;

SELECT * FROM  foglamp.streams;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings LIMIT 3;

SELECT max(id)  FROM foglamp.readings;

UPDATE foglamp.streams SET last_object=0 WHERE id=14002;



### LOG / AUDIT #########################################################################################:

SELECT * FROM  statistics;

SELECT * FROM  foglamp.log_codes;

SELECT * FROM  foglamp.log;


### Params #########################################################################################:

insert into foglamp.scheduled_processes (name, script) values ('sending process', '["python3", "-m", "foglamp.sending_process", "--stream_id", "1", "--debug_level", "1"]');

insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('2b614d26-760f-11e7-b5a5-be2e44b06b34', 'sending process', 'sending process', 3,
NULL, '00:00:15', true);



### SCHEDULE STOP #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.schedules WHERE process_name='sending process';


DELETE FROM foglamp.schedules WHERE process_name='sending process';
DELETE FROM foglamp.tasks WHERE process_name='sending process';
DELETE FROM foglamp.scheduled_processes WHERE name='sending process';

DELETE FROM foglamp.schedules WHERE process_name='statistics to pi';
DELETE FROM foglamp.tasks WHERE process_name='statistics to pi';
DELETE FROM foglamp.scheduled_processes WHERE name='statistics to pi';

DELETE FROM foglamp.schedules WHERE process_name='purge';
DELETE FROM foglamp.tasks WHERE process_name='purge';
DELETE FROM foglamp.scheduled_processes WHERE name='purge';


DELETE FROM foglamp.schedules WHERE process_name='stats collector';
DELETE FROM foglamp.tasks WHERE process_name='stats collector';
DELETE FROM foglamp.scheduled_processes WHERE name='stats collector';


