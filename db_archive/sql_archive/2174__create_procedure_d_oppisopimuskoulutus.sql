USE [ANTERO]
GO
/****** Object:  StoredProcedure [dw].[p_lataa_d_oppisopimuskoulutus]    Script Date: 20.3.2019 22:09:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dw].[p_lataa_d_oppisopimuskoulutus]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dw].[p_lataa_d_oppisopimuskoulutus] AS' 
END
GO

ALTER PROCEDURE [dw].[p_lataa_d_oppisopimuskoulutus] AS

TRUNCATE TABLE dw.d_oppisopimuskoulutus

SET IDENTITY_INSERT dw.d_oppisopimuskoulutus ON

IF NOT EXISTS (SELECT * FROM dw.d_oppisopimuskoulutus WHERE id=-1) 

	BEGIN
  
	  SET IDENTITY_INSERT dw.d_oppisopimuskoulutus ON;
  
	  INSERT dw.d_oppisopimuskoulutus (id, koodi, selite_fi, selite_sv, selite_en, source)

	  SELECT
		-1
		,koodi
		,nimi
		,nimi_sv
		,nimi_en
		,'ETL: p_lataa_d_oppisopimuskoulutus'
	  FROM sa.sa_koodistot
	  WHERE koodisto='vipunenmeta'
	  and koodi='-1'
	  


	END 


INSERT dw.d_oppisopimuskoulutus (id, koodi, selite_fi, selite_sv, selite_en, source)

VALUES
(1, N'1', N'Oppisopimuskoulutus', N'Läroavtalsutbildning', N'Apprenticeship training', N'p_lataa_d_oppisopimuskoulutus'),
(2, N'0', N'Ei oppisopimuskoulutus', N'Ej läroavtalsutbildning', N'Not apprenticeship training', N'p_lataa_d_oppisopimuskoulutus')

SET IDENTITY_INSERT dw.d_oppisopimuskoulutus OFF

