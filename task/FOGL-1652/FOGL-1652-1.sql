--
-- Errors - bad readings values
--
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('1','FOGL-1652-001-001','1','','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('2','FOGL-1652-001-002','2','{"value"','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('3','FOGL-1652-001-003','3','{"value":02}','2018-09-03','2018-09-03');

-- Spaces
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('4','FOGL-1652-001 004','4','{"value":1}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('5',' FOGL-1652-001-005','5','{"value":1}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('6','FOGL-1652-001-006 ','6','{"value":1}','2018-09-03','2018-09-03');


--
-- Good values
--
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('7','FOGL-1652-001-001','7','{"value":1}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)values  ('8','FOGL-1652-001-002','8','{"value":2}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)values  ('9','FOGL-1652-001-003','9','{"value":3}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('10','FOGL-1652-001-006','10','{"value":61}','2018-09-03','2018-09-03');




