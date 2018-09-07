-- Value to string
INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL-1652-006-001', 151,'{"value":1}');

INSERT INTO  readings (asset_code,read_key,reading) values ('FOGL-1652-006-001', 152,'{"value":"string1"}');

INSERT INTO  readings (asset_code,read_key,reading) values ('FOGL-1652-006-001','153','{"value":3}');

-- Value to Number to Integre
INSERT INTO  readings (asset_code,read_key,reading) values ('FOGL-1652-006-002','154','{"value":4.4}');

INSERT INTO  readings (asset_code,read_key,reading) values ('FOGL-1652-006-002','155','{"value":"string1"}');

INSERT INTO  readings (asset_code,read_key,reading) values ('FOGL-1652-006-002','156','{"value":6}');
