### Select #########################################################################################:

SELECT * FROM omf_created_objects;

SELECT * FROM log;

SELECT * FROM schedules WHERe process_name='71Modularity';

SELECT * FROM schedules WHERe process_name='purge';


SELECT * FROM scheduled_processes;

SELECT * FROM readings ORDER BY id ;

SELECT * FROM  streams;

SELECT * FROM schedules WHERe process_name='purge';


### Purge #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM  statistics_history;

SELECT * FROM  statistics_history WHERE key = 'SENT_2';

SELECT * FROM  statistics_history WHERE key = 'FOGBENCH/TEMPERATURE' ORDER by ts DESC;

# DELETE FROM foglamp.omf_created_objects;
# DELETE FROM foglamp.readings
# DELETE FROM statistics_history;

SELECT * FROM foglamp.readings ORDER BY id ;

#
# Update
#
UPDATE foglamp.streams SET last_object=0 WHERE id=1;