
DELETE FROM readings;

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_001', 1, '{"value":1}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_002', 2, '{"value":0}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_003', 3, '{"value":0.0}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_004', 4, '{"value":"text"}');

SELECT id, asset_code, reading, user_ts,ts FROM readings   LIMIT 20;
