--
-- Good values
--
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('11','FOGL-1652-001-001','11','{"value":11}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)values  ('12','FOGL-1652-001-002','12','{"value":12}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)values  ('13','FOGL-1652-001-003','13','{"value":13}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('14','FOGL-1652-001-006','14','{"value":14}','2018-09-03','2018-09-03');

-- Spaces - removed
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('15','FOGL-1652-001004','15','{"value":15}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('16','FOGL-1652-001-005','16','{"value":16}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('17','FOGL-1652-001-006','17','{"value":17}','2018-09-03','2018-09-03');

--
-- Error - different type
--
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('18','FOGL-1652-002-001','18','{"value":18}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('19','FOGL-1652-002-001','19','{"value":"string1"}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('20','FOGL-1652-002-001','20','{"value":20}','2018-09-03','2018-09-03');
