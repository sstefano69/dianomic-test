-- Value to string
INSERT INTO  readings  (asset_code,read_key,reading) values ('Test-001', 1,'{"value":1}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('Test-001', NULL ,'{"value":1}');


--
-- errors - reading
--

-- OK
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('10','FOGL-1652-001','1','{"value":10}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('20','FOGL-1652-001','2','','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('30','FOGL-1652-001','3','{"value"','2018-09-03','2018-09-03');

-- OK
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts)values  ('40','FOGL-1652-002','4','{"value":2}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('41','FOGL-1652-002','41','{"value":02}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('50','FOGL-1652-001','5','{"value":"string"}','2018-09-03','2018-09-03');

-- OK
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('51','FOGL-1652-010','51','{"value":"string1"}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('52','FOGL-1652-010','52','{"value":"stringÐÑÒ2"}','2018-09-03','2018-09-03');

--
-- errors - asset_code
--
-- None
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('60','','6','{"value":1}','2018-09-03','2018-09-03');

-- Spaces
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('70','FOGL-1652 003','7','{"value":1}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('80',' FOGL-1652-003','8','{"value":1}','2018-09-03','2018-09-03');

INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('90','FOGL-1652-003 ','9','{"value":1}','2018-09-03','2018-09-03');

-- Bad char
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('100','FOGL-1652-ÐÑÒ-003 ','10','{"value":1}','2018-09-03','2018-09-03');

-- ok
INSERT INTO  readings (id,asset_code,read_key,reading,user_ts,ts) values ('110','FOGL-1652-003',11,'{"value":3}','2018-09-03','2018-09-03');
