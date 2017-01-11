IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dbo.v_arvo'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dbo.v_arvo AS
SELECT 1 AS a
'
