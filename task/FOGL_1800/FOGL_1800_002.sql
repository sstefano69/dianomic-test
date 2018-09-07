
INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_001', 10, '{"value":10}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_002', 12, '{"value":10.2}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_003', 13, '{"value":13.3}');

INSERT INTO  readings  (asset_code,read_key,reading) values ('FOGL_1800_GOOD_004', 14, '{"value":"text 4"}');

SELECT id, asset_code, reading, user_ts,ts FROM readings   LIMIT 20;
