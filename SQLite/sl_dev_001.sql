
SELECT count(*) FROM readings ORDER BY id ;

SELECT * FROM readings ORDER BY id ;

SELECT * FROM readings WHERE asset_code='fogbench_luxometer' ORDER BY id ;

SELECT * FROM omf_created_objects;



###  #########################################################################################:

select * from configuration;

SELECT * FROM  statistics ;

SELECT * FROM log WHERE code="STRMN" ORDER BY id DESC  ;



SELECT * FROM  statistics WHERE key = 'SENT_4';


pragma integrity_check;

analyze;

SELECT count(*) FROM readings ORDER BY id ;

SELECT * FROM readings ORDER BY id ;

SELECT * FROM omf_created_objects;


SELECT * FROM readings WHERE asset_code='fogbench_pressure' ORDER BY id ;

# DELETE FROM readings;

# DELETE FROM omf_created_objects;

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

SELECT max(id) FROM readings;

SELECT count(*) FROM readings WHERE id> 320000 ORDER BY id ;


SELECT count(*) FROM readings ORDER BY id ;


SELECT * FROM readings WHERE id> 181200 ORDER BY id ;

# 260001	c	da18e929-cd38-4c16-b389-fb9b4b345556	{"c":1}	2018-05-18	2018-05-18

UPDATE streams SET last_object=5190 WHERE id=1;

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)
values
    ('260005','a','5','{"c":1}','2018-05-18','2018-05-18'),
    ('260006','a','6','{"c":2}','2018-05-18','2018-05-18');



SELECT * FROM  streams;

SELECT * FROM omf_created_objects;

SELECT * FROM log;

SELECT * FROM schedules WHERe process_name='71Modularity';

SELECT * FROM schedules WHERe process_name='purge';

SELECT * FROM schedules;

SELECT * FROM scheduled_processes;

SELECT * FROM readings ORDER BY id ;


SELECT * FROM schedules WHERe process_name='purge';

SELECT * FROM log ORDER BY id ;



### Purge #########################################################################################:

SELECT * FROM foglamp.scheduled_processes;

SELECT * FROM foglamp.omf_created_objects;

SELECT * FROM  statistics WHERE key = 'SENT_4';


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