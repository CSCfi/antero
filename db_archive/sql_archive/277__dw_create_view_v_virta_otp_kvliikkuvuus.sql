IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_kvliikkuvuus'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW dw.v_virta_otp_kvliikkuvuus AS
SELECT 1 AS a
'
