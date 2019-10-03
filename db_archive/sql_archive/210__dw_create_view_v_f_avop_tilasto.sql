IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_f_avop_tilasto'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dw.v_f_avop_tilasto AS
SELECT 1 AS a
'
