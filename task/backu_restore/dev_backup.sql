DELETE FROM foglamp.scheduled_processes WHERE name='COAP';

DELETE FROM foglamp.schedules WHERE process_name='purge';
DELETE FROM foglamp.tasks WHERE process_name='purge';
DELETE FROM foglamp.scheduled_processes WHERE name='purge';

DELETE FROM foglamp.schedules WHERE process_name='CC2650POLL';
DELETE FROM foglamp.tasks WHERE process_name='CC2650POLL';
DELETE FROM foglamp.scheduled_processes WHERE name='CC2650POLL';


DELETE FROM foglamp.schedules WHERE process_name='HTTP_SOUTH';
DELETE FROM foglamp.tasks WHERE process_name='HTTP_SOUTH';
DELETE FROM foglamp.scheduled_processes WHERE name='HTTP_SOUTH';


DELETE FROM foglamp.schedules WHERE process_name='sending HTTP';
DELETE FROM foglamp.tasks WHERE process_name='sending HTTP';
DELETE FROM foglamp.scheduled_processes WHERE name='sending HTTP';

###  #########################################################################################:

DELETE FROM foglamp.schedules WHERE process_name='SEND_PR_1';
DELETE FROM foglamp.tasks WHERE process_name='SEND_PR_1';
DELETE FROM foglamp.scheduled_processes WHERE name='SEND_PR_1';

DELETE FROM foglamp.schedules WHERE process_name='SEND_PR_2';
DELETE FROM foglamp.tasks WHERE process_name='SEND_PR_2';
DELETE FROM foglamp.scheduled_processes WHERE name='SEND_PR_2';

DELETE FROM foglamp.schedules WHERE process_name='SEND_PR_3';
DELETE FROM foglamp.tasks WHERE process_name='SEND_PR_3';
DELETE FROM foglamp.scheduled_processes WHERE name='SEND_PR_3';


###  #########################################################################################:

DELETE FROM foglamp.omf_created_objects;
DELETE FROM foglamp.configuration WHERE key = 'SEND_PR_1';
DELETE FROM foglamp.configuration WHERE key = 'SEND_PR_2';
DELETE FROM foglamp.configuration WHERE key = 'SEND_PR_3';

---  -----------------------------------------------------------------------------------------:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.schedules;

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration WHERE key = 'BACK_REST';

DELETE FROM foglamp.configuration WHERE key = 'BACK_REST';


SELECT * FROM foglamp.backups;

SELECT * FROM foglamp.tasks;

SELECT * FROM foglamp.tasks WHERE process_name like '%backup%';

SELECT * FROM foglamp.tasks WHERE process_name like '%restore%';

SELECT * FROM  foglamp.schedules;

SELECT * FROM  foglamp.schedules WHERE process_name='backup';

SELECT * FROM  foglamp.schedules WHERE process_name='restore';

---  -----------------------------------------------------------------------------------------:

SELECT id, file_name FROM foglamp.backups WHERE (ts,id)=
            (SELECT  max(ts),MAX(id) FROM foglamp.backups WHERE status=2 or status=6);

--- Clean -----------------------------------------------------------------------------------------:

DELETE FROM foglamp.schedules WHERE process_name='backup';

DELETE FROM foglamp.schedules WHERE process_name='restore';

DELETE FROM foglamp.tasks WHERE process_name='restore';
DELETE FROM foglamp.scheduled_processes WHERE name='restore';

--- Schedule -----------------------------------------------------------------------------------------:

-- Scheduled backup

-- Run Backup every 25 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('d1631422-9ec6-11e7-abc4-cec278b6b50a', 'backup', 'backup', 3,
NULL, '00:00:15', true);


-- Run Backup every 25 seconds
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_time, schedule_interval, exclusive)
values ('f0ac56f4-9ec6-11e7-abc4-cec278b6b50a', 'restore', 'restore', 3,
NULL, '00:00:25', true);

