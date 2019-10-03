IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.yhteisjulkaisut'))
DROP VIEW api.yhteisjulkaisut
