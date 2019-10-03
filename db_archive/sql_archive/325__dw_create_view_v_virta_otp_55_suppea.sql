IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_55_suppea'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dw.v_virta_otp_55_suppea AS
SELECT 1 AS a
'
