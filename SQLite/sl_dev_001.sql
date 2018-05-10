### Select #########################################################################################:

SELECT * FROM backups  ORDER BY id ;

SELECT id, file_name FROM foglamp.backups WHERE id=
(SELECT  MAX(id) FROM foglamp.backups WHERE status={0} or status={1});

SELECT  MAX(id) FROM backups WHERE status=2 or status=2;

SELECT id, file_name FROM backups WHERE (ts,id)=
(SELECT  max(ts),MAX(id) FROM backups WHERE status=2 or status=2);

       SELECT id, file_name FROM backups WHERE (ts,id)=
            (SELECT  max(ts),MAX(id) FROM backups WHERE status=2 or status=6);

  SELECT id, file_name FROM backups WHERE id=
        (SELECT  MAX(id) FROM backups WHERE status=2 or status=6);


 SELECT max(id), file_name FROM backups WHERE status=2 or status=6;


SELECT id FROM backups WHERE status=2 or status=6 HAVING max(id);

       SELECT id, file_name FROM backups WHERE id=
            (SELECT  MAX(id) FROM backups WHERE status=2 or status=6);

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

SELECT id,key,history_ts,value,ts FROM  statistics_history WHERE key = 'SENT_2';

SELECT * FROM  statistics_history WHERE key = 'FOGBENCH/TEMPERATURE' ORDER by ts DESC;

# DELETE FROM foglamp.omf_created_objects;
# DELETE FROM foglamp.readings
# DELETE FROM statistics_history;


#
# Update
#
UPDATE foglamp.streams SET last_object=0 WHERE id=1;