### Select #########################################################################################:

# DELETE FROM readings;

SELECT count(*) FROM readings ORDER BY id ;

SELECT * FROM readings ORDER BY id ;

SELECT * FROM  streams;

SELECT * FROM omf_created_objects;

SELECT * FROM log;

SELECT * FROM schedules WHERe process_name='71Modularity';

SELECT * FROM schedules WHERe process_name='purge';


SELECT * FROM scheduled_processes;

SELECT * FROM readings ORDER BY id ;


SELECT * FROM schedules WHERe process_name='purge';

SELECT * FROM log ORDER BY id ;

SELECT * FROM log WHERE code="STRMN" ORDER BY id ;


### Purge #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.omf_created_objects;

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