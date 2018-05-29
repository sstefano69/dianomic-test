DELETE FROM foglamp.omf_created_objects;

UPDATE foglamp.streams SET last_object=0 WHERE id=1;

# TRUNCATE TABLE foglamp.readings;


SELECT * FROM foglamp.readings WHERE ID>= 723936 ORDER BY id ;

SELECT * FROM foglamp.readings WHERE ID = 724191 ORDER BY id ;

{'asset_code': 'c', 'user_ts': '2018-05-28 16:56:550000000+00', 'id': 724191, 'reading': {'c': 1}, 'read_key': '16e895df-9e7c-403c-bfff-2dcd0927cc12'}

'2018-05-28T16:56:550000Z'

###  #########################################################################################:
SELECT * FROM scheduled_processes;

SELECT * FROM foglamp.readings WHERE id=0 ORDER BY id ;


SELECT * FROM foglamp.readings ORDER BY id ;

SELECT count(*) FROM foglamp.readings WHERE  user_ts < date('now', '-1 hours') AND id > 0;

### Purge #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM foglamp.readings ORDER BY id ;

SELECT * FROM  foglamp.streams;

SELECT * FROM  statistics_history;

SELECT * FROM  statistics_history WHERE key = 'SENT_2';

SELECT * FROM  statistics_history WHERE key = 'FOGBENCH/TEMPERATURE' ORDER by ts DESC;

# DELETE FROM foglamp.omf_created_objects;
# DELETE FROM foglamp.readings
# DELETE FROM statistics_history;

#
# Update
#
UPDATE foglamp.streams SET last_object=0 WHERE id=1;

### Purge #########################################################################################:

select * from foglamp.tasks WHERE process_name='purge' ORDER by start_time desc;

SELECT count(*) FROM foglamp.readings;

select * from foglamp.configuration;

select * from foglamp.log;

select * from foglamp.log WHERE code='PURGE';

SELECT * FROM foglamp.schedules WHERe process_name='purge';

SELECT * FROM foglamp.readings ORDER BY id ;


select * from foglamp.log;

select * from statistics;

select DISTINCT code from foglamp.log;

###  #########################################################################################:

select * from schedules;

select * from foglamp.schedules WHERE id='2b614d26-760f-11e7-b5a5-be2e44b06b34';

UPDATE foglamp.schedules  set schedule_day=0 WHERE id='2b614d26-760f-11e7-b5a5-be2e44b06b34';

UPDATE foglamp.schedules  set schedule_day=NULL WHERE id='2b614d26-760f-11e7-b5a5-be2e44b06b34';

### DELETE  #########################################################################################:

SELECT * FROM foglamp.readings;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

SELECT * FROM foglamp.omf_created_objects;

DELETE FROM foglamp.readings;

DELETE FROM foglamp.omf_created_objects;

select * from foglamp.log;

###  ########################################################################################:
SELECT * FROM  foglamp.streams;

SELECT * FROM foglamp.destinations;

###  #########################################################################################:

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

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration WHERE key = 'BACK_REST';


###  #########################################################################################:



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


