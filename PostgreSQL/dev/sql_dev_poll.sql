### Device poll #########################################################################################:

DELETE FROM foglamp.readings;

SELECT id,asset_code,reading,user_ts FROM foglamp.readings;

# SELECT id,asset_code,reading,user_ts FROM foglamp.readings LIMIT 3;

SELECT * FROM foglamp.configuration;

SELECT * FROM foglamp.configuration where key in ('COAP_CONF');

SELECT * FROM foglamp.configuration where key in ('Poll', 'CoAP','DEVICE');

SELECT * FROM  foglamp.readings ORDER by id;

DELETE FROM foglamp.readings;

DELETE FROM foglamp.readings WHERE id >= 1211;

### Process  #########################################################################################:

SELECT * FROM  scheduled_processes;

SELECT * FROM  foglamp.schedules;

### POLL #########################################################################################:

SELECT * FROM foglamp.schedules WHERE process_name='POLL';
SELECT * FROM foglamp.tasks WHERE process_name='POLL';
SELECT * FROM foglamp.scheduled_processes WHERE name='POLL';

DELETE FROM foglamp.schedules WHERE process_name='POLL';
DELETE FROM foglamp.tasks WHERE process_name='POLL';
DELETE FROM foglamp.scheduled_processes WHERE name='POLL';

insert into foglamp.scheduled_processes (name, script) values ('POLL', '["python3", "-m", "foglamp.device"]');

-- Start the device server at start-up
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_interval, exclusive)
values ('543a59ce-a9ca-11e7-abc4-cec278b6b50a', 'device', 'POLL', 1,
'0:0', true);

### COAP #########################################################################################:

DELETE FROM foglamp.schedules WHERE process_name='COAP';
DELETE FROM foglamp.tasks WHERE process_name='COAP';
DELETE FROM foglamp.scheduled_processes WHERE name='COAP';


insert into foglamp.scheduled_processes (name, script) values ('COAP', '["python3", "-m", "foglamp.device"]');

-- Start the device server at start-up
insert into foglamp.schedules(id, schedule_name, process_name, schedule_type,
schedule_interval, exclusive)
values ('ada12840-68d3-11e7-907b-a6006ad3dba0', 'device', 'COAP', 1,
'0:0', true);


###  #########################################################################################:



###  #########################################################################################:

#
# test
#
UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device"]'
    WHERE name='device'

UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device", "--name=Poll"]'
    WHERE name='device'

UPDATE foglamp.scheduled_processes
    set script = '["python3", "-m", "foglamp.device", "--name=CoAP"]'
    WHERE name='device';



DELETE FROM foglamp.schedules WHERE process_name='device_poll';
DELETE FROM foglamp.tasks WHERE process_name='device_poll';
DELETE FROM foglamp.scheduled_processes WHERE name='device_poll';



