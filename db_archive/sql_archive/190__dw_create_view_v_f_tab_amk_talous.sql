IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_f_tab_amk_talous'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dw.v_f_tab_amk_talous AS
SELECT 1 AS a
'
