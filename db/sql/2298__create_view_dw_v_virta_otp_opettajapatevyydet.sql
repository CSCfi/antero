-- OKM opettajatiedonkeruu raportin näkymä
USE ANTERO
GO 
IF NOT EXISTS ( SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'dw.v_virta_otp_opettajapatevyydet') )
	EXEC dbo.sp_executesql @statement = N'CREATE VIEW dw.v_virta_otp_opettajapatevyydet AS select 1 AS a'
GO
