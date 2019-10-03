IF EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'api.kvliikkuvuus'))
DROP VIEW api.kvliikkuvuus
